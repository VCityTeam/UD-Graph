"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _Source2 = _interopRequireDefault(require("./Source"));

var _URLBuilder = _interopRequireDefault(require("../Provider/URLBuilder"));

var _Extent = _interopRequireWildcard(require("../Core/Geographic/Extent"));

var _Crs = _interopRequireDefault(require("../Core/Geographic/Crs"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var extent = new _Extent["default"](_Crs["default"].tms_4326, 0, 0, 0);
/**
 * @classdesc
 * An object defining the source of resources to get from a [TMS]{@link
 * https://wiki.osgeo.org/wiki/Tile_Map_Service_Specification} server. It
 * inherits from {@link Source}.
 *
 * @extends Source
 *
 * @property {boolean} isTMSSource - Used to checkout whether this source is a
 * TMSSource. Default is true. You should not change this, as it is used
 * internally for optimisation.
 * @property {boolean} isInverted - The isInverted property is to be set to the
 * correct value, true or false (default being false) if the computation of the
 * coordinates needs to be inverted to match the same scheme as OSM, Google Maps
 * or other system. See [this link]{@link
 * https://alastaira.wordpress.com/2011/07/06/converting-tms-tile-coordinates-to-googlebingosm-tile-coordinates/}
 * for more information.
 * @property {Object} tileMatrixSetLimits - it describes the available tile for this layer
 * @property {Object} extentSetlimits - these are the extents of the set of identical zoom tiles.
 * @property {Object} zoom - Object containing the minimum and maximum values of
 * the level, to zoom in the source.
 * @property {number} zoom.min - The minimum level of the source. Default value
 * is 0.
 * @property {number} zoom.max - The maximum level of the source. Default value
 * is 20.
 *
 * @example <caption><b>Source from OpenStreetMap server :</b></caption>
 * // Create the source
 * const tmsSource = new itowns.TMSSource({
 *     format: 'image/png',
 *     url: 'http://osm.io/styles/${z}/${x}/${y}.png',
 *     attribution: {
 *         name: 'OpenStreetMap',
 *         url: 'http://www.openstreetmap.org/',
 *     },
 *     crs: 'EPSG:3857',
 * });
 *
 * // Create the layer
 * const colorLayer = new itowns.ColorLayer('OPENSM', {
 *     source: tmsSource,
 * });
 *
 * // Add the layer
 * view.addLayer(colorLayer);
 *
 * @example <caption><b>Source from Mapbox server :</b></caption>
 * // Create the source
 * const orthoSource = new itowns.TMSSource({
 *     url: 'https://api.mapbox.com/v4/mapbox.satellite/${z}/${x}/${y}.jpg?access_token=' + accessToken,
 *     crs: 'EPSG:3857',
 * };
 *
 * // Create the layer
 * const imageryLayer = new itowns.ColorLayer("Ortho", {
 *     source: orthoSource,
 * };
 *
 * // Add the layer to the view
 * view.addLayer(imageryLayer);
 */

var TMSSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(TMSSource, _Source);

  var _super = _createSuper(TMSSource);

  /**
   * @param {Object} source - An object that can contain all properties of a
   * TMSSource and {@link Source}. Only `url` is mandatory.
   *
   * @constructor
   */
  function TMSSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, TMSSource);

    if (!source.crs && !source.projection) {
      throw new Error('New TMSSource/WMTSSource: crs projection is required');
    }

    source.format = source.format || 'image/png';
    _this = _super.call(this, source);
    _this.isTMSSource = true;

    if (!source.extent) {
      // default to the global extent
      _this.extent = _Extent.globalExtentTMS.get(source.crs);
    }

    _this.zoom = source.zoom;
    _this.isInverted = source.isInverted || false;
    _this.url = source.url;
    _this.crs = _Crs["default"].formatToTms(source.crs);
    _this.tileMatrixSetLimits = source.tileMatrixSetLimits;
    _this.extentSetlimits = {};

    if (!_this.zoom) {
      if (_this.tileMatrixSetLimits) {
        var arrayLimits = Object.keys(_this.tileMatrixSetLimits);
        var size = arrayLimits.length;
        var maxZoom = Number(arrayLimits[size - 1]);
        _this.zoom = {
          min: maxZoom - size + 1,
          max: maxZoom
        };
      } else {
        _this.zoom = {
          min: 0,
          max: Infinity
        };
      }
    }

    return _this;
  }

  (0, _createClass2["default"])(TMSSource, [{
    key: "urlFromExtent",
    value: function urlFromExtent(extent) {
      return _URLBuilder["default"].xyz(extent, this);
    }
  }, {
    key: "onLayerAdded",
    value: function onLayerAdded(options) {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(TMSSource.prototype), "onLayerAdded", this).call(this, options); // Build extents of the set of identical zoom tiles.

      var parent = options.out.parent; // The extents crs is chosen to facilitate in raster tile process.

      var crs = parent ? parent.extent.crs : options.out.crs;

      if (this.tileMatrixSetLimits && !this.extentSetlimits[crs]) {
        this.extentSetlimits[crs] = {};
        extent.crs = this.crs;

        for (var i = this.zoom.max; i >= this.zoom.min; i--) {
          var tmsl = this.tileMatrixSetLimits[i];

          var _extent$set$as = extent.set(i, tmsl.minTileRow, tmsl.minTileCol).as(crs),
              west = _extent$set$as.west,
              north = _extent$set$as.north;

          var _extent$set$as2 = extent.set(i, tmsl.maxTileRow, tmsl.maxTileCol).as(crs),
              east = _extent$set$as2.east,
              south = _extent$set$as2.south;

          this.extentSetlimits[crs][i] = new _Extent["default"](crs, west, east, south, north);
        }
      }
    }
  }, {
    key: "extentInsideLimit",
    value: function extentInsideLimit(extent, zoom) {
      // This layer provides data starting at level = layer.source.zoom.min
      // (the zoom.max property is used when building the url to make
      //  sure we don't use invalid levels)
      return zoom >= this.zoom.min && zoom <= this.zoom.max && (this.extentSetlimits[extent.crs] == undefined || this.extentSetlimits[extent.crs][zoom].intersectsExtent(extent));
    }
  }]);
  return TMSSource;
}(_Source2["default"]);

var _default = TMSSource;
exports["default"] = _default;