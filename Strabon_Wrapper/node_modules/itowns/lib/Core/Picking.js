"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _RenderMode = _interopRequireDefault(require("../Renderer/RenderMode"));

var _LayeredMaterial = require("../Renderer/LayeredMaterial");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function hideEverythingElse(view) {
  var threejsLayer = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;
  // We want to render only 'object' and its hierarchy.
  // So if it uses threejsLayer defined -> force it on the camera
  // (or use the default one: 0)
  var prev = view.camera.camera3D.layers.mask;
  view.camera.camera3D.layers.mask = 1 << threejsLayer;
  return function () {
    view.camera.camera3D.layers.mask = prev;
  };
}

var depthRGBA = new THREE.Vector4(); // TileMesh picking support function

function screenCoordsToNodeId(view, tileLayer, viewCoords) {
  var radius = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 0;
  var dim = view.mainLoop.gfxEngine.getWindowSize();
  viewCoords = viewCoords || new THREE.Vector2(Math.floor(dim.x / 2), Math.floor(dim.y / 2));
  var restore = tileLayer.level0Nodes.map(function (n) {
    return _RenderMode["default"].push(n, _RenderMode["default"].MODES.ID);
  });
  var undoHide = hideEverythingElse(view, tileLayer.object3d, tileLayer.threejsLayer);
  var buffer = view.mainLoop.gfxEngine.renderViewToBuffer({
    camera: view.camera,
    scene: tileLayer.object3d
  }, {
    x: viewCoords.x - radius,
    y: viewCoords.y - radius,
    width: 1 + radius * 2,
    height: 1 + radius * 2
  });
  undoHide();
  restore.forEach(function (r) {
    return r();
  });
  var ids = [];
  traversePickingCircle(radius, function (x, y) {
    var idx = (y * 2 * radius + x) * 4;
    var data = buffer.slice(idx, idx + 4 || undefined);
    depthRGBA.fromArray(data).divideScalar(255.0);
    var unpack = (0, _LayeredMaterial.unpack1K)(depthRGBA, Math.pow(256, 3));

    var _id = Math.round(unpack);

    if (!ids.includes(_id)) {
      ids.push(_id);
    }
  });
  return ids;
}

function traversePickingCircle(radius, callback) {
  // iterate on radius so we get closer to the mouse
  // results first.
  // Result traversal order for radius=2
  // --3--
  // -323-
  // 32123
  // -323
  // --3--
  var prevSq;

  for (var r = 0; r <= radius; r++) {
    var sq = r * r;

    for (var x = -r; x <= r; x++) {
      var sqx = x * x;

      for (var y = -r; y <= r; y++) {
        var dist = sqx + y * y; // skip if too far

        if (dist > sq) {
          continue;
        } // skip if belongs to previous


        if (dist <= prevSq) {
          continue;
        }

        if (callback(x, y) === false) {
          return;
        }
      }
    }

    prevSq = sq;
  }
}

function findLayerInParent(obj) {
  if (obj.layer) {
    return obj.layer;
  }

  if (obj.parent) {
    return findLayerInParent(obj.parent);
  }
}

var raycaster = new THREE.Raycaster();
/**
 * @module Picking
 *
 * Implement various picking methods for geometry layers.
 * These methods are not meant to be used directly, see View.pickObjectsAt
 * instead.
 *
 * All the methods here takes the same parameters:
 *   - the View instance
 *   - view coordinates (in pixels) where picking should be done
 *   - radius (in pixels) of the picking circle
 *   - layer: the geometry layer used for picking
 */

