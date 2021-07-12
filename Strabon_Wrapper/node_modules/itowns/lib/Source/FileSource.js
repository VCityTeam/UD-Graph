"use strict";

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

var _Cache = _interopRequireDefault(require("../Core/Scheduler/Cache"));

var _Crs = _interopRequireDefault(require("../Core/Geographic/Crs"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @classdesc
 * An object defining the source of a single resource to get from a direct
 * access. It inherits from {@link Source}. There is multiple ways of adding a
 * resource here:
 * <ul>
 *  <li>add the file like any other sources, using the `url` property.</li>
 *  <li>fetch the file, and give the data to the source using the `fetchedData`
 *  property.</li>
 *  <li>fetch the file, parse it and git the parsed data to the source using the
 *  `features` property.</li>
 * </ul>
 * See the examples below for real use cases.
 *
 * @extends Source
 *
 * @property {boolean} isFileSource - Used to checkout whether this source is a
 * FileSource. Default is true. You should not change this, as it is used
 * internally for optimisation.
 * @property {*} fetchedData - Once the file has been loaded, the resulting data
 * is stored in this property.
 * @property {*} features - Once the file has been loaded and parsed, the
 * resulting data is stored in this property.
 *
 * @example <caption>Simple: create a source, a layer, and let iTowns taking
 * care of everything.</caption>
 * const kmlSource = new itowns.FileSource({
 *     url: 'https://raw.githubusercontent.com/iTowns/iTowns2-sample-data/master/croquis.kml',
 *     crs: 'EPSG:4326',
 *     fetcher: itowns.Fetcher.xml,
 *     parser: itowns.KMLParser.parse,
 * });
 *
 * const kmlLayer = new itowns.ColorLayer('Kml', {
 *     name: 'kml',
 *     transparent: true,
 *     crs: view.tileLayer.extent.crs,
 *     source: kmlSource,
 * });
 *
 * view.addLayer(kmlLayer);
 *
 * @example <caption>Advanced: fetch some data, create a source, a layer, and
 * let iTowns do the parsing and converting.</caption>
 * // Parse and Convert by iTowns
 * itowns.Fetcher.xml('https://raw.githubusercontent.com/iTowns/iTowns2-sample-data/master/ULTRA2009.gpx')
 *     .then(function _(gpx) {
 *         const gpxSource = new itowns.FileSource({
 *             data: gpx,
 *             crs: 'EPSG:4326',
 *             parser: itowns.GpxParser.parse,
 *         });
 *
 *         const gpxLayer = new itowns.ColorLayer('Gpx', {
 *             name: 'Ultra 2009',
 *             transparent: true,
 *             source: gpxSource,
 *         });
 *
 *         return view.addLayer(gpxLayer);
 *     });
 *
 * @example <caption>More advanced: create a layer, fetch some data, parse the
 * data, append a source to the layer and add the layer to iTowns.</caption>
 * // Create a layer
 * const ariege = new itowns.GeometryLayer('ariege', new itowns.THREE.Group());
 *
 * // Specify update method and conversion
 * ariege.update = itowns.FeatureProcessing.update;
 * ariege.convert = itowns.Feature2Mesh.convert({
 *     color: () => new itowns.THREE.Color(0xffcc00),
 *     extrude: () => 5000,
 * });
 *
 * itowns.Fetcher.json('https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/departements/09-ariege/departement-09-ariege.geojson')
 *     .then(function _(geojson) {
 *         return itowns.GeoJsonParser.parse(geojson, {
 *             in: { in: 'EPSG:4326' },
 *             out: {
     *             crs: view.tileLayer.extent.crs,
     *             buildExtent: true,
     *             mergeFeatures: true,
     *             structure: '2d',
 *             },
 *         });
 *     }).then(function _(features) {
 *         ariege.source = new itowns.FileSource({
 *             crs: 'EPSG:4326',
 *             features,
 *         });
 *
 *         return view.addLayer(ariegeLayer);
 *     });
 */
var FileSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(FileSource, _Source);

  var _super = _createSuper(FileSource);

  /**
   * @param {Object} source - An object that can contain all properties of a
   * FileSource and {@link Source}. Only `crs` is mandatory, but if it
   * presents in `features` under the property `crs`, it is fine.
   *
   * @constructor
   */
  function FileSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, FileSource);

    /* istanbul ignore next */
    if (source.parsedData) {
      console.warn('FileSource parsedData parameter is deprecated, use features instead of.');
      source.features = source.features || source.parsedData;
    }
    /* istanbul ignore next */


    if (source.projection) {
      console.warn('FileSource projection parameter is deprecated, use crs instead.');
      source.crs = source.crs || source.projection;
    }

    if (!source.crs) {
      if (source.features && source.features.crs) {
        source.crs = source.features.crs;
      } else {
        throw new Error('source.crs is required in FileSource');
      }
    }

    if (!source.url && !source.fetchedData && !source.features) {
      throw new Error("url, fetchedData and features are not set in\n                FileSource; at least one needs to be present");
    } // the fake url is for when we use the fetchedData or features mode


    source.url = source.url || 'fake-file-url';
    _this = _super.call(this, source);
    _this.isFileSource = true;
    _this.fetchedData = source.fetchedData;

    if (!_this.fetchedData && !source.features) {
      _this.whenReady = _this.fetcher(_this.urlFromExtent(), _this.networkOptions).then(function (f) {
        _this.fetchedData = f;
      });
    } else if (source.features) {
      _this._featuresCaches[source.features.crs] = new _Cache["default"]();

      _this._featuresCaches[source.features.crs].setByArray(Promise.resolve(source.features), [0]);
    }

    _this.whenReady.then(function () {
      return _this.fetchedData;
    });

    _this.zoom = {
      min: 0,
      max: Infinity
    };
    return _this;
  }

  (0, _createClass2["default"])(FileSource, [{
    key: "urlFromExtent",
    value: function urlFromExtent() {
      return this.url;
    }
  }, {
    key: "onLayerAdded",
    value: function onLayerAdded(options) {
      var _this2 = this;

      options["in"] = this;
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(FileSource.prototype), "onLayerAdded", this).call(this, options);

      var features = this._featuresCaches[options.out.crs].getByArray([0]);

      if (!features) {
        options.out.buildExtent = this.crs != 'EPSG:4978';

        if (options.out.buildExtent) {
          options.out.forcedExtentCrs = options.out.crs != 'EPSG:4978' ? options.out.crs : _Crs["default"].formatToEPSG(this.crs);
        }

        features = this.parser(this.fetchedData, options);

        this._featuresCaches[options.out.crs].setByArray(features, [0]);
      }

      features.then(function (data) {
        if (data.extent) {
          _this2.extent = data.extent.clone(); // Transform local extent to data.crs projection.

          if (_this2.extent.crs == data.crs) {
            _this2.extent.applyMatrix4(data.matrixWorld);
          }
        }

        if (data.isFeatureCollection) {
          data.setParentStyle(options.out.style);
        }
      });
    }
    /**
     * load  data from cache or Fetch/Parse data.
     * The loaded data is a Feature or Texture.
     *
     * @param      {Extent}  extent   extent requested parsed data.
     * @param      {FeatureBuildingOptions|Layer}  out  The feature returned options
     * @return     {FeatureCollection|Texture}  The parsed data.
     */

  }, {
    key: "loadData",
    value: function loadData(extent, out) {
      return this._featuresCaches[out.crs].getByArray([0]);
    }
  }, {
    key: "extentInsideLimit",
    value: function extentInsideLimit(extent) {
      return this.extent.intersectsExtent(extent);
    }
  }]);
  return FileSource;
}(_Source2["default"]);

var _default = FileSource;
exports["default"] = _default;