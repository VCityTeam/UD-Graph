"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _Feature = require("../Core/Feature");

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function pointIsOverLine(point, linePoints, epsilon, offset, count, size) {
  var x0 = point.x;
  var y0 = point.y; // for each segment of the line (j is i -1)

  for (var i = offset + size, j = offset; i < offset + count; j = i, i += size) {
    /* **********************************************************
        norm     : norm of vector P1P2
        distance : distance point P0 to line P1P2
        scalar   : dot product of P1P0 and P1P2 divide by norm, it represents the projection of P0 on the line
         Point is over segment P1P2 if :
            * if the distance, , is inferior to epsilon
            * and if :  -epsilon ≤ scalar ≤ (||P1P2|| +  epsilon)
                         + (P0) _
                        |      |
                        |      |
         <---scalar---->|    distance
                        |      |
                        |      v
         +-------------------------------+
        (P1)                            (P2)
    *********************************************************** */
    var x1 = linePoints[i];
    var y1 = linePoints[i + 1];
    var x2 = linePoints[j];
    var y2 = linePoints[j + 1];
    var x21 = x2 - x1;
    var y21 = y2 - y1;
    var norm = Math.sqrt(x21 * x21 + y21 * y21);
    var scalar = ((x0 - x1) * x21 + (y0 - y1) * y21) / norm;

    if (scalar >= -epsilon && scalar <= norm + epsilon) {
      var distance = Math.abs(y21 * x0 - x21 * y0 + x2 * y1 - y2 * x1) / norm;

      if (distance <= epsilon) {
        return true;
      }
    }
  }

  return false;
}

function getClosestPoint(point, points, epsilon, offset, count, size) {
  var x0 = point.x;
  var y0 = point.y;
  var squaredEpsilon = epsilon * epsilon;
  var closestPoint;

  for (var i = offset; i < offset + count; i += size) {
    var x1 = points[i];
    var y1 = points[i + 1];
    var xP = x0 - x1;
    var yP = y0 - y1;
    var n = xP * xP + yP * yP;

    if (n < squaredEpsilon) {
      closestPoint = [points[i], points[i + 1]];
      squaredEpsilon = n;
    }
  }

  return closestPoint;
}

function pointIsInsidePolygon(point, polygonPoints, offset, count, size) {
  // ray-casting algorithm based on
  // http://wrf.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
  var x = point.x;
  var y = point.y;
  var inside = false; // in first j is last point of polygon
  // for each segment of the polygon (j is i -1)
  // debugger;

  for (var i = offset, j = offset + count - size; i < offset + count; j = i, i += size) {
    var xi = polygonPoints[i];
    var yi = polygonPoints[i + 1];
    var xj = polygonPoints[j];
    var yj = polygonPoints[j + 1]; // isIntersect semi-infinite ray horizontally with polygon's edge

    if (yi > y != yj > y && x < (xj - xi) * (y - yi) / (yj - yi) + xi) {
      inside = !inside;
    }
  }

  return inside;
}

function isFeatureSingleGeometryUnderCoordinate(coordinate, type, coordinates, epsilon, offset, count, size) {
  if (type == _Feature.FEATURE_TYPES.LINE && pointIsOverLine(coordinate, coordinates, epsilon, offset, count, size)) {
    return true;
  } else if (type == _Feature.FEATURE_TYPES.POLYGON && pointIsInsidePolygon(coordinate, coordinates, offset, count, size)) {
    return true;
  } else if (type == _Feature.FEATURE_TYPES.POINT) {
    var closestPoint = getClosestPoint(coordinate, coordinates, epsilon, offset, count, size);

    if (closestPoint) {
      return {
        coordinates: closestPoint
      };
    }
  }
}

function isFeatureUnderCoordinate(coordinate, feature, epsilon, result) {
  var featCoord = coordinate.as(feature.crs);

  var _iterator = _createForOfIteratorHelper(feature.geometries),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var geometry = _step.value;

      if (geometry.extent == undefined || geometry.extent.isPointInside(featCoord, epsilon)) {
        var offset = geometry.indices[0].offset * feature.size;
        var count = geometry.indices[0].count * feature.size;
        var under = isFeatureSingleGeometryUnderCoordinate(featCoord, feature.type, feature.vertices, epsilon, offset, count, feature.size);

        if (under) {
          result.push({
            type: feature.type,
            geometry: geometry,
            coordinates: under.coordinates
            /* || coordinates */
            ,
            style: feature.style
          });
        }
      }
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
}

var coord = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);
var _default = {
  /**
   * Filter from a list of features, features that are under a coordinate.
   *
   * @param {Coordinates} coordinate - The coordinate for the filter
   * condition.
   * @param {Feature|FeatureCollection} collection - A single feature or a
   * collection of them, to filter given the previous coordinate.
   * @param {number} [epsilon=0.1] Tolerance around the coordinate (in
   * coordinate's unit).
   *
   * @return {Feature[]} Array of filtered features.
   */
  filterFeaturesUnderCoordinate: function filterFeaturesUnderCoordinate(coordinate, collection) {
    var epsilon = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0.1;
    var result = []; // transform coordinates to collection system projection

    coordinate.as(collection.crs, coord); // transform coordinates to local system

    coord.applyMatrix4(collection.matrixWorldInverse);

    if (collection.extent.isPointInside(coord, epsilon)) {
      if (collection.isFeatureCollection) {
        epsilon *= Math.sqrt(Math.pow(collection.scale.x, 2) + Math.pow(collection.scale.y, 2));

        var _iterator2 = _createForOfIteratorHelper(collection.features),
            _step2;

        try {
          for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
            var feature = _step2.value;

            if (feature.extent && !feature.extent.isPointInside(coord, epsilon)) {
              continue;
            }

            isFeatureUnderCoordinate(coord, feature, epsilon, result);
          }
        } catch (err) {
          _iterator2.e(err);
        } finally {
          _iterator2.f();
        }
      } else if (collection.geometries) {
        isFeatureUnderCoordinate(coord, collection, epsilon, result);
      }
    }

    return result;
  }
};
exports["default"] = _default;