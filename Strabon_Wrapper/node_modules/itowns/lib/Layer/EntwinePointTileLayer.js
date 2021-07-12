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

var _EntwinePointTileNode = _interopRequireDefault(require("../Core/EntwinePointTileNode"));

var _PointCloudLayer2 = _interopRequireDefault(require("./PointCloudLayer"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var bboxMesh = new THREE.Mesh();
var box3 = new THREE.Box3();
bboxMesh.geometry.boundingBox = box3;
/**
 * @property {boolean} isEntwinePointTileLayer - Used to checkout whether this
 * layer is a EntwinePointTileLayer. Default is `true`. You should not change
 * this, as it is used internally for optimisation.
 */

var EntwinePointTileLayer = /*#__PURE__*/function (_PointCloudLayer) {
  (0, _inherits2["default"])(EntwinePointTileLayer, _PointCloudLayer);

  var _super = _createSuper(EntwinePointTileLayer);

  /**
   * Constructs a new instance of Entwine Point Tile layer.
   *
   * @constructor
   * @extends PointCloudLayer
   *
   * @example
   * // Create a new point cloud layer
   * const points = new EntwinePointTileLayer('EPT',
   *  {
   *      source: new EntwinePointTileSource({
   *          url: 'https://server.geo/ept-dataset',
   *      }
   *  });
   *
   * View.prototype.addLayer.call(view, points);
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Object} config - Configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name. See the list of properties to know which one can be specified.
   * @param {string} [config.crs=ESPG:4326] - The CRS of the {@link View} this
   * layer will be attached to. This is used to determine the extent of this
   * layer. Default to `EPSG:4326`.
   * @param {number} [config.skip=1] - Read one point from every `skip` points
   * - see {@link LASParser}.
   */
  function EntwinePointTileLayer(id, config) {
    var _this;

    (0, _classCallCheck2["default"])(this, EntwinePointTileLayer);
    _this = _super.call(this, id, config);
    _this.isEntwinePointTileLayer = true;

    var resolve = _this.addInitializationStep();

    _this.whenReady = _this.source.whenReady.then(function () {
      _this.root = new _EntwinePointTileNode["default"](0, 0, 0, 0, (0, _assertThisInitialized2["default"])(_this), -1);

      _this.root.bbox.min.fromArray(_this.source.boundsConforming, 0);

      _this.root.bbox.max.fromArray(_this.source.boundsConforming, 3);

      _this.extent = _Extent["default"].fromBox3(config.crs || 'EPSG:4326', _this.root.bbox);
      return _this.root.loadOctree().then(resolve);
    });
    return _this;
  }

  (0, _createClass2["default"])(EntwinePointTileLayer, [{
    key: "spacing",
    get: function get() {
      return this.source.spacing;
    }
  }]);
  return EntwinePointTileLayer;
}(_PointCloudLayer2["default"]);

var _default = EntwinePointTileLayer;
exports["default"] = _default;