"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _Feature = require("../Core/Feature");

var _Style = _interopRequireDefault(require("../Core/Style"));

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function readCRS(json) {
  if (json.crs) {
    if (json.crs.type.toLowerCase() == 'epsg') {
      return "EPSG:".concat(json.crs.properties.code);
    } else if (json.crs.type.toLowerCase() == 'name') {
      var epsgIdx = json.crs.properties.name.toLowerCase().indexOf('epsg:');

      if (epsgIdx >= 0) {
        // authority:version:code => EPSG:[...]:code
        var codeStart = json.crs.properties.name.indexOf(':', epsgIdx + 5);

        if (codeStart > 0) {
          return "EPSG:".concat(json.crs.properties.name.substr(codeStart + 1));
        }
      }
    }

    throw new Error("Unsupported CRS type '".concat(json.crs, "'"));
  } // assume default crs


  return 'EPSG:4326';
}

var coord = new _Coordinates["default"]('EPSG:4978', 0, 0, 0); // filter with the first point

var firstPtIsOut = function (extent, aCoords, crs) {
  coord.crs = crs;
  coord.setFromArray(aCoords[0]);
  return !extent.isPointInside(coord);
};

var toFeature = {
  populateGeometry: function populateGeometry(crsIn, coordinates, geometry, feature) {
    geometry.startSubGeometry(coordinates.length, feature);
    coord.crs = crsIn; // coordinates is a list of pair [[x1, y1], [x2, y2], ..., [xn, yn]]
    // or list of triplet [[x1, y1, z1], [x2, y2, z2], ..., [xn, yn, zn]]

    var _iterator = _createForOfIteratorHelper(coordinates),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var triplet = _step.value;
        coord.setFromValues(triplet[0], triplet[1], triplet[2]);
        geometry.pushCoordinates(coord, feature);
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    geometry.updateExtent();
  },
  point: function point(feature, crsIn, coordsIn, collection, properties) {
    this["default"](feature, crsIn, [coordsIn], collection, properties);
  },
  "default": function _default(feature, crsIn, coordsIn, collection, properties) {
    if (collection.filterExtent && firstPtIsOut(collection.filterExtent, coordsIn, crsIn)) {
      return;
    }

    var geometry = feature.bindNewGeometry();
    geometry.properties = properties;
    geometry.properties.style = new _Style["default"]({}, feature.style).setFromGeojsonProperties(properties, feature.type);
    this.populateGeometry(crsIn, coordsIn, geometry, feature);
    feature.updateExtent(geometry);
  },
  polygon: function polygon(feature, crsIn, coordsIn, collection, properties) {
    // filtering
    if (collection.filterExtent && firstPtIsOut(collection.filterExtent, coordsIn[0], crsIn)) {
      return;
    }

    var geometry = feature.bindNewGeometry();
    geometry.properties = properties;
    geometry.properties.style = new _Style["default"]({}, feature.style).setFromGeojsonProperties(properties, feature.type); // Then read contour and holes

    for (var i = 0; i < coordsIn.length; i++) {
      this.populateGeometry(crsIn, coordsIn[i], geometry, feature);
    }

    feature.updateExtent(geometry);
  },
  multi: function multi(type, feature, crsIn, coordsIn, collection, properties) {
    var _iterator2 = _createForOfIteratorHelper(coordsIn),
        _step2;

    try {
      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        var coords = _step2.value;
        this[type](feature, crsIn, coords, collection, properties);
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }
  }
};

function coordinatesToFeature(type, feature, crsIn, coordinates, collection, properties) {
  if (coordinates.length == 0) {
    return;
  }

  switch (type) {
    case 'point':
    case 'linestring':
      return toFeature["default"](feature, crsIn, coordinates, collection, properties);

    case 'multipoint':
      return toFeature.multi('point', feature, crsIn, coordinates, collection, properties);

    case 'multilinestring':
      return toFeature.multi('default', feature, crsIn, coordinates, collection, properties);

    case 'polygon':
      return toFeature.polygon(feature, crsIn, coordinates, collection, properties);

    case 'multipolygon':
      return toFeature.multi('polygon', feature, crsIn, coordinates, collection, properties);

    case 'geometrycollection':
    default:
      throw new Error("Unhandled geojson type ".concat(feature.type));
  }
}

