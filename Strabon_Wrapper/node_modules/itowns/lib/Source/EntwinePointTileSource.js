"use strict";

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

var _proj = _interopRequireDefault(require("proj4"));

var _LASParser = _interopRequireDefault(require("../Parser/LASParser"));

var _PotreeBinParser = _interopRequireDefault(require("../Parser/PotreeBinParser"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

var _Source2 = _interopRequireDefault(require("./Source"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @classdesc
 * An object defining the source of Entwine Point Tile data. It fetches and
 * parses the main configuration file of Entwine Point Tile format,
 * [`ept.json`](https://entwine.io/entwine-point-tile.html#ept-json).
 *
 * @extends Source
 *
 * @property {boolean} isEntwinePointTileSource - Used to checkout whether this
 * source is a EntwinePointTileSource. Default is true. You should not change
 * this, as it is used internally for optimisation.
 * @property {string} url - The URL of the directory containing the whole
 * Entwine Point Tile structure.
 */
var EntwinePointTileSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(EntwinePointTileSource, _Source);

  var _super = _createSuper(EntwinePointTileSource);

  /**
   * @constructor
   *
   * @param {Object} config - The configuration, see {@link Source} for
   * available values.
   * @param {number|string} [config.colorDepth='auto'] - Does the color
   * encoding is known ? Is it `8` or `16` bits ? By default it is to
   * `'auto'`, but it will be more performant if a specific value is set.
   */
  function EntwinePointTileSource(config) {
    var _this;

    (0, _classCallCheck2["default"])(this, EntwinePointTileSource);
    _this = _super.call(this, config);
    _this.isEntwinePointTileSource = true;
    _this.colorDepth = config.colorDepth; // Necessary because we use the url without the ept.json part as a base

    _this.url = _this.url.replace('/ept.json', ''); // https://entwine.io/entwine-point-tile.html#ept-json

    _this.whenReady = _Fetcher["default"].json("".concat(_this.url, "/ept.json"), _this.networkOptions).then(function (metadata) {
      // Set parser and its configuration from schema
      _this.parse = metadata.dataType === 'laszip' ? _LASParser["default"].parse : _PotreeBinParser["default"].parse;
      _this.extension = metadata.dataType === 'laszip' ? 'laz' : 'bin';

      if (metadata.srs && metadata.srs.authority && metadata.srs.horizontal) {
        _this.crs = "".concat(metadata.srs.authority, ":").concat(metadata.srs.horizontal);

        if (!_proj["default"].defs(_this.crs)) {
          _proj["default"].defs(_this.crs, metadata.srs.wkt);
        }

        if (metadata.srs.vertical && metadata.srs.vertical !== metadata.srs.horizontal) {
          console.warn('EntwinePointTileSource: Vertical coordinates system code is not yet supported.');
        }
      } // NOTE: this spacing is kinda arbitrary here, we take the width and
      // length (height can be ignored), and we divide by the specified
      // span in ept.json. This needs improvements.


      _this.spacing = (Math.abs(metadata.boundsConforming[3] - metadata.boundsConforming[0]) + Math.abs(metadata.boundsConforming[4] - metadata.boundsConforming[1])) / (2 * metadata.span);
      _this.boundsConforming = metadata.boundsConforming;
      _this.span = metadata.span;
      return (0, _assertThisInitialized2["default"])(_this);
    });
    _this.fetcher = _Fetcher["default"].arrayBuffer;
    return _this;
  }

  return EntwinePointTileSource;
}(_Source2["default"]);

var _default = EntwinePointTileSource;
exports["default"] = _default;