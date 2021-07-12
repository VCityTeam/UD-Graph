"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.$3dTilesCulling = $3dTilesCulling;
exports.pre3dTilesUpdate = pre3dTilesUpdate;
exports.computeNodeSSE = computeNodeSSE;
exports.init3dTilesLayer = init3dTilesLayer;
exports.process3dTilesNode = process3dTilesNode;
exports.$3dTilesSubdivisionControl = $3dTilesSubdivisionControl;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

var _typeof2 = _interopRequireDefault(require("@babel/runtime/helpers/typeof"));

var THREE = _interopRequireWildcard(require("three"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function requestNewTile(view, scheduler, geometryLayer, metadata, parent, redraw) {
  var command = {
    /* mandatory */
    view: view,
    requester: parent,
    layer: geometryLayer,
    priority: parent ? 1.0 / (parent.distance + 1) : 100,

    /* specific params */
    metadata: metadata,
    redraw: redraw
  };
  return scheduler.execute(command);
}

function getChildTiles(tile) {
  // only keep children that have the same layer and a valid tileId
  return tile.children.filter(function (n) {
    return n.layer == tile.layer && n.tileId;
  });
}

function subdivideNode(context, layer, node, cullingTest) {
  if (node.additiveRefinement) {
    // Additive refinement can only fetch visible children.
    _subdivideNodeAdditive(context, layer, node, cullingTest);
  } else {
    // Substractive refinement on the other hand requires to replace
    // node with all of its children
    _subdivideNodeSubstractive(context, layer, node);
  }
}

var tmpBox3 = new THREE.Box3();
var tmpSphere = new THREE.Sphere();

function boundingVolumeToExtent(crs, volume, transform) {
  if (volume.region) {
    var box = tmpBox3.copy(volume.region.box3D).applyMatrix4(volume.region.matrixWorld);
    return _Extent["default"].fromBox3(crs, box);
  } else if (volume.box) {
    var _box = tmpBox3.copy(volume.box).applyMatrix4(transform);

    return _Extent["default"].fromBox3(crs, _box);
  } else {
    var sphere = tmpSphere.copy(volume.sphere).applyMatrix4(transform);
    return new _Extent["default"](crs, {
      west: sphere.center.x - sphere.radius,
      east: sphere.center.x + sphere.radius,
      south: sphere.center.y - sphere.radius,
      north: sphere.center.y + sphere.radius
    });
  }
}

var tmpMatrix = new THREE.Matrix4();

function _subdivideNodeAdditive(context, layer, node, cullingTest) {
  var _iterator = _createForOfIteratorHelper(layer.tileset.tiles[node.tileId].children),
      _step;

  try {
    var _loop = function () {
      var child = _step.value;

      // child being downloaded => skip
      if (child.promise || child.loaded) {
        return "continue";
      } // 'child' is only metadata (it's *not* a THREE.Object3D). 'cullingTest' needs
      // a matrixWorld, so we compute it: it's node's matrixWorld x child's transform


      var overrideMatrixWorld = node.matrixWorld;

      if (child.transform) {
        overrideMatrixWorld = tmpMatrix.multiplyMatrices(node.matrixWorld, child.transform);
      }

      var isVisible = cullingTest ? !cullingTest(layer, context.camera, child, overrideMatrixWorld) : true; // child is not visible => skip

      if (!isVisible) {
        return "continue";
      }

      child.promise = requestNewTile(context.view, context.scheduler, layer, child, node, true).then(function (tile) {
        node.add(tile);
        tile.updateMatrixWorld();
        var extent = boundingVolumeToExtent(layer.extent.crs, tile.boundingVolume, tile.matrixWorld);
        tile.traverse(function (obj) {
          obj.extent = extent;
        });
        layer.onTileContentLoaded(tile);
        context.view.notifyChange(child);
        child.loaded = true;
        delete child.promise;
      });
    };

    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var _ret = _loop();

      if (_ret === "continue") continue;
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
}

function _subdivideNodeSubstractive(context, layer, node) {
  if (!node.pendingSubdivision && getChildTiles(node).length == 0) {
    var _ret2 = function () {
      var childrenTiles = layer.tileset.tiles[node.tileId].children;

      if (childrenTiles === undefined || childrenTiles.length === 0) {
        return {
          v: void 0
        };
      }

      node.pendingSubdivision = true;
      var promises = [];

      var _loop2 = function (i) {
        promises.push(requestNewTile(context.view, context.scheduler, layer, childrenTiles[i], node, false).then(function (tile) {
          childrenTiles[i].loaded = true;
          node.add(tile);
          tile.updateMatrixWorld();

          if (node.additiveRefinement) {
            context.view.notifyChange(node);
          }

          layer.tileset.tiles[tile.tileId].loaded = true;
          layer.onTileContentLoaded(tile);
        }));
      };

      for (var i = 0; i < childrenTiles.length; i++) {
        _loop2(i);
      }

      Promise.all(promises).then(function () {
        node.pendingSubdivision = false;
        context.view.notifyChange(node);
      });
    }();

    if ((0, _typeof2["default"])(_ret2) === "object") return _ret2.v;
  }
}

function $3dTilesCulling(layer, camera, node, tileMatrixWorld) {
  // For viewer Request Volume
  // https://github.com/AnalyticalGraphicsInc/3d-tiles-samples/tree/master/tilesets/TilesetWithRequestVolume
  if (node.viewerRequestVolume && node.viewerRequestVolume.viewerRequestVolumeCulling(camera, tileMatrixWorld)) {
    return true;
  } // For bounding volume


  if (node.boundingVolume && node.boundingVolume.boundingVolumeCulling(camera, tileMatrixWorld)) {
    return true;
  }

  return false;
} // Cleanup all 3dtiles|three.js starting from a given node n.
// n's children can be of 2 types:
//   - have a 'content' attribute -> it's a tileset and must
//     be cleaned with cleanup3dTileset()
//   - doesn't have 'content' -> it's a raw Object3D object,
//     and must be cleaned with _cleanupObject3D()


function cleanup3dTileset(layer, n) {
  var depth = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;
  // If this layer is not using additive refinement, we can only
  // clean a tile if all its neighbours are cleaned as well because
  // a tile can only be in 2 states:
  //   - displayed and no children displayed
  //   - hidden and all of its children displayed
  // So here we implement a conservative measure: if T is cleanable
  // we actually only clean its children tiles.
  var canCleanCompletely = n.additiveRefinement || depth > 0;

  for (var i = 0; i < n.children.length; i++) {
    // skip non-tiles elements
    if (!n.children[i].content) {
      if (canCleanCompletely) {
        n.children[i].traverse(_cleanupObject3D);
      }
    } else {
      cleanup3dTileset(layer, n.children[i], depth + 1);
    }
  }

  if (canCleanCompletely) {
    if (n.dispose) {
      n.dispose();
    }

    delete n.content;
    layer.tileset.tiles[n.tileId].loaded = false;
    n.remove.apply(n, (0, _toConsumableArray2["default"])(n.children)); // and finally remove from parent

    if (depth == 0 && n.parent) {
      n.parent.remove(n);
    }
  } else {
    var tiles = getChildTiles(n);
    n.remove.apply(n, (0, _toConsumableArray2["default"])(tiles));
  }
} // This function is used to cleanup a Object3D hierarchy.
// (no 3dtiles spectific code here because this is managed by cleanup3dTileset)


function _cleanupObject3D(n) {
  // all children of 'n' are raw Object3D
  var _iterator2 = _createForOfIteratorHelper(n.children),
      _step2;

  try {
    for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
      var child = _step2.value;

      _cleanupObject3D(child);
    } // free resources

  } catch (err) {
    _iterator2.e(err);
  } finally {
    _iterator2.f();
  }

  if (n.material) {
    // material can be either a THREE.Material object, or an array of
    // THREE.Material objects
    if (Array.isArray(n.material)) {
      var _iterator3 = _createForOfIteratorHelper(n.material),
          _step3;

      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var material = _step3.value;
          material.dispose();
        }
      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }
    } else {
      n.material.dispose();
    }
  }

  if (n.geometry) {
    n.geometry.dispose();
  }

  n.remove.apply(n, (0, _toConsumableArray2["default"])(n.children));
} // this is a layer


