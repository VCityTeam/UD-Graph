"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _Source2 = _interopRequireDefault(require("./Source"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @classdesc OrientedImageSource is a specific source used to load oriented images.
 * @extends Source
 */
var OrientedImageSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(OrientedImageSource, _Source);

  var _super = _createSuper(OrientedImageSource);

  /**
   * @constructor
   * @param { Object } source - Configuration object
   * @param { string } source.url - Url for all the textures.
   * @param { string } source.orientationsUrl - Json Url, using GeoJSon format to represent points,
   * it's a set of panoramic position and orientation.
   * @param { string } source.calibrationUrl - Json url, representing a set of camera. see [CameraCalibrationParser]{@link module:CameraCalibrationParser}
   * This Url must contains {sensorId} and {cameraId}, and these pattern will be replaced to build the Url,
   * to find the good texture for each camera for each panoramic.
   */
  function OrientedImageSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, OrientedImageSource);
    source.format = source.format || 'json';
    _this = _super.call(this, source);
    _this.isOrientedImageSource = true; // Fetch the two files

    var promises = [];
    promises.push(source.orientationsUrl ? _Fetcher["default"].json(source.orientationsUrl, _this.networkOptions) : Promise.resolve());
    promises.push(source.calibrationUrl ? _Fetcher["default"].json(source.calibrationUrl, _this.networkOptions) : Promise.resolve());
    _this.whenReady = Promise.all(promises).then(function (data) {
      return {
        orientation: data[0],
        calibration: data[1]
      };
    });
    return _this;
  }
  /**
   * Build the url of the texture, but not from extent.
   *
   * @param      {Object}  imageInfo - Information about the texture
   * @param      {string}  imageInfo.camera - Id of the camera
   * @param      {string}  imageInfo.pano - Id of the panoramic
   * @return     {string}  Url of the image
   */


  (0, _createClass2["default"])(OrientedImageSource, [{
    key: "urlFromExtent",
    value: function urlFromExtent(imageInfo) {
      return this.imageUrl(imageInfo.cameraId, imageInfo.panoId);
    }
  }, {
    key: "requestToKey",
    value: function requestToKey(image) {
      return [image.cameraId, image.panoId];
    }
    /**
     * Build the url of the image, for a given panoramic id, and a given camera id.
     *
     * @param      {string}  cameraId  Id of the camera
     * @param      {string}  panoId   Id of the panoramic
     * @return     {string}  Url of the image
     */

  }, {
    key: "imageUrl",
    value: function imageUrl(cameraId, panoId) {
      return this.url.replace('{cameraId}', cameraId).replace('{panoId}', panoId);
    }
  }]);
  return OrientedImageSource;
}(_Source2["default"]);

var _default = OrientedImageSource;
exports["default"] = _default;