function toFeatureType(jsonType) {
  switch (jsonType) {
    case 'point':
    case 'multipoint':
      return _Feature.FEATURE_TYPES.POINT;

    case 'linestring':
    case 'multilinestring':
      return _Feature.FEATURE_TYPES.LINE;

    case 'polygon':
    case 'multipolygon':
      return _Feature.FEATURE_TYPES.POLYGON;

    case 'geometrycollection':
    default:
      throw new Error("Unhandled geometry type ".concat(jsonType));
  }
}

var keyProperties = ['type', 'geometry', 'properties'];

function jsonFeatureToFeature(crsIn, json, collection) {
  var jsonType = json.geometry.type.toLowerCase();
  var featureType = toFeatureType(jsonType);
  var feature = collection.requestFeatureByType(featureType);
  var coordinates = jsonType != 'point' ? json.geometry.coordinates : [json.geometry.coordinates];
  var properties = json.properties || {}; // copy other properties

  for (var _i = 0, _Object$keys = Object.keys(json); _i < _Object$keys.length; _i++) {
    var key = _Object$keys[_i];

    if (!keyProperties.includes(key.toLowerCase())) {
      // create `geojson` key if it does not exist yet
      properties.geojson = properties.geojson || {}; // add key defined property to `geojson` property

      properties.geojson[key] = json[key];
    }
  }

  coordinatesToFeature(jsonType, feature, crsIn, coordinates, collection, properties);
  return feature;
}

function jsonFeaturesToFeatures(crsIn, jsonFeatures, options) {
  var collection = new _Feature.FeatureCollection(options);

  var filter = options.filter || function () {
    return true;
  };

  var _iterator3 = _createForOfIteratorHelper(jsonFeatures),
      _step3;

  try {
    for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
      var jsonFeature = _step3.value;

      if (filter(jsonFeature.properties, jsonFeature.geometry)) {
        jsonFeatureToFeature(crsIn, jsonFeature, collection);
      }
    }
  } catch (err) {
    _iterator3.e(err);
  } finally {
    _iterator3.f();
  }

  collection.removeEmptyFeature();
  collection.updateExtent();
  return collection;
}
/**
 * The GeoJsonParser module provide a [parse]{@link module:GeoJsonParser.parse}
 * method that takes a GeoJSON in and gives an object formatted for iTowns
 * containing all necessary informations to display this GeoJSON.
 *
 * @module GeoJsonParser
 */


var _default = {
  /**
   * Parse a GeoJSON file content and return a [FeatureCollection]{@link FeatureCollection}.
   *
   * @param {string} json - The GeoJSON file content to parse.
   * @param {ParsingOptions} options - Options controlling the parsing.
    * @return {Promise} A promise resolving with a [FeatureCollection]{@link FeatureCollection}.
   */
  parse: function parse(json) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    options = (0, _Undeprecator.deprecatedParsingOptionsToNewOne)(options);
    options["in"] = options["in"] || {};
    var out = options.out;
    var _in = options["in"];

    if (typeof json === 'string') {
      json = JSON.parse(json);
    }

    _in.crs = _in.crs || readCRS(json);

    if (out.filteringExtent) {
      if (typeof out.filteringExtent == 'boolean') {
        out.filterExtent = json.extent.as(_in.crs);
      } else if (out.filteringExtent.isExtent) {
        out.filterExtent = out.filteringExtent;
      }
    }

    switch (json.type.toLowerCase()) {
      case 'featurecollection':
        return Promise.resolve(jsonFeaturesToFeatures(_in.crs, json.features, out));

      case 'feature':
        return Promise.resolve(jsonFeaturesToFeatures(_in.crs, [json], out));

      default:
        throw new Error("Unsupported GeoJSON type: '".concat(json.type));
    }
  }
};
exports["default"] = _default;