function pre3dTilesUpdate() {
  if (!this.visible) {
    return [];
  } // Elements removed are added in the layer._cleanableTiles list.
  // Since we simply push in this array, the first item is always
  // the oldest one.


  var now = Date.now();

  if (this._cleanableTiles.length && now - this._cleanableTiles[0].cleanableSince > this.cleanupDelay) {
    // Make sure we don't clean root tile
    this.root.cleanableSince = undefined;
    var i = 0;

    for (; i < this._cleanableTiles.length; i++) {
      var elt = this._cleanableTiles[i];

      if (now - elt.cleanableSince > this.cleanupDelay) {
        cleanup3dTileset(this, elt);
      } else {
        // later entries are younger
        break;
      }
    } // remove deleted elements from _cleanableTiles


    this._cleanableTiles.splice(0, i);
  }

  return [this.root];
}

var boundingVolumeBox = new THREE.Box3();
var boundingVolumeSphere = new THREE.Sphere();

function computeNodeSSE(camera, node) {
  node.distance = 0;

  if (node.boundingVolume.region) {
    boundingVolumeBox.copy(node.boundingVolume.region.box3D);
    boundingVolumeBox.applyMatrix4(node.boundingVolume.region.matrixWorld);
    node.distance = boundingVolumeBox.distanceToPoint(camera.camera3D.position);
  } else if (node.boundingVolume.box) {
    // boundingVolume.box is affected by matrixWorld
    boundingVolumeBox.copy(node.boundingVolume.box);
    boundingVolumeBox.applyMatrix4(node.matrixWorld);
    node.distance = boundingVolumeBox.distanceToPoint(camera.camera3D.position);
  } else if (node.boundingVolume.sphere) {
    // boundingVolume.sphere is affected by matrixWorld
    boundingVolumeSphere.copy(node.boundingVolume.sphere);
    boundingVolumeSphere.applyMatrix4(node.matrixWorld); // TODO: see https://github.com/iTowns/itowns/issues/800

    node.distance = Math.max(0.0, boundingVolumeSphere.distanceToPoint(camera.camera3D.position));
  } else {
    return Infinity;
  }

  if (node.distance === 0) {
    // This test is needed in case geometricError = distance = 0
    return Infinity;
  }

  return camera._preSSE * (node.geometricError / node.distance);
}

