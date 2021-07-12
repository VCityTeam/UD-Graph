"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _togeojson = require("@tmcw/togeojson");

var _GeoJsonParser = _interopRequireDefault(require("./GeoJsonParser"));

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

/**
 * The KMLParser module provides a [parse]{@link module:KMLParser.parse}
 * method that takes a KML in and gives an object formatted for iTowns
 * containing all necessary informations to display this KML.
 *
 * @module KMLParser
 */
var _default = {
  /**
   * Parse a KML file content and return a [FeatureCollection]{@link
   * module:GeoJsonParser~FeatureCollection}.
   *
   * @param {XMLDocument} kmlFile - The KML file content to parse.
   * @param {ParsingOptions} options - Options controlling the parsing.
   *
   * @return {Promise} A promise resolving with a [FeatureCollection]{@link
   * module:GeoJsonParser~FeatureCollection}.
   */
  parse: function parse(kmlFile, options) {
    options = (0, _Undeprecator.deprecatedParsingOptionsToNewOne)(options);
    return _GeoJsonParser["default"].parse((0, _togeojson.kml)(kmlFile), options);
  }
};
exports["default"] = _default;