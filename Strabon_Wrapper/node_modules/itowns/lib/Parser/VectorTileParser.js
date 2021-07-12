"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _three = require("three");

var _pbf = _interopRequireDefault(require("pbf"));

var _vectorTile = require("@mapbox/vector-tile");

var _Extent = require("../Core/Geographic/Extent");

var _Feature = require("../Core/Feature");

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var worldDimension3857 = _Extent.globalExtentTMS.get('EPSG:3857').dimensions();

var globalExtent = new _three.Vector3(worldDimension3857.x, worldDimension3857.y, 1);
var lastPoint = new _three.Vector2();
var firstPoint = new _three.Vector2(); // Classify option, it allows to classify a full polygon and its holes.
// Each polygon with its holes are in one FeatureGeometry.
// A polygon is determined by its clockwise direction and the holes are in the opposite direction.
// Clockwise direction is determined by Shoelace formula https://en.wikipedia.org/wiki/Shoelace_formula
// Draw polygon with canvas doesn't need to classify however it is necessary for meshs.

function vtFeatureToFeatureGeometry(vtFeature, feature) {
  var classify = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
  var geometry = feature.bindNewGeometry();
  classify = classify && feature.type === _Feature.FEATURE_TYPES.POLYGON;
  geometry.properties = vtFeature.properties;
  var pbf = vtFeature._pbf;
  pbf.pos = vtFeature._geometry;
  var end = pbf.readVarint() + pbf.pos;
  var cmd = 1;
  var length = 0;
  var x = 0;
  var y = 0;
  var count = 0;
  var sum = 0;

  while (pbf.pos < end) {
    if (length <= 0) {
      var cmdLen = pbf.readVarint();
      cmd = cmdLen & 0x7;
      length = cmdLen >> 3;
    }

    length--;

    if (cmd === 1 || cmd === 2) {
      x += pbf.readSVarint();
      y += pbf.readSVarint();

      if (cmd === 1) {
        if (count) {
          if (classify && sum > 0 && geometry.indices.length > 0) {
            feature.updateExtent(geometry);
            geometry = feature.bindNewGeometry();
            geometry.properties = vtFeature.properties;
          }

          geometry.closeSubGeometry(count, feature);
          geometry.getLastSubGeometry().ccw = sum < 0;
        }

        count = 0;
        sum = 0;
      }

      count++;
      geometry.pushCoordinatesValues(feature, x, y);

      if (count == 1) {
        firstPoint.set(x, y);
        lastPoint.set(x, y);
      } else if (classify && count > 1) {
        sum += (lastPoint.x - x) * (lastPoint.y + y);
        lastPoint.set(x, y);
      }
    } else if (cmd === 7) {
      if (count) {
        count++;
        geometry.pushCoordinatesValues(feature, firstPoint.x, firstPoint.y);

        if (classify) {
          sum += (lastPoint.x - firstPoint.x) * (lastPoint.y + firstPoint.y);
        }
      }
    } else {
      throw new Error("unknown command ".concat(cmd));
    }
  }

  if (count) {
    if (classify && sum > 0 && geometry.indices.length > 0) {
      feature.updateExtent(geometry);
      geometry = feature.bindNewGeometry();
      geometry.properties = vtFeature.properties;
    }

    geometry.closeSubGeometry(count, feature);
    geometry.getLastSubGeometry().ccw = sum < 0;
  }

  feature.updateExtent(geometry);
}

function readPBF(file, options) {
  options.out = options.out || {};
  var vectorTile = new _vectorTile.VectorTile(new _pbf["default"](file));
  var sourceLayers = Object.keys(vectorTile.layers);

  if (sourceLayers.length < 1) {
    return;
  } // x,y,z tile coordinates


  var x = file.extent.col;
  var z = file.extent.zoom; // We need to move from TMS to Google/Bing/OSM coordinates
  // https://alastaira.wordpress.com/2011/07/06/converting-tms-tile-coordinates-to-googlebingosm-tile-coordinates/
  // Only if the layer.origin is top

  var y = options["in"].isInverted ? file.extent.row : (1 << z) - file.extent.row - 1;
  var collection = new _Feature.FeatureCollection(options.out);
  var vFeature = vectorTile.layers[sourceLayers[0]]; // TODO: verify if size is correct because is computed with only one feature (vFeature).

  var size = vFeature.extent * Math.pow(2, z);
  var center = -0.5 * size;
  collection.scale.set(globalExtent.x / size, -globalExtent.y / size, 1);
  collection.position.set(vFeature.extent * x + center, vFeature.extent * y + center, 0).multiply(collection.scale);
  collection.updateMatrixWorld();
  sourceLayers.forEach(function (layer_id) {
    if (!options["in"].layers[layer_id]) {
      return;
    }

    var sourceLayer = vectorTile.layers[layer_id];

    var _loop = function (i) {
      var vtFeature = sourceLayer.feature(i);
      var layers = options["in"].layers[layer_id].filter(function (l) {
        return l.filterExpression.filter({
          zoom: z
        }, vtFeature) && z >= l.zoom.min && z < l.zoom.max;
      });
      var feature = void 0;

      var _iterator = _createForOfIteratorHelper(layers),
          _step;

      try {
        var _loop2 = function () {
          var layer = _step.value;

          if (!feature) {
            feature = collection.requestFeatureById(layer.id, vtFeature.type - 1);
            feature.id = layer.id;
            feature.order = layer.order;
            feature.style = options["in"].styles[feature.id];
            vtFeatureToFeatureGeometry(vtFeature, feature);
          } else if (!collection.features.find(function (f) {
            return f.id === layer.id;
          })) {
            feature = collection.newFeatureByReference(feature);
            feature.id = layer.id;
            feature.order = layer.order;
            feature.style = options["in"].styles[feature.id];
          }
        };

        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          _loop2();
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }
    };

    for (var i = sourceLayer.length - 1; i >= 0; i--) {
      _loop(i);
    }
  });
  collection.removeEmptyFeature(); // TODO Some vector tiles are already sorted

  collection.features.sort(function (a, b) {
    return a.order - b.order;
  }); // TODO verify if is needed to updateExtent for previous features.

  collection.updateExtent();
  collection.extent = file.extent;
  collection.isInverted = options["in"].isInverted;
  return Promise.resolve(collection);
}
/**
 * @module VectorTileParser
 */


var _default = {
  /**
   * Parse a vector tile file and return a [Feature]{@link module:GeoJsonParser.Feature}
   * or an array of Features. While multiple formats of vector tile are
   * available, the only one supported for the moment is the
   * [Mapbox Vector Tile]{@link https://www.mapbox.com/vector-tiles/specification/}.
   *
   * @param {ArrayBuffer} file - The vector tile file to parse.
   *
   * @param {ParsingOptions} options - Options controlling the parsing {@link ParsingOptions}.
   *
   * @param {InformationsData} options.in - Object containing all styles,
   * layers and informations data, see {@link InformationsData}.
   *
   * @param {Object} options.in.Styles - Object containing subobject with
   * informations on a specific style layer. Styles available is by `layer.id` and by zoom.
   *
   * @param {Object} options.in.layers - Object containing subobject with
   *
   * @param {FeatureBuildingOptions} options.out - options indicates how the features should be built,
   * see {@link FeatureBuildingOptions}.
   *
   * @return {Promise} A Promise resolving with a Feature or an array a
   * Features.
   */
  parse: function parse(file, options) {
    options = (0, _Undeprecator.deprecatedParsingOptionsToNewOne)(options);
    return Promise.resolve(readPBF(file, options));
  }
};
exports["default"] = _default;