function init3dTilesLayer(view, scheduler, layer, rootTile) {
  return requestNewTile(view, scheduler, layer, rootTile, undefined, true).then(function (tile) {
    layer.object3d.add(tile);
    tile.updateMatrixWorld();
    layer.tileset.tiles[tile.tileId].loaded = true;
    layer.root = tile;
    layer.extent = boundingVolumeToExtent(layer.crs || view.referenceCrs, tile.boundingVolume, tile.matrixWorld);
    layer.onTileContentLoaded(tile);
  });
}

function setDisplayed(node, display) {
  // The geometry of the tile is not in node, but in node.content
  // To change the display state, we change node.content.visible instead of
  // node.material.visible
  if (node.content) {
    node.content.visible = display;
  }
}

function markForDeletion(layer, elt) {
  if (!elt.cleanableSince) {
    elt.cleanableSince = Date.now();

    layer._cleanableTiles.push(elt);
  }
}

function process3dTilesNode() {
  var cullingTest = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : $3dTilesCulling;
  var subdivisionTest = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : $3dTilesSubdivisionControl;
  return function (context, layer, node) {
    // early exit if parent's subdivision is in progress
    if (node.parent.pendingSubdivision && !node.parent.additiveRefinement) {
      node.visible = false;
      return undefined;
    } // do proper culling


    var isVisible = cullingTest ? !cullingTest(layer, context.camera, node, node.matrixWorld) : true;
    node.visible = isVisible;

    if (isVisible) {
      if (node.cleanableSince) {
        layer._cleanableTiles.splice(layer._cleanableTiles.indexOf(node), 1);

        node.cleanableSince = undefined;
      }

      var returnValue;

      if (node.pendingSubdivision || subdivisionTest(context, layer, node)) {
        subdivideNode(context, layer, node, cullingTest); // display iff children aren't ready

        setDisplayed(node, node.pendingSubdivision || node.additiveRefinement);
        returnValue = getChildTiles(node);
      } else {
        setDisplayed(node, true);

        var _iterator4 = _createForOfIteratorHelper(getChildTiles(node)),
            _step4;

        try {
          for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
            var n = _step4.value;
            n.visible = false;
            markForDeletion(layer, n);
          }
        } catch (err) {
          _iterator4.e(err);
        } finally {
          _iterator4.f();
        }
      }

      return returnValue;
    }

    markForDeletion(layer, node);
  };
}

function $3dTilesSubdivisionControl(context, layer, node) {
  if (layer.tileset.tiles[node.tileId].children === undefined) {
    return false;
  }

  if (layer.tileset.tiles[node.tileId].isTileset) {
    return true;
  }

  var sse = computeNodeSSE(context.camera, node);
  return sse > layer.sseThreshold;
}