var _default = {
  pickTilesAt: function pickTilesAt(view, viewCoords, radius, layer) {
    var results = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : [];

    var _ids = screenCoordsToNodeId(view, layer, viewCoords, radius);

    var extractResult = function (node) {
      if (_ids.includes(node.id) && node.isTileMesh) {
        results.push({
          object: node,
          layer: layer
        });
      }
    };

    var _iterator = _createForOfIteratorHelper(layer.level0Nodes),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var n = _step.value;
        n.traverse(extractResult);
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    return results;
  },
  pickPointsAt: function pickPointsAt(view, viewCoords, radius, layer) {
    var result = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : [];

    if (!layer.root) {
      return;
    } // enable picking mode for points material


    layer.object3d.traverse(function (o) {
      if (o.isPoints && o.baseId) {
        o.material.enablePicking(true);
      }
    });
    var undoHide = hideEverythingElse(view, layer.object3d, layer.threejsLayer); // render 1 pixel
    // TODO: support more than 1 pixel selection

    var buffer = view.mainLoop.gfxEngine.renderViewToBuffer({
      camera: view.camera,
      scene: layer.object3d
    }, {
      x: viewCoords.x - radius,
      y: viewCoords.y - radius,
      width: 1 + radius * 2,
      height: 1 + radius * 2
    });
    undoHide();
    var candidates = [];
    traversePickingCircle(radius, function (x, y) {
      var idx = (y * 2 * radius + x) * 4;
      var data = buffer.slice(idx, idx + 4); // see PotreeProvider and the construction of unique_id

      var objId = data[0] << 8 | data[1];
      var index = data[2] << 8 | data[3];
      var r = {
        objId: objId,
        index: index
      };

      for (var i = 0; i < candidates.length; i++) {
        if (candidates[i].objId == r.objId && candidates[i].index == r.index) {
          return;
        }
      }

      candidates.push(r);
    });
    layer.object3d.traverse(function (o) {
      if (o.isPoints && o.baseId) {
        // disable picking mode
        o.material.enablePicking(false); // if baseId matches objId, the clicked point belongs to `o`

        for (var i = 0; i < candidates.length; i++) {
          if (candidates[i].objId == o.baseId) {
            result.push({
              object: o,
              index: candidates[i].index,
              layer: layer
            });
          }
        }
      }
    });
    return result;
  },

  /*
   * Default picking method. Uses THREE.Raycaster
   */
  pickObjectsAt: function pickObjectsAt(view, viewCoords, radius, object) {
    var target = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : [];
    var threejsLayer = arguments.length > 5 ? arguments[5] : undefined;

    if (threejsLayer !== undefined) {
      raycaster.layers.set(threejsLayer);
    } else {
      raycaster.layers.enableAll();
    }

    if (radius < 0) {
      var _normalized = view.viewToNormalizedCoords(viewCoords);

      raycaster.setFromCamera(_normalized, view.camera.camera3D);
      var intersects = raycaster.intersectObject(object, true);

      var _iterator2 = _createForOfIteratorHelper(intersects),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var inter = _step2.value;
          inter.layer = findLayerInParent(inter.object);
          target.push(inter);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      return target;
    } // Instead of doing N raycast (1 per x,y returned by traversePickingCircle),
    // we force render the zone of interest.
    // Then we'll only do raycasting for the pixels where something was drawn.


    var zone = {
      x: viewCoords.x - radius,
      y: viewCoords.y - radius,
      width: 1 + radius * 2,
      height: 1 + radius * 2
    };
    var pixels = view.mainLoop.gfxEngine.renderViewToBuffer({
      scene: object,
      camera: view.camera
    }, zone);
    var clearColor = new THREE.Color();
    view.mainLoop.gfxEngine.renderer.getClearColor(clearColor);
    var clearR = Math.round(255 * clearColor.r);
    var clearG = Math.round(255 * clearColor.g);
    var clearB = Math.round(255 * clearColor.b); // Raycaster use NDC coordinate

    var normalized = view.viewToNormalizedCoords(viewCoords);
    var tmp = normalized.clone();
    traversePickingCircle(radius, function (x, y) {
      // x, y are offset from the center of the picking circle,
      // and pixels is a square where 0, 0 is the top-left corner.
      // So we need to shift x,y by radius.
      var offset = ((y + radius) * (radius * 2 + 1) + (x + radius)) * 4;
      var r = pixels[offset];
      var g = pixels[offset + 1];
      var b = pixels[offset + 2]; // Use approx. test to avoid rounding error or to behave
      // differently depending on hardware rounding mode.

      if (Math.abs(clearR - r) <= 1 && Math.abs(clearG - g) <= 1 && Math.abs(clearB - b) <= 1) {
        // skip because nothing has been rendered here
        return;
      } // Perform raycasting


      tmp.setX(normalized.x + x / view.camera.width).setY(normalized.y + y / view.camera.height);
      raycaster.setFromCamera(tmp, view.camera.camera3D);
      var intersects = raycaster.intersectObject(object, true);

      var _iterator3 = _createForOfIteratorHelper(intersects),
          _step3;

      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var _inter = _step3.value;
          _inter.layer = findLayerInParent(_inter.object);
          target.push(_inter);
        } // Stop at first hit

      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }

      return target.length == 0;
    });
    return target;
  }
};
exports["default"] = _default;