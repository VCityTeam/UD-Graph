"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _proj = _interopRequireDefault(require("proj4"));

var _shpjs = _interopRequireDefault(require("shpjs"));

var _GeoJsonParser = _interopRequireDefault(require("./GeoJsonParser"));

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

/**
 * The ShapefileParser module provides a [parse]{@link
 * module:ShapefileParser.parse} method that takes a bunch of files constituing
 * a shapefile in and gives an object formateted for iTowns, containing all
 * necessary informations to display this shapefile.
 *
 * It uses the [shpjs]{@link https://www.npmjs.com/package/shpjs} library to
 * parse all the files.
 *
 * @example
 * // Load all the necessary files for a shapefile, parse them and
 * // display them using a FileSource.
 * Promise.all([
 *     Fetcher.arrayBuffer('shapefile.shp'),
 *     Fetcher.arrayBuffer('shapefile.dbf'),
 *     Fetcher.arrayBuffer('shapefile.shx'),
 *     Fetcher.text('shapefile.prj'),
 * ]).then(function _(res) {
 *     return ShapefileParser.parse({
 *         shp: res[0],
 *         dbf: res[1],
 *         shx: res[2],
 *         prj: res[3],
 *     }, {
 *            in: {
 *              crs: 'EPSG:4326',
 *         },
 *         out: {
 *             crs: view.tileLayer.extent.crs,
 *             buildExtent: true,
 *         }
 *     });
 * }).then(function _(geojson) {
 *     var source = new FileSource({ features: geojson });
 *     var layer = new ColorLayer('velib', { source  });
 *     view.addLayer(layer);
 * });
 *
 *
 * @module ShapefileParser
 */
var _default = {
  /**
   * Parse a bunch of Shapefile files and return a [FeatureCollection]{@link
   * module:GeoJsonParser~FeatureCollection}.
   *
   * @param {Object} data - All the data that can be specified in a shapefile.
   * @param {ArrayBuffer} data.shp - Data from the shapefile itself,
   * containing the feature geometry itself.
   * @param {ArrayBuffer} data.shx - A positional index of the feature
   * geometry.
   * @param {ArrayBuffer} data.dbf - Columnar attributes for each shape, in
   * [dBase]{@link https://en.wikipedia.org/wiki/DBase} IV format.
   * @param {string} [data.prj] - The coordinate system and crs projection
   * information.
   * @param {ParsingOptions} [options]
   *
   * @return {Promise} A promise resolving with a {@link FeatureCollection}.
   */
  parse: function parse(data) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    options = (0, _Undeprecator.deprecatedParsingOptionsToNewOne)(options);
    var result; // If a zip is present, don't read anything else

    if (data.zip) {
      result = _shpjs["default"].parseZip(data.zip);
    } else if (data.shp && data.shx && data.dbf) {
      result = Promise.all([_shpjs["default"].parseShp(data.shp, data.prj), _shpjs["default"].parseDbf(data.dbf)]).then(_shpjs["default"].combine);
    }

    options["in"] = options["in"] || {};
    options["in"].crs = data.prj ? (0, _proj["default"])(data.prj).oProj.datumName : undefined;
    return Promise.resolve(result).then(function (res) {
      return _GeoJsonParser["default"].parse(res, options);
    });
  }
};
exports["default"] = _default;