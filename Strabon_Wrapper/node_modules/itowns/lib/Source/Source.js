"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.supportedParsers = exports.supportedFetchers = void 0;

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

var _GeoJsonParser = _interopRequireDefault(require("../Parser/GeoJsonParser"));

var _KMLParser = _interopRequireDefault(require("../Parser/KMLParser"));

var _GpxParser = _interopRequireDefault(require("../Parser/GpxParser"));

var _VectorTileParser = _interopRequireDefault(require("../Parser/VectorTileParser"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

var _Cache = _interopRequireDefault(require("../Core/Scheduler/Cache"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var supportedFetchers = new Map([['image/x-bil;bits=32', _Fetcher["default"].textureFloat], ['geojson', _Fetcher["default"].json], ['application/json', _Fetcher["default"].json], ['application/kml', _Fetcher["default"].xml], ['application/gpx', _Fetcher["default"].xml], ['application/x-protobuf;type=mapbox-vector', _Fetcher["default"].arrayBuffer]]);
exports.supportedFetchers = supportedFetchers;
var supportedParsers = new Map([['geojson', _GeoJsonParser["default"].parse], ['application/json', _GeoJsonParser["default"].parse], ['application/kml', _KMLParser["default"].parse], ['application/gpx', _GpxParser["default"].parse], ['application/x-protobuf;type=mapbox-vector', _VectorTileParser["default"].parse]]);
exports.supportedParsers = supportedParsers;
var noCache = {
  getByArray: function getByArray() {},
  setByArray: function setByArray(a) {
    return a;
  },
  clear: function clear() {}
};
/**
 * @property {string} crs - data crs projection.
 * @property {boolean} isInverted - This option is to be set to the
 * correct value, true or false (default being false), if the computation of
 * the coordinates needs to be inverted to same scheme as OSM, Google Maps
 * or other system. See [this link]{@link
 * https://alastaira.wordpress.com/2011/07/06/converting-tms-tile-coordinates-to-googlebingosm-tile-coordinates}
 * for more informations.
 *
 */

var InformationsData = function InformationsData(options) {
  (0, _classCallCheck2["default"])(this, InformationsData);

  /* istanbul ignore next */
  if (options.projection) {
    console.warn('Source projection parameter is deprecated, use crs instead.');
    options.crs = options.crs || options.projection;
  }

  this.crs = options.crs;
};
/**
 * This class describes parsing options.
 * @property {InformationsData|Source} in - data informations contained in the file.
 * @property {FeatureBuildingOptions|Layer} out - options indicates how the features should be built.
 */
// eslint-disable-next-line


var
/* istanbul ignore next */
ParsingOptions = function ParsingOptions() {
  (0, _classCallCheck2["default"])(this, ParsingOptions);
};

function fetchSourceData(source, extent) {
  var url = source.urlFromExtent(extent);
  return source.fetcher(url, source.networkOptions).then(function (f) {
    f.extent = extent;
    return f;
  }, function (err) {
    return source.handlingError(err);
  });
}

var uid = 0;
/**
 * @classdesc
 * Sources are object containing informations on how to fetch resources, from a
 * set source.
 *
 * To extend a Source, it is necessary to implement two functions:
 * `urlFromExtent` and `extentInsideLimit`.
 *
 * @property {boolean} isSource - Used to checkout whether this source is a
 * Source. Default is true. You should not change this, as it is used internally
 * for optimisation.
 * @property {number} uid - Unique uid mainly used to store data linked to this
 * source into Cache.
 * @property {string} url - The url of the resources that are fetched.
 * @property {string} format - The format of the resources that are fetched.
 * @property {function} fetcher - The method used to fetch the resources from
 * the source. iTowns provides some methods in {@link Fetcher}, but it can be
 * specified a custom one. This method should return a `Promise` containing the
 * fetched resource. If this property is set, it overrides the chosen fetcher
 * method with `format`.
 * @property {Object} networkOptions - Fetch options (passed directly to
 * `fetch()`), see [the syntax for more information]{@link
 * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
 * By default, set to `{ crossOrigin: 'anonymous' }`.
 * @property {string} crs - The crs projection of the resources.
 * @property {string} attribution - The intellectual property rights for the
 * resources.
 * @property {Extent} extent - The extent of the resources.
 * @property {function} parser - The method used to parse the resources attached
 * to the layer. iTowns provides some parsers, visible in the `Parser/` folder.
 * If the method is custom, it should return a `Promise` containing the parsed
 * resource. If this property is set, it overrides the default selected parser
 * method with `source.format`. If `source.format` is also empty, no parsing
 * action is done.
 * <br><br>
 * When calling this method, two parameters are passed:
 * <ul>
 *  <li>the fetched data, i.e. the data to parse</li>
 *  <li>an {@link ParsingOptions}  containing severals properties, set when this method is
 *  called: it is specific to each call, so the value of each property can vary
 *  depending on the current fetched tile for example</li>
 * </ul>
 */

var Source = /*#__PURE__*/function (_InformationsData) {
  (0, _inherits2["default"])(Source, _InformationsData);

  var _super = _createSuper(Source);

  /**
   * @param {Object} source - An object that can contain all properties of a
   * Source. Only the `url` property is mandatory.
   *
   * @constructor
   * @extends InformationsData
   */
  function Source(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, Source);
    _this = _super.call(this, source);
    _this.isSource = true;

    if (!source.url) {
      throw new Error('New Source: url is required');
    }

    _this.uid = uid++;
    _this.url = source.url;
    _this.format = source.format;
    _this.fetcher = source.fetcher || supportedFetchers.get(source.format) || _Fetcher["default"].texture;

    _this.parser = source.parser || supportedParsers.get(source.format) || function (d) {
      return d;
    };

    _this.isVectorSource = (source.parser || supportedParsers.get(source.format)) != undefined;
    _this.networkOptions = source.networkOptions || {
      crossOrigin: 'anonymous'
    };
    _this.attribution = source.attribution;
    _this.whenReady = Promise.resolve();
    _this._featuresCaches = {};

    if (source.extent && !source.extent.isExtent) {
      _this.extent = new _Extent["default"](_this.crs, source.extent);
    } else {
      _this.extent = source.extent;
    }

    return _this;
  }

  (0, _createClass2["default"])(Source, [{
    key: "handlingError",
    value: function handlingError(err) {
      throw new Error(err);
    }
    /**
     * Generates an url from an extent. This url is a link to fetch the
     * resources inside the extent.
     *
     * @param {Extent} extent - Extent to convert in url.
      * @return {string} The URL constructed from the extent.
     */
    // eslint-disable-next-line

  }, {
    key: "urlFromExtent",
    value: function urlFromExtent() {
      throw new Error('In extended Source, you have to implement the method urlFromExtent!');
    }
  }, {
    key: "requestToKey",
    value: function requestToKey(extent) {
      return [extent.zoom, extent.row, extent.col];
    }
    /**
     * Load  data from cache or Fetch/Parse data.
     * The loaded data is a Feature or Texture.
     *
     * @param      {Extent}  extent   extent requested parsed data.
     * @param      {FeatureBuildingOptions|Layer}  out     The feature returned options
     * @return     {FeatureCollection|Texture}  The parsed data.
     */

  }, {
    key: "loadData",
    value: function loadData(extent, out) {
      var _this2 = this;

      var cache = this._featuresCaches[out.crs];
      var key = this.requestToKey(extent); // try to get parsed data from cache

      var features = cache.getByArray(key);

      if (!features) {
        // otherwise fetch/parse the data
        features = cache.setByArray(fetchSourceData(this, extent).then(function (file) {
          return _this2.parser(file, {
            out: out,
            "in": _this2
          });
        }, function (err) {
          return _this2.handlingError(err);
        }), key);
        /* istanbul ignore next */

        if (this.onParsedFile) {
          features.then(function (feat) {
            _this2.onParsedFile(feat);

            console.warn('Source.onParsedFile was deprecated');
            return feat;
          });
        }
      }

      return features;
    }
    /**
     * Called when layer added.
     *
     * @param {object} options
     */

  }, {
    key: "onLayerAdded",
    value: function onLayerAdded(options) {
      // Added new cache by crs
      if (!this._featuresCaches[options.out.crs]) {
        // Cache feature only if it's vector data, the feature are cached in source.
        // It's not necessary to cache raster in Source,
        // because it's already cached on layer.
        this._featuresCaches[options.out.crs] = this.isVectorSource ? new _Cache["default"]() : noCache;
      }
    }
    /**
     * Called when layer removed.
     *
     * @param {options}  [options={}] options
     */

  }, {
    key: "onLayerRemoved",
    value: function onLayerRemoved() {
      var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      // delete unused cache
      var unusedCache = this._featuresCaches[options.unusedCrs];

      if (unusedCache) {
        unusedCache.clear();
        delete this._featuresCaches[options.unusedCrs];
      }
    }
    /**
     * Tests if an extent is inside the source limits.
     *
     * @param {Extent} extent - Extent to test.
      * @return {boolean} True if the extent is inside the limit, false otherwise.
     */
    // eslint-disable-next-line

  }, {
    key: "extentInsideLimit",
    value: function extentInsideLimit() {
      throw new Error('In extented Source, you have to implement the method extentInsideLimit!');
    }
  }]);
  return Source;
}(InformationsData);

var _default = Source;
exports["default"] = _default;