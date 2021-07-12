"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _TiledGeometryLayer2 = _interopRequireDefault(require("../../../Layer/TiledGeometryLayer"));

var _Extent = require("../../Geographic/Extent");

var _Crs = _interopRequireDefault(require("../../Geographic/Crs"));

var _PlanarTileBuilder = _interopRequireDefault(require("./PlanarTileBuilder"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @property {boolean} isPlanarLayer - Used to checkout whether this layer is a
 * PlanarLayer. Default is true. You should not change this, as it is used
 * internally for optimisation.
 */
var PlanarLayer = /*#__PURE__*/function (_TiledGeometryLayer) {
  (0, _inherits2["default"])(PlanarLayer, _TiledGeometryLayer);

  var _super = _createSuper(PlanarLayer);

  /**
   * A {@link TiledGeometryLayer} to use with a {@link PlanarView}. It has
   * specific method for updating and subdivising its grid.
   *
   * @constructor
   * @extends TiledGeometryLayer
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Extent} extent - The extent to define the layer within.
   * @param {THREE.Object3d} [object3d=THREE.Group] - The object3d used to
   * contain the geometry of the TiledGeometryLayer. It is usually a
   * `THREE.Group`, but it can be anything inheriting from a `THREE.Object3d`.
   * @param {Object} [config] - Optional configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name.
   * @param {number} [config.maxSubdivisionLevel=5] - Maximum subdivision
   * level for this tiled layer.
   * @param {number} [config.maxDeltaElevationLevel=4] - Maximum delta between
   * two elevations tile.
   *
   * @throws {Error} `object3d` must be a valid `THREE.Object3d`.
   */
  function PlanarLayer(id, extent, object3d) {
    var _this;

    var config = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};
    (0, _classCallCheck2["default"])(this, PlanarLayer);

    var tms = _Crs["default"].formatToTms(extent.crs);

    if (!_Extent.globalExtentTMS.get(extent.crs)) {
      // Add new global extent for this new crs projection.
      _Extent.globalExtentTMS.set(extent.crs, extent);
    }

    config.tileMatrixSets = [tms];
    _this = _super.call(this, id, object3d || new THREE.Group(), [extent], new _PlanarTileBuilder["default"]({
      crs: extent.crs
    }), config);
    _this.isPlanarLayer = true;
    _this.extent = extent;
    _this.minSubdivisionLevel = _this.minSubdivisionLevel == undefined ? 0 : _this.minSubdivisionLevel;
    _this.maxSubdivisionLevel = _this.maxSubdivisionLevel == undefined ? 5 : _this.maxSubdivisionLevel;
    _this.maxDeltaElevation = _this.maxDeltaElevation || 4.0;
    return _this;
  }

  return PlanarLayer;
}(_TiledGeometryLayer2["default"]);

var _default = PlanarLayer;
exports["default"] = _default;