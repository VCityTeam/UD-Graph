"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _GeometryLayer2 = _interopRequireDefault(require("./GeometryLayer"));

var _InfoLayer = require("./InfoLayer");

var _Picking = _interopRequireDefault(require("../Core/Picking"));

var _convertToTile = _interopRequireDefault(require("../Converter/convertToTile"));

var _ObjectRemovalHelper = _interopRequireDefault(require("../Process/ObjectRemovalHelper"));

var _LayeredMaterialNodeProcessing = require("../Process/LayeredMaterialNodeProcessing");

var _Layer = require("./Layer");

var _Cache = require("../Core/Scheduler/Cache");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var subdivisionVector = new THREE.Vector3();
var boundingSphereCenter = new THREE.Vector3();
/**
 * @property {InfoTiledGeometryLayer} info - Status information of layer
 * @property {boolean} isTiledGeometryLayer - Used to checkout whether this
 * layer is a TiledGeometryLayer. Default is true. You should not change this,
 * as it is used internally for optimisation.
 *
 */

var TiledGeometryLayer = /*#__PURE__*/function (_GeometryLayer) {
  (0, _inherits2["default"])(TiledGeometryLayer, _GeometryLayer);

  var _super = _createSuper(TiledGeometryLayer);

  /**
   * A layer extending the {@link GeometryLayer}, but with a tiling notion.
   *
   * `TiledGeometryLayer` is the ground where `ColorLayer` and `ElevationLayer` are attached.
   * `TiledGeometryLayer` is a quadtree data structure. At zoom 0,
   * there is a single tile for the whole earth. At zoom level 1,
   * the single tile splits into 4 tiles (2x2 tile square).
   * Each zoom level quadtree divides the geometry tiles of the one before it.
   * The camera distance determines how the tiles are subdivided for optimal data display.
   *
   * Some `GeometryLayer` can also be attached to the `TiledGeometryLayer` if they want to take advantage of the quadtree.
   *
   * ![tiled geometry](/docs/static/images/tiledGeometry.jpeg)
   * _In `GlobeView`, **red lines** represents the **WGS84 grid** and **orange lines** the **Pseudo-mercator grid**._
   * _In this picture, there are tiles with 3 different zoom/levels._
   *
   * The zoom/level is based on [tiled web map](https://en.wikipedia.org/wiki/Tiled_web_map).
   * It corresponds at meters by pixel. If the projection tile exceeds a certain pixel size (on screen)
   * then it is subdivided into 4 tiles with a zoom greater than 1.
   *
   * @constructor
   * @extends GeometryLayer
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {THREE.Object3d} object3d - The object3d used to contain the
   * geometry of the TiledGeometryLayer. It is usually a `THREE.Group`, but it
   * can be anything inheriting from a `THREE.Object3d`.
   * @param {Array} schemeTile - extents Array of root tiles
   * @param {Object} builder - builder geometry object
   * @param {Object} [config] - Optional configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name.
   * @param {Source} [config.source] - Description and options of the source.
   *
   * @throws {Error} `object3d` must be a valid `THREE.Object3d`.
   */
  function TiledGeometryLayer(id, object3d, schemeTile, builder, config) {
    var _this;

    (0, _classCallCheck2["default"])(this, TiledGeometryLayer);
    // cacheLifeTime = CACHE_POLICIES.INFINITE because the cache is handled by the builder
    config.cacheLifeTime = _Cache.CACHE_POLICIES.INFINITE;
    config.source = false;
    _this = _super.call(this, id, object3d, config);
    _this.isTiledGeometryLayer = true;
    _this.protocol = 'tile';
    _this.sseSubdivisionThreshold = _this.sseSubdivisionThreshold || 1.0;
    _this.schemeTile = schemeTile;
    _this.builder = builder;
    _this.info = new _InfoLayer.InfoTiledGeometryLayer((0, _assertThisInitialized2["default"])(_this));

    if (!_this.schemeTile) {
      throw new Error("Cannot init tiled layer without schemeTile for layer ".concat(_this.id));
    }

    if (!_this.builder) {
      throw new Error("Cannot init tiled layer without builder for layer ".concat(_this.id));
    }

    _this.level0Nodes = [];
    var promises = [];

    var _iterator = _createForOfIteratorHelper(_this.schemeTile),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var root = _step.value;
        promises.push(_this.convert(undefined, root));
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    _this._promises.push(Promise.all(promises).then(function (level0s) {
      var _this$object3d;

      _this.level0Nodes = level0s;

      (_this$object3d = _this.object3d).add.apply(_this$object3d, (0, _toConsumableArray2["default"])(level0s));

      _this.object3d.updateMatrixWorld();
    }));

    return _this;
  }
  /**
   * Picking method for this layer. It uses the {@link Picking#pickTilesAt}
   * method.
   *
   * @param {View} view - The view instance.
   * @param {Object} coordinates - The coordinates to pick in the view. It
   * should have at least `x` and `y` properties.
   * @param {number} radius - Radius of the picking circle.
   * @param {Array} target - Array to push picking result.
   *
   * @return {Array} An array containing all targets picked under the
   * specified coordinates.
   */


  (0, _createClass2["default"])(TiledGeometryLayer, [{
    key: "pickObjectsAt",
    value: function pickObjectsAt(view, coordinates) {
      var radius = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : this.options.defaultPickingRadius;
      var target = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : [];
      return _Picking["default"].pickTilesAt(view, coordinates, radius, this, target);
    }
    /**
     * Does pre-update work on the context:
     * <ul>
     *  <li>update the `colorLayers` and `elevationLayers`</li>
     *  <li>update the `maxElevationLevel`</li>
     * </ul>
     *
     * Once this work is done, it returns a list of nodes to update. Depending
     * on the origin of `sources`, it can return a few things:
     * <ul>
     *  <li>if `sources` is empty, it returns the first node of the layer
     *  (stored as `level0Nodes`), which will trigger the update of the whole
     *  tree</li>
     *  <li>if the update is triggered by a camera move, the whole tree is
     *  returned too</li>
     *  <li>if `source.layer` is this layer, it means that `source` is a node; a
     *  common ancestor will be found if there are multiple sources, with the
     *  default common ancestor being the first source itself</li>
     *  <li>else it returns the whole tree</li>
     * </ul>
     *
     * @param {Object} context - The context of the update; see the {@link
     * MainLoop} for more informations.
     * @param {Set<GeometryLayer|TileMesh>} sources - A list of sources to
     * generate a list of nodes to update.
     *
     * @return {TileMesh[]} The array of nodes to update.
     */

  }, {
    key: "preUpdate",
    value: function preUpdate(context, sources) {
      var _this2 = this;

      if (sources.has(undefined) || sources.size == 0) {
        return this.level0Nodes;
      }

      context.colorLayers = context.view.getLayers(function (l, a) {
        return a && a.id == _this2.id && l.isColorLayer;
      });
      context.elevationLayers = context.view.getLayers(function (l, a) {
        return a && a.id == _this2.id && l.isElevationLayer;
      });
      context.maxElevationLevel = -1;

      var _iterator2 = _createForOfIteratorHelper(context.elevationLayers),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var e = _step2.value;
          context.maxElevationLevel = Math.max(e.source.zoom.max, context.maxElevationLevel);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      if (context.maxElevationLevel == -1) {
        context.maxElevationLevel = Infinity;
      } // Prepare ColorLayer sequence order
      // In this moment, there is only one color layers sequence, because they are attached to tileLayer.
      // In future, the sequence must be returned by parent geometry layer.


      this.colorLayersOrder = _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(context.colorLayers);
      var commonAncestor;

      var _iterator3 = _createForOfIteratorHelper(sources.values()),
          _step3;

      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var source = _step3.value;

          if (source.isCamera) {
            // if the change is caused by a camera move, no need to bother
            // to find common ancestor: we need to update the whole tree:
            // some invisible tiles may now be visible
            return this.level0Nodes;
          }

          if (source.layer === this) {
            if (!commonAncestor) {
              commonAncestor = source;
            } else {
              commonAncestor = source.findCommonAncestor(commonAncestor);

              if (!commonAncestor) {
                return this.level0Nodes;
              }
            }

            if (commonAncestor.material == null) {
              commonAncestor = undefined;
            }
          }
        }
      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }

      if (commonAncestor) {
        return [commonAncestor];
      } else {
        return this.level0Nodes;
      }
    }
    /**
     * Update a node of this layer. The node will not be updated if:
     * <ul>
     *  <li>it does not have a parent, then it is removed</li>
     *  <li>its parent is being subdivided</li>
     *  <li>is not visible in the camera</li>
     * </ul>
     *
     * @param {Object} context - The context of the update; see the {@link
     * MainLoop} for more informations.
     * @param {Layer} layer - Parameter to be removed once all update methods
     * have been aligned.
     * @param {TileMesh} node - The node to update.
     *
     * @returns {Object}
     */

  }, {
    key: "update",
    value: function update(context, layer, node) {
      var _this3 = this;

      if (!node.parent) {
        return _ObjectRemovalHelper["default"].removeChildrenAndCleanup(this, node);
      } // early exit if parent' subdivision is in progress


      if (node.parent.pendingSubdivision) {
        node.visible = false;
        node.material.visible = false;
        this.info.update(node);
        return undefined;
      } // do proper culling


      node.visible = !this.culling(node, context.camera);

      if (node.visible) {
        var requestChildrenUpdate = false;
        node.material.visible = true;
        this.info.update(node);

        if (node.pendingSubdivision || TiledGeometryLayer.hasEnoughTexturesToSubdivide(context, node) && this.subdivision(context, this, node)) {
          this.subdivideNode(context, node); // display iff children aren't ready

          node.material.visible = node.pendingSubdivision;
          this.info.update(node);
          requestChildrenUpdate = true;
        }

        if (node.material.visible) {
          if (!requestChildrenUpdate) {
            return _ObjectRemovalHelper["default"].removeChildren(this, node);
          }
        }

        return requestChildrenUpdate ? node.children.filter(function (n) {
          return n.layer == _this3;
        }) : undefined;
      }

      node.material.visible = false;
      this.info.update(node);
      return _ObjectRemovalHelper["default"].removeChildren(this, node);
    }
  }, {
    key: "convert",
    value: function convert(requester, extent) {
      return _convertToTile["default"].convert(requester, extent, this);
    }
  }, {
    key: "countColorLayersTextures",
    value: function countColorLayersTextures() {
      return arguments.length;
    } // eslint-disable-next-line

  }, {
    key: "culling",
    value: function culling(node, camera) {
      return !camera.isBox3Visible(node.obb.box3D, node.obb.matrixWorld);
    }
    /**
     * Tell if a node has enough elevation or color textures to subdivide.
     * Subdivision is prevented if:
     * <ul>
     *  <li>the node is covered by at least one elevation layer and if the node
     *  doesn't have an elevation texture yet</li>
     *  <li>a color texture is missing</li>
     * </ul>
     *
     * @param {Object} context - The context of the update; see the {@link
     * MainLoop} for more informations.
     * @param {TileMesh} node - The node to subdivide.
     *
     * @returns {boolean} False if the node can not be subdivided, true
     * otherwise.
     */

  }, {
    key: "subdivideNode",
    value:
    /**
     * Subdivides a node of this layer. If the node is currently in the process
     * of subdivision, it will not do anything here. The subdivision of a node
     * will occur in four part, to create a quadtree. The extent of the node
     * will be divided in four parts: north-west, north-east, south-west and
     * south-east. Once all four nodes are created, they will be added to the
     * current node and the view of the context will be notified of this change.
     *
     * @param {Object} context - The context of the update; see the {@link
     * MainLoop} for more informations.
     * @param {TileMesh} node - The node to subdivide.
     * @return {Promise}  { description_of_the_return_value }
     */
    function subdivideNode(context, node) {
      var _this4 = this;

      if (!node.pendingSubdivision && !node.children.some(function (n) {
        return n.layer == _this4;
      })) {
        var extents = node.extent.subdivision(); // TODO: pendingSubdivision mechanism is fragile, get rid of it

        node.pendingSubdivision = true;
        var command = {
          /* mandatory */
          view: context.view,
          requester: node,
          layer: this,
          priority: 10000,

          /* specific params */
          extentsSource: extents,
          redraw: false
        };
        return context.scheduler.execute(command).then(function (children) {
          var _iterator4 = _createForOfIteratorHelper(children),
              _step4;

          try {
            for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
              var child = _step4.value;
              node.add(child);
              child.updateMatrixWorld(true);
            }
          } catch (err) {
            _iterator4.e(err);
          } finally {
            _iterator4.f();
          }

          node.pendingSubdivision = false;
          context.view.notifyChange(node, false);
        }, function (err) {
          node.pendingSubdivision = false;

          if (!err.isCancelledCommandException) {
            throw new Error(err);
          }
        });
      }
    }
    /**
     * Test the subdvision of a node, compared to this layer.
     *
     * @param {Object} context - The context of the update; see the {@link
     * MainLoop} for more informations.
     * @param {PlanarLayer} layer - This layer, parameter to be removed.
     * @param {TileMesh} node - The node to test.
     *
     * @return {boolean} - True if the node is subdivisable, otherwise false.
     */

  }, {
    key: "subdivision",
    value: function subdivision(context, layer, node) {
      if (node.level < this.minSubdivisionLevel) {
        return true;
      }

      if (this.maxSubdivisionLevel <= node.level) {
        return false;
      } // Prevent to subdivise the node if the current elevation level
      // we must avoid a tile, with level 20, inherits a level 3 elevation texture.
      // The induced geometric error is much too large and distorts the SSE


      var nodeLayer = node.material.getElevationLayer();

      if (nodeLayer) {
        var currentTexture = nodeLayer.textures[0];

        if (currentTexture && currentTexture.extent) {
          var offsetScale = nodeLayer.offsetScales[0];
          var ratio = offsetScale.z; // ratio is node size / texture size

          if (ratio < 1 / Math.pow(2, this.maxDeltaElevationLevel)) {
            return false;
          }
        }
      }

      subdivisionVector.setFromMatrixScale(node.matrixWorld);
      boundingSphereCenter.copy(node.boundingSphere.center).applyMatrix4(node.matrixWorld);
      var distance = Math.max(0.0, context.camera.camera3D.position.distanceTo(boundingSphereCenter) - node.boundingSphere.radius * subdivisionVector.x); // Size projection on pixel of bounding

      if (context.camera.camera3D.isOrthographicCamera) {
        var camera3D = context.camera.camera3D;
        var preSSE = context.camera._preSSE * 2 * camera3D.zoom / (camera3D.top - camera3D.bottom);
        node.screenSize = preSSE * node.boundingSphere.radius * subdivisionVector.x;
      } else {
        node.screenSize = context.camera._preSSE * (2 * node.boundingSphere.radius * subdivisionVector.x) / distance;
      } // The screen space error is calculated to have a correct texture display.
      // For the projection of a texture's texel to be less than or equal to one pixel


      var sse = node.screenSize / (_LayeredMaterialNodeProcessing.SIZE_DIAGONAL_TEXTURE * 2);
      return this.sseSubdivisionThreshold < sse;
    }
  }], [{
    key: "hasEnoughTexturesToSubdivide",
    value: function hasEnoughTexturesToSubdivide(context, node) {
      var layerUpdateState = node.layerUpdateState || {};
      var nodeLayer = node.material.getElevationLayer();

      var _iterator5 = _createForOfIteratorHelper(context.elevationLayers),
          _step5;

      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          var e = _step5.value;
          var extents = node.getExtentsByProjection(e.crs);
          var zoom = extents[0].zoom;

          if (zoom > e.zoom.max || zoom < e.zoom.min) {
            continue;
          }

          if (!e.frozen && e.ready && e.source.extentInsideLimit(node.extent, zoom) && (!nodeLayer || nodeLayer.level < 0)) {
            // no stop subdivision in the case of a loading error
            if (layerUpdateState[e.id] && layerUpdateState[e.id].inError()) {
              continue;
            }

            return false;
          }
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }

      var _iterator6 = _createForOfIteratorHelper(context.colorLayers),
          _step6;

      try {
        for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
          var c = _step6.value;

          if (c.frozen || !c.visible || !c.ready) {
            continue;
          }

          var _extents = node.getExtentsByProjection(c.crs);

          var _zoom = _extents[0].zoom;

          if (_zoom > c.zoom.max || _zoom < c.zoom.min) {
            continue;
          } // no stop subdivision in the case of a loading error


          if (layerUpdateState[c.id] && layerUpdateState[c.id].inError()) {
            continue;
          }

          nodeLayer = node.material.getLayer(c.id);

          if (c.source.extentInsideLimit(node.extent, _zoom) && (!nodeLayer || nodeLayer.level < 0)) {
            return false;
          }
        }
      } catch (err) {
        _iterator6.e(err);
      } finally {
        _iterator6.f();
      }

      return true;
    }
  }]);
  return TiledGeometryLayer;
}(_GeometryLayer2["default"]);

var _default = TiledGeometryLayer;
exports["default"] = _default;