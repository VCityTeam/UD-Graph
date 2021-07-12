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

var _URLBuilder = _interopRequireDefault(require("../Provider/URLBuilder"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @classdesc
 * An object defining the source of images to get from a
 * [WMS]{@link http://www.opengeospatial.org/standards/wms} server. It inherits
 * from {@link Source}.
 *
 * @extends Source
 *
 * @property {boolean} isWMSSource - Used to checkout whether this source is a
 * WMSSource. Default is true. You should not change this, as it is used
 * internally for optimisation.
 * @property {string} name - The name of the layer, used in the generation of
 * the url.
 * @property {string} version - The version of the WMS server to request on.
 * Default value is '1.3.0'.
 * @property {string} style - The style to query on the WMS server. Default
 * value is 'normal'.
 * @property {number} width - The width of the image to fetch, in pixel.
 * Default value is the height if set or 256.
 * @property {number} height - The height of the image to fetch, in pixel.
 * Default value is the width if set or 256.
 * @property {string} axisOrder - The order of the axis, that helps building the
 * BBOX to put in the url requesting a resource. Default value is 'wsen', other
 * value can be 'swne'.
 * @property {boolean} transparent - Tells if the image to fetch needs
 * transparency support. Default value is false.
 * @property {Object} zoom - Object containing the minimum and maximum values of
 * the level, to zoom in the source.
 * @property {number} zoom.min - The minimum level of the source. Default value
 * is 0.
 * @property {number} zoom.max - The maximum level of the source. Default value
 * is 21.
 * @property {Object} vendorSpecific - An object containing vendor specific
 * parameters. See for example a [list of these parameters for GeoServer]{@link
 * https://docs.geoserver.org/latest/en/user/services/wms/vendor.html}. This
 * object is read simply with the `key` being the name of the parameter and
 * `value` being the value of the parameter. If used, this property should be
 * set in the constructor parameters.
 *
 * @example
 * // Create the source
 * const wmsSource = new itowns.WMSSource({
 *     url: 'https://server.geo/wms',
 *     version: '1.3.0',
 *     name: 'REGION.2016',
 *     style: '',
 *     crs: 'EPSG:3857',
 *     extent: {
 *         west: '-6880639.13557728',
 *         east: '6215707.87974825',
 *         south: '-2438399.00148845',
 *         north: '7637050.03850605',
 *     },
 *     transparent: true,
 * });
 *
 * // Create the layer
 * const colorlayer = new itowns.ColorLayer('Region', {
 *     source: wmsSource,
 * });
 *
 * // Add the layer
 * view.addLayer(colorlayer);
 */
var WMSSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(WMSSource, _Source);

  var _super = _createSuper(WMSSource);

  /**
   * @param {Object} source - An object that can contain all properties of
   * WMSSource and {@link Source}. `url`, `name`, `extent` and `crs`
   * are mandatory.
   *
   * @constructor
   */
  function WMSSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, WMSSource);

    if (!source.name) {
      throw new Error('source.name is required.');
    }

    if (!source.extent) {
      throw new Error('source.extent is required');
    }

    if (!source.crs && !source.projection) {
      throw new Error('source.crs is required');
    }

    source.format = source.format || 'image/png';
    _this = _super.call(this, source);
    _this.isWMSSource = true;
    _this.name = source.name;
    _this.zoom = {
      min: 0,
      max: Infinity
    };
    _this.style = source.style || '';
    _this.width = source.width || source.height || 256;
    _this.height = source.height || source.width || 256;
    _this.version = source.version || '1.3.0';
    _this.transparent = source.transparent || false;

    if (!source.axisOrder) {
      // 4326 (lat/long) axis order depends on the WMS version used
      if (_this.crs == 'EPSG:4326') {
        // EPSG 4326 x = lat, long = y
        // version 1.1.0 long/lat while version 1.3.0 mandates xy (so lat,long)
        _this.axisOrder = _this.version === '1.1.0' ? 'wsen' : 'swne';
      } else {
        // xy,xy order
        _this.axisOrder = 'wsen';
      }
    }

    var crsPropName = _this.version === '1.3.0' ? 'CRS' : 'SRS';
    _this.url = "".concat(source.url, "?SERVICE=WMS&REQUEST=GetMap&LAYERS=").concat(_this.name, "&VERSION=").concat(_this.version, "&STYLES=").concat(_this.style, "&FORMAT=").concat(_this.format, "&TRANSPARENT=").concat(_this.transparent, "&BBOX=%bbox&").concat(crsPropName, "=").concat(_this.crs, "&WIDTH=").concat(_this.width, "&HEIGHT=").concat(_this.height);
    _this.vendorSpecific = source.vendorSpecific;

    for (var name in _this.vendorSpecific) {
      if (Object.prototype.hasOwnProperty.call(_this.vendorSpecific, name)) {
        _this.url = "".concat(_this.url, "&").concat(name, "=").concat(_this.vendorSpecific[name]);
      }
    }

    return _this;
  }

  (0, _createClass2["default"])(WMSSource, [{
    key: "urlFromExtent",
    value: function urlFromExtent(extent) {
      return _URLBuilder["default"].bbox(extent, this);
    }
  }, {
    key: "extentInsideLimit",
    value: function extentInsideLimit(extent) {
      return this.extent.intersectsExtent(extent);
    }
  }]);
  return WMSSource;
}(_Source2["default"]);

var _default = WMSSource;
exports["default"] = _default;