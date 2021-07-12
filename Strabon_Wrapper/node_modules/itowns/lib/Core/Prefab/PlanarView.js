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

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _View2 = _interopRequireDefault(require("../View"));

var _CameraUtils = _interopRequireDefault(require("../../Utils/CameraUtils"));

var _PlanarControls = _interopRequireDefault(require("../../Controls/PlanarControls"));

var _PlanarLayer = _interopRequireDefault(require("./Planar/PlanarLayer"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var PlanarView = /*#__PURE__*/function (_View) {
  (0, _inherits2["default"])(PlanarView, _View);

  var _super = _createSuper(PlanarView);

  /**
   * @constructor
   * @extends View
   *
   * @example <caption><b>Enable WebGl 1.0 instead of WebGl 2.0.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * const extent = new Extent('EPSG:3946', 1837816.94334, 1847692.32501, 5170036.4587, 5178412.82698);
   * var view = new itowns.PlanarView(viewerDiv, extent, {  renderer: { isWebGL2: false } });
   *
   * @example <caption><b>Instance with placement on the ground.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * const extent = new Extent('EPSG:3946', 1837816.94334, 1847692.32501, 5170036.4587, 5178412.82698);
   * var view = new itowns.PlanarView(viewerDiv, extent, { placement: { heading: -49.6, range: 6200, tilt: 17 } });
   *
   * @param {HTMLDivElement} viewerDiv - Where to attach the view and display it
   * in the DOM.
   * @param {Extent} extent - The ground extent.
   * @param {object=} options - See options of {@link View}.
   * @param {boolean} [options.noControls=false] - If true, no controls are associated to the view.
   * @param {object=} [options.controls] - options for the {@link PlanarControls} associated to the view, if
   * `options.noControls` is false.
   * @param {CameraUtils~CameraTransformOptions|Extent} [options.placement] - The
   * {@link CameraUtils~CameraTransformOptions} to apply to view's camera or the extent it must display at
   * initialization. By default, camera will display the view's extent (given in `extent` parameter).
   */
  function PlanarView(viewerDiv, extent) {
    var _this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    (0, _classCallCheck2["default"])(this, PlanarView);
    THREE.Object3D.DefaultUp.set(0, 0, 1); // Setup View

    _this = _super.call(this, extent.crs, viewerDiv, options);
    _this.isPlanarView = true; // Configure camera

    var dim = extent.dimensions();
    var max = Math.max(dim.x, dim.y);
    var camera3D = _this.camera.camera3D;
    camera3D.near = 0.1;
    camera3D.far = camera3D.isOrthographicCamera ? 2000 : 2 * max;
    camera3D.updateProjectionMatrix();
    var tileLayer = new _PlanarLayer["default"]('planar', extent, options.object3d, options);
    _this.mainLoop.gfxEngine.label2dRenderer.infoTileLayer = tileLayer.info;

    _this.addLayer(tileLayer); // Configure camera


    var placement = options.placement || {};

    if (!placement.isExtent) {
      placement.coord = placement.coord || extent.center();
      placement.tilt = placement.tilt || 90;
      placement.heading = placement.heading || 0;
      placement.range = placement.range || max;
    }

    _CameraUtils["default"].transformCameraToLookAtTarget((0, _assertThisInitialized2["default"])(_this), camera3D, placement);

    if (!options.noControls) {
      _this.controls = new _PlanarControls["default"]((0, _assertThisInitialized2["default"])(_this), options.controls);
    }

    _this.tileLayer = tileLayer;
    return _this;
  }

  (0, _createClass2["default"])(PlanarView, [{
    key: "addLayer",
    value: function addLayer(layer) {
      return (0, _get2["default"])((0, _getPrototypeOf2["default"])(PlanarView.prototype), "addLayer", this).call(this, layer, this.tileLayer);
    }
  }]);
  return PlanarView;
}(_View2["default"]);

var _default = PlanarView;
exports["default"] = _default;