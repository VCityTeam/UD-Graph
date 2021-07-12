"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.GLOBE_VIEW_EVENTS = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _View2 = _interopRequireWildcard(require("../View"));

var _GlobeControls = _interopRequireDefault(require("../../Controls/GlobeControls"));

var _Coordinates = _interopRequireDefault(require("../Geographic/Coordinates"));

var _GlobeLayer = _interopRequireDefault(require("./Globe/GlobeLayer"));

var _Atmosphere = _interopRequireDefault(require("./Globe/Atmosphere"));

var _CameraUtils = _interopRequireDefault(require("../../Utils/CameraUtils"));

var _Crs = _interopRequireDefault(require("../Geographic/Crs"));

var _Ellipsoid = require("../Math/Ellipsoid");

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * Fires when the view is completely loaded. Controls and view's functions can be called then.
 * @event GlobeView#initialized
 * @property target {view} dispatched on view
 * @property type {string} initialized
 */

/**
 * Fires when a layer is added
 * @event GlobeView#layer-added
 * @property layerId {string} the id of the layer
 * @property target {view} dispatched on view
 * @property type {string} layers-added
 */

/**
 * Fires when a layer is removed
 * @event GlobeView#layer-removed
 * @property layerId {string} the id of the layer
 * @property target {view} dispatched on view
 * @property type {string} layers-added
 */

/**
 * Fires when the layers oder has changed
 * @event GlobeView#layers-order-changed
 * @property new {object}
 * @property new.sequence {array}
 * @property new.sequence.0 {number} the new layer at position 0
 * @property new.sequence.1 {number} the new layer at position 1
 * @property new.sequence.2 {number} the new layer at position 2
 * @property previous {object}
 * @property previous.sequence {array}
 * @property previous.sequence.0 {number} the previous layer at position 0
 * @property previous.sequence.1 {number} the previous layer at position 1
 * @property previous.sequence.2 {number} the previous layer at position 2
 * @property target {view} dispatched on view
 * @property type {string} layers-order-changed
 */

/**
 * Globe's EVENT
 * @property GLOBE_INITIALIZED {string} Deprecated: emit one time when globe is initialized (use VIEW_EVENTS.INITIALIZED instead).
 * @property LAYER_ADDED {string} Deprecated: emit when layer id added in viewer (use VIEW_EVENTS.LAYER_ADDED instead).
 * @property LAYER_REMOVED {string} Deprecated: emit when layer id removed in viewer (use VIEW_EVENTS.LAYER_REMOVED instead).
 * @property COLOR_LAYERS_ORDER_CHANGED {string} Deprecated: emit when  color layers order change (use VIEW_EVENTS.COLOR_LAYERS_ORDER_CHANGED instead).
 */
var GLOBE_VIEW_EVENTS = {
  GLOBE_INITIALIZED: _View2.VIEW_EVENTS.INITIALIZED,
  LAYER_ADDED: _View2.VIEW_EVENTS.LAYER_ADDED,
  LAYER_REMOVED: _View2.VIEW_EVENTS.LAYER_REMOVED,
  COLOR_LAYERS_ORDER_CHANGED: _View2.VIEW_EVENTS.COLOR_LAYERS_ORDER_CHANGED
};
exports.GLOBE_VIEW_EVENTS = GLOBE_VIEW_EVENTS;

