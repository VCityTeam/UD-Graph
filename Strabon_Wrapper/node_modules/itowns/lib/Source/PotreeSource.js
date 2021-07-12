"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _Source2 = _interopRequireDefault(require("./Source"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

var _PotreeBinParser = _interopRequireDefault(require("../Parser/PotreeBinParser"));

var _PotreeCinParser = _interopRequireDefault(require("../Parser/PotreeCinParser"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @classdesc
 * PotreeSource are object containing informations on how to fetch points cloud resources.
 *
 *
 */
var PotreeSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(PotreeSource, _Source);

  var _super = _createSuper(PotreeSource);

  /**
   * @param {Object} source - An object that can contain all properties of a
   * PotreeSource
   * @param {string} source.url - folder url.
   * @param {string} source.file - cloud file name.
   *
   * This `cloud` file stores information about the potree cloud in JSON format. the structure is :
   *
   * * __`version`__ - The cloud.js format may change over time. The version number is
   * necessary so that parsers know how to interpret the data.
   * * __`octreeDir`__ - Directory or URL where node data is stored. Usually points to
   * "data".
   * * __`boundingBox`__ - Contains the minimum and maximum of the axis aligned bounding box. This bounding box is cubic and aligned to fit to the octree root.
   * * __`tightBoundingBox`__ - This bounding box thightly fits the point data.
   * * __`pointAttributes`__ - Declares the point data format. May be 'LAS', 'LAZ' or in case if the BINARY format an array of attributes like
   * `['POSITION_CARTESIAN', 'COLOR_PACKED', 'INTENSITY']`
   * * __`POSITION_CARTESIAN`__ - 3 x 32bit signed integers for x/y/z coordinates
   * * __`COLOR_PACKED`__ - 4 x unsigned byte for r,g,b,a colors.
   * * __`spacing`__ - The minimum distance between points at root level.
   * ```
   * {
   *     version: '1.6',
   *     octreeDir: 'data',
   *     boundingBox: {
   *         lx: -4.9854,
   *         ly: 1.0366,
   *         lz: -3.4494,
   *         ux: 0.702300000000001,
   *         uy: 6.7243,
   *         uz: 2.2383
   *     },
   *     tightBoundingBox: {
   *         lx: -4.9854,
   *         ly: 1.0375,
   *         lz: -3.4494,
   *         ux: -0.7889,
   *         uy: 6.7243,
   *         uz: 1.1245
   *     },
   *     pointAttributes: [
   *         'POSITION_CARTESIAN',
   *         'COLOR_PACKED'
   *     ],
   *     spacing: 0.03,
   *     scale: 0.001,
   *     hierarchyStepSize: 5
   * }
   * ```
   *
   * @extends Source
   *
   * @constructor
   */
  function PotreeSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, PotreeSource);

    if (!source.file) {
      throw new Error('New PotreeSource: file is required');
    }

    _this = _super.call(this, source);
    _this.file = source.file;
    _this.fetcher = _Fetcher["default"].arrayBuffer;
    _this.extensionOctree = 'hrc'; // For cloud specification visit:
    // https://github.com/PropellerAero/potree-propeller-private/blob/master/docs/file_format.md#cloudjs

    _this.whenReady = (source.cloud ? Promise.resolve(source.cloud) : _Fetcher["default"].json("".concat(_this.url, "/").concat(_this.file), _this.networkOptions)).then(function (cloud) {
      _this.pointAttributes = cloud.pointAttributes;
      _this.baseurl = "".concat(_this.url, "/").concat(cloud.octreeDir, "/r");
      _this.extension = cloud.pointAttributes === 'CIN' ? 'cin' : 'bin';
      _this.parse = _this.extension === 'cin' ? _PotreeCinParser["default"].parse : _PotreeBinParser["default"].parse;
      return cloud;
    });
    return _this;
  }

  return PotreeSource;
}(_Source2["default"]);

var _default = PotreeSource;
exports["default"] = _default;