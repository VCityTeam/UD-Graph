"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _PointCloudLayer2 = _interopRequireDefault(require("./PointCloudLayer"));

var _PotreeNode = _interopRequireDefault(require("../Core/PotreeNode"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var bboxMesh = new THREE.Mesh();
var box3 = new THREE.Box3();
bboxMesh.geometry.boundingBox = box3;
/**
 * @property {boolean} isPotreeLayer - Used to checkout whether this layer
 * is a PotreeLayer. Default is `true`. You should not change this, as it is
 * used internally for optimisation.
 */

var PotreeLayer = /*#__PURE__*/function (_PointCloudLayer) {
  (0, _inherits2["default"])(PotreeLayer, _PointCloudLayer);

  var _super = _createSuper(PotreeLayer);

  /**
   * Constructs a new instance of Potree layer.
   *
   * @constructor
   * @extends PointCloudLayer
   *
   * @example
   * // Create a new point cloud layer
   * const points = new PotreeLayer('points',
   *  {
   *      source: new PotreeLayer({
   *          url: 'https://pointsClouds/',
   *          file: 'points.js',
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
   * layer.  Default to `EPSG:4326`.
   */
  function PotreeLayer(id, config) {
    var _this;

    (0, _classCallCheck2["default"])(this, PotreeLayer);
    _this = _super.call(this, id, config);
    _this.isPotreeLayer = true;

    var resolve = _this.addInitializationStep();

    _this.source.whenReady.then(function (cloud) {
      _this.scale = new THREE.Vector3().addScalar(cloud.scale);
      _this.spacing = cloud.spacing;
      _this.hierarchyStepSize = cloud.hierarchyStepSize;
      var normal = Array.isArray(cloud.pointAttributes) && cloud.pointAttributes.find(function (elem) {
        return elem.startsWith('NORMAL');
      });

      if (normal) {
        _this.material.defines[normal] = 1;
      }

      _this.supportsProgressiveDisplay = _this.source.extension === 'cin';
      _this.root = new _PotreeNode["default"](0, 0, (0, _assertThisInitialized2["default"])(_this));

      _this.root.bbox.min.set(cloud.boundingBox.lx, cloud.boundingBox.ly, cloud.boundingBox.lz);

      _this.root.bbox.max.set(cloud.boundingBox.ux, cloud.boundingBox.uy, cloud.boundingBox.uz);

      _this.extent = _Extent["default"].fromBox3(_this.source.crs || 'EPSG:4326', _this.root.bbox);
      return _this.root.loadOctree().then(resolve);
    });

    return _this;
  }

  return PotreeLayer;
}(_PointCloudLayer2["default"]);

var _default = PotreeLayer;
exports["default"] = _default;