var GlobeView = /*#__PURE__*/function (_View) {
  (0, _inherits2["default"])(GlobeView, _View);

  var _super = _createSuper(GlobeView);

  /**
   * Creates a view of a globe.
   *
   * @constructor
   * @extends View
   *
   * @example <caption><b>Instance GlobeView.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * const placement = {
   *     coord: new itowns.Coordinates('EPSG:4326', 2.351323, 48.856712),
   *     range: 25000000,
   * }
   * var view = new itowns.GlobeView(viewerDiv, placement);
   *
   * @example <caption><b>Enable WebGl 1.0 instead of WebGl 2.0.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * const placement = {
   *     coord: new itowns.Coordinates('EPSG:4326', 2.351323, 48.856712),
   *     range: 25000000,
   * }
   * var view = new itowns.GlobeView(viewerDiv, placement, {  renderer: { isWebGL2: false } });
   *
   * @param {HTMLDivElement} viewerDiv - Where to attach the view and display it
   * in the DOM.
   * @param {CameraTransformOptions|Extent} placement - An object to place view
   * @param {object=} options - See options of {@link View}.
   */
  function GlobeView(viewerDiv) {
    var _this;

    var placement = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    (0, _classCallCheck2["default"])(this, GlobeView);
    THREE.Object3D.DefaultUp.set(0, 0, 1); // Setup View

    _this = _super.call(this, 'EPSG:4978', viewerDiv, options);
    _this.isGlobeView = true;
    _this.camera.camera3D.near = Math.max(15.0, 0.000002352 * _Ellipsoid.ellipsoidSizes.x);
    _this.camera.camera3D.far = _Ellipsoid.ellipsoidSizes.x * 10;
    var tileLayer = new _GlobeLayer["default"]('globe', options.object3d, options);
    _this.mainLoop.gfxEngine.label2dRenderer.infoTileLayer = tileLayer.info;
    var sun = new THREE.DirectionalLight();
    sun.position.set(-0.5, 0, 1);
    sun.updateMatrixWorld(true);
    tileLayer.object3d.add(sun);

    _this.addLayer(tileLayer);

    _this.tileLayer = tileLayer;

    if (!placement.isExtent) {
      placement.coord = placement.coord || new _Coordinates["default"]('EPSG:4326', 0, 0);
      placement.tilt = placement.tilt || 89.5;
      placement.heading = placement.heading || 0;
      placement.range = placement.range || _Ellipsoid.ellipsoidSizes.x * 2.0;
    }

    if (options.noControls) {
      _CameraUtils["default"].transformCameraToLookAtTarget((0, _assertThisInitialized2["default"])(_this), _this.camera.camera3D, placement);
    } else {
      _this.controls = new _GlobeControls["default"]((0, _assertThisInitialized2["default"])(_this), placement);
      _this.controls.handleCollision = typeof options.handleCollision !== 'undefined' ? options.handleCollision : true;
    }

    _this.addLayer(new _Atmosphere["default"]('atmosphere', options.atmosphere)); // GlobeView needs this.camera.resize to set perpsective matrix camera


    _this.camera.resize(viewerDiv.clientWidth, viewerDiv.clientHeight);

    return _this;
  }
  /**
   * Add layer in viewer.
   * The layer id must be unique.
   *
   * The `layer.whenReady` is a promise that resolves when
   * the layer is done. This promise is also returned by
   * `addLayer` allowing to chain call.
   *
   * The layer added is attached, by default to `GlobeLayer` (`GlobeView.tileLayer`).
   * If you want add a unattached layer use `View#addLayer` parent method.
   *
   * @param {LayerOptions|Layer|GeometryLayer} layer The layer to add in view.
   * @return {Promise} a promise resolved with the new layer object when it is fully initialized or rejected if any error occurred.
   */


  (0, _createClass2["default"])(GlobeView, [{
    key: "addLayer",
    value: function addLayer(layer) {
      if (!layer || !layer.isLayer) {
        return Promise.reject(new Error('Add Layer type object'));
      }

      if (layer.isColorLayer) {
        if (!this.tileLayer.tileMatrixSets.includes(_Crs["default"].formatToTms(layer.source.crs))) {
          return layer._reject("Only ".concat(this.tileLayer.tileMatrixSets, " tileMatrixSet are currently supported for color layers"));
        }
      } else if (layer.isElevationLayer) {
        if (_Crs["default"].formatToTms(layer.source.crs) !== this.tileLayer.tileMatrixSets[0]) {
          return layer._reject("Only ".concat(this.tileLayer.tileMatrixSets[0], " tileMatrixSet is currently supported for elevation layers"));
        }
      }

      return (0, _get2["default"])((0, _getPrototypeOf2["default"])(GlobeView.prototype), "addLayer", this).call(this, layer, this.tileLayer);
    }
  }, {
    key: "getPixelsToDegrees",
    value: function getPixelsToDegrees() {
      var pixels = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var screenCoord = arguments.length > 1 ? arguments[1] : undefined;
      return this.getMetersToDegrees(this.getPixelsToMeters(pixels, screenCoord));
    }
  }, {
    key: "getPixelsToDegreesFromDistance",
    value: function getPixelsToDegreesFromDistance() {
      var pixels = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var distance = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
      return this.getMetersToDegrees(this.getPixelsToMetersFromDistance(pixels, distance));
    }
  }, {
    key: "getMetersToDegrees",
    value: function getMetersToDegrees() {
      var meters = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      return THREE.MathUtils.radToDeg(2 * Math.asin(meters / (2 * _Ellipsoid.ellipsoidSizes.x)));
    }
  }]);
  return GlobeView;
}(_View2["default"]);

var _default = GlobeView;
exports["default"] = _default;