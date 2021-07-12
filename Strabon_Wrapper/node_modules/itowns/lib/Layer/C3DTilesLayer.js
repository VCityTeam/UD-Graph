"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _GeometryLayer2 = _interopRequireDefault(require("./GeometryLayer"));

var _dTilesProcessing = require("../Process/3dTilesProcessing");

var _C3DTileset = _interopRequireDefault(require("../Core/3DTiles/C3DTileset"));

var _C3DTExtensions = _interopRequireDefault(require("../Core/3DTiles/C3DTExtensions"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var _update = (0, _dTilesProcessing.process3dTilesNode)();

var C3DTilesLayer = /*#__PURE__*/function (_GeometryLayer) {
  (0, _inherits2["default"])(C3DTilesLayer, _GeometryLayer);

  var _super = _createSuper(C3DTilesLayer);

  /**
   * Constructs a new instance of 3d tiles layer.
   * @constructor
   * @extends GeometryLayer
   *
   * @example
   * // Create a new Layer 3d-tiles For DiscreteLOD
   * const l3dt = new C3DTilesLayer('3dtiles', {
   *      name: '3dtl',
   *      source: new C3DTilesSource({
   *           url: 'https://tileset.json'
   *      })
   * }, view);
   * View.prototype.addLayer.call(view, l3dt);
   *
   * @param      {string}  id - The id of the layer, that should be unique.
   *     It is not mandatory, but an error will be emitted if this layer is
   *     added a
   * {@link View} that already has a layer going by that id.
   * @param      {object}  config   configuration, all elements in it
   * will be merged as is in the layer.
   * @param {C3TilesSource} config.source The source of 3d Tiles.
   *
   * name.
   * @param  {View}  view  The view
   */
  function C3DTilesLayer(id, config, view) {
    var _this;

    (0, _classCallCheck2["default"])(this, C3DTilesLayer);
    _this = _super.call(this, id, new THREE.Group(), {
      source: config.source
    });
    _this.isC3DTilesLayer = true;
    _this.sseThreshold = config.sseThreshold || 16;
    _this.cleanupDelay = config.cleanupDelay || 1000;

    _this.onTileContentLoaded = config.onTileContentLoaded || function () {};

    _this.protocol = '3d-tiles'; // custom cesium shaders are not functional;

    _this.overrideMaterials = config.overrideMaterials !== undefined ? config.overrideMaterials : true;
    _this.name = config.name;
    _this.registeredExtensions = config.registeredExtensions || new _C3DTExtensions["default"]();
    _this._cleanableTiles = [];

    var resolve = _this.addInitializationStep();

    _this.source.whenReady.then(function (tileset) {
      _this.tileset = new _C3DTileset["default"](tileset, _this.source.baseUrl, _this.registeredExtensions); // Verify that extensions of the tileset have been registered in the layer

      if (_this.tileset.extensionsUsed) {
        var _iterator = _createForOfIteratorHelper(_this.tileset.extensionsUsed),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var extensionUsed = _step.value;

            // if current extension is not registered
            if (!_this.registeredExtensions.isExtensionRegistered(extensionUsed)) {
              // if it is required to load the tileset
              if (_this.tileset.extensionsRequired && _this.tileset.extensionsRequired.includes(extensionUsed)) {
                console.error("3D Tiles tileset required extension \"".concat(extensionUsed, "\" must be registered to the 3D Tiles layer of iTowns to be parsed and used."));
              } else {
                console.warn("3D Tiles tileset used extension \"".concat(extensionUsed, "\" must be registered to the 3D Tiles layer of iTowns to be parsed and used."));
              }
            }
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      } // TODO: Move all init3dTilesLayer code to constructor


      (0, _dTilesProcessing.init3dTilesLayer)(view, view.mainLoop.scheduler, (0, _assertThisInitialized2["default"])(_this), tileset.root).then(resolve);
    });

    return _this;
  }

  (0, _createClass2["default"])(C3DTilesLayer, [{
    key: "preUpdate",
    value: function preUpdate() {
      return _dTilesProcessing.pre3dTilesUpdate.bind(this)();
    }
  }, {
    key: "update",
    value: function update(context, layer, node) {
      return _update(context, layer, node);
    }
  }, {
    key: "getObjectToUpdateForAttachedLayers",
    value: function getObjectToUpdateForAttachedLayers(meta) {
      if (meta.content) {
        var result = [];
        meta.content.traverse(function (obj) {
          if (obj.isObject3D && obj.material && obj.layer == meta.layer) {
            result.push(obj);
          }
        });
        var p = meta.parent;

        if (p && p.content) {
          return {
            elements: result,
            parent: p.content
          };
        } else {
          return {
            elements: result
          };
        }
      }
    }
    /**
     * Finds the batch table of an object in a 3D Tiles layer. This is
     * for instance needed when picking because we pick the geometric
     * object which is not at the same level in the layer structure as
     * the batch table. More details here on itowns internal
     * organization of 3DTiles:
     *  https://github.com/MEPP-team/RICT/blob/master/Doc/iTowns/Doc.md#itowns-internal-organisation-of-3d-tiles-data
     * @param {THREE.Object3D} object - a 3D geometric object
     * @returns {C3DTBatchTable} - the batch table of the object
     */

  }, {
    key: "findBatchTable",
    value: function findBatchTable(object) {
      if (object.batchTable) {
        return object.batchTable;
      }

      if (object.parent) {
        return this.findBatchTable(object.parent);
      }
    }
    /**
     * Gets semantic information from batch table and batch table extensions
     * of an intersected feature.
     * @param {Array} intersects - @return An array containing all
     * targets picked under specified coordinates. Intersects can be
     * computed with view.pickObjectsAt(..). See fillHTMLWithPickingInfo()
     * in 3dTilesHelper.js for an example.
     * @returns {Object} - an object containing the batch id, the
     * information from the batch table and from the extension of the batch
     * table for an intersected feature.
     */

  }, {
    key: "getInfoFromIntersectObject",
    value: function getInfoFromIntersectObject(intersects) {
      var resultInfo = {};
      var batchID = -1;
      var batchTable = {}; // First, we get the ID and the batch table of the intersected object.
      // (the semantic information about a feature is located in its batch
      // table (see 3D Tiles specification).

      for (var i = 0; i < intersects.length; i++) {
        // interAttributes are glTF attributes of b3dm tiles (i.e.
        // position, normal, batch id)
        var interAttributes = intersects[i].object.geometry.attributes;

        if (interAttributes && interAttributes._BATCHID) {
          // face is a Face3 object of THREE which is a
          // triangular face. face.a is its first vertex
          var vertex = intersects[i].face.a; // get batch id of the face

          batchID = interAttributes._BATCHID.array[vertex];
          batchTable = this.findBatchTable(intersects[i].object);
          break;
        }
      }

      if (batchID === -1) {
        return;
      }

      resultInfo.batchID = batchID; // get information from batch table (including from its extension)

      Object.assign(resultInfo, batchTable.getInfoById(batchID));
      return resultInfo;
    }
  }]);
  return C3DTilesLayer;
}(_GeometryLayer2["default"]);

var _default = C3DTilesLayer;
exports["default"] = _default;