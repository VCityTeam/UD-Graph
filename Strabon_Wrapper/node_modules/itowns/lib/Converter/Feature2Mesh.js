"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _earcut = _interopRequireDefault(require("earcut"));

var _Feature = require("../Core/Feature");

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var _color = new THREE.Color();

function toColor(color) {
  if (color) {
    if (color.type == 'Color') {
      return color;
    } else {
      return _color.set(color);
    }
  } else {
    return _color.set(Math.random() * 0xffffff);
  }
}

function fillColorArray(colors, length, color) {
  var offset = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 0;
  offset *= 3;
  var len = offset + length * 3;

  for (var i = offset; i < len; i += 3) {
    colors[i] = color.r * 255;
    colors[i + 1] = color.g * 255;
    colors[i + 2] = color.b * 255;
  }
}

function fillBatchIdArray(batchId, batchIdArray, start, end) {
  for (var i = start; i < end; i++) {
    batchIdArray[i] = batchId;
  }
}
/**
 * Convert coordinates to vertices positionned at a given altitude
 *
 * @param      {number[]} ptsIn - Coordinates of a feature.
 * @param      {number[]} normals - Coordinates of a feature.
 * @param      {number[]} target - Target to copy result.
 * @param      {number}  zTranslation - Translation on Z axe.
 * @param      {number} offsetOut - The offset array value to copy on target
 * @param      {number} countIn - The count of coordinates to read in ptsIn
 * @param      {number} startIn - The offser array to strat reading in ptsIn
 */


function coordinatesToVertices(ptsIn, normals, target, zTranslation) {
  var offsetOut = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : 0;
  var countIn = arguments.length > 5 && arguments[5] !== undefined ? arguments[5] : ptsIn.length / 3;
  var startIn = arguments.length > 6 && arguments[6] !== undefined ? arguments[6] : offsetOut;
  startIn *= 3;
  countIn *= 3;
  offsetOut *= 3;
  var endIn = startIn + countIn;

  for (var i = startIn, j = offsetOut; i < endIn; i += 3, j += 3) {
    // move the vertex following the normal, to put the point on the good altitude
    // fill the vertices array at the offset position
    target[j] = ptsIn[i] + normals[i] * zTranslation;
    target[j + 1] = ptsIn[i + 1] + normals[i + 1] * zTranslation;
    target[j + 2] = ptsIn[i + 2] + normals[i + 2] * zTranslation;
  }
}
/*
 * Add indices for the side faces.
 * We loop over the contour and create a side face made of two triangles.
 *
 * For a ring made of (n) coordinates, there are (n*2) vertices.
 * The (n) first vertices are on the roof, the (n) other vertices are on the floor.
 *
 * If index (i) is on the roof, index (i+length) is on the floor.
 *
 * @param {number[]} indices - Array of indices to push to
 * @param {number} length - Total vertices count in the geom (excluding the extrusion ones)
 * @param {number} offset
 * @param {number} count
 * @param {boolean} isClockWise - Wrapping direction
 */


function addExtrudedPolygonSideFaces(indices, length, offset, count, isClockWise) {
  // loop over contour length, and for each point of the contour,
  // add indices to make two triangle, that make the side face
  var startIndice = indices.length;
  indices.length += (count - 1) * 6;

  for (var i = offset, j = startIndice; i < offset + count - 1; ++i, ++j) {
    if (isClockWise) {
      // first triangle indices
      indices[j] = i;
      indices[++j] = i + length;
      indices[++j] = i + 1; // second triangle indices

      indices[++j] = i + 1;
      indices[++j] = i + length;
      indices[++j] = i + length + 1;
    } else {
      // first triangle indices
      indices[j] = i + length;
      indices[++j] = i;
      indices[++j] = i + length + 1; // second triangle indices

      indices[++j] = i + length + 1;
      indices[++j] = i;
      indices[++j] = i + 1;
    }
  }
}

var pointMaterial = new THREE.PointsMaterial();

function featureToPoint(feature, options) {
  var ptsIn = feature.vertices;
  var normals = feature.normals;
  var colors = new Uint8Array(ptsIn.length);
  var batchIds = options.batchId ? new Uint32Array(ptsIn.length / 3) : undefined;
  var featureId = 0;
  var vertices;
  var zTranslation = options.GlobalZTrans - feature.altitude.min;

  if (zTranslation !== 0) {
    vertices = new Float32Array(ptsIn.length);
    coordinatesToVertices(ptsIn, normals, vertices, zTranslation);
  } else {
    vertices = new Float32Array(ptsIn);
  }

  var globals = {
    point: true
  };

  var _iterator = _createForOfIteratorHelper(feature.geometries),
      _step;

  try {
    var _loop = function () {
      var geometry = _step.value;
      var style = feature.style.drawingStylefromContext({
        globals: globals,
        properties: function properties() {
          return geometry.properties;
        }
      });
      var start = geometry.indices[0].offset;
      var count = geometry.indices[0].count;
      fillColorArray(colors, count, toColor(style.point.color), start);

      if (batchIds) {
        var id = options.batchId(geometry.properties, featureId);
        fillBatchIdArray(id, batchIds, start, start + count);
        featureId++;
      }
    };

    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      _loop();
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }

  var geom = new THREE.BufferGeometry();
  geom.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  geom.setAttribute('color', new THREE.BufferAttribute(colors, 3, true));

  if (batchIds) {
    geom.setAttribute('batchId', new THREE.BufferAttribute(batchIds, 1));
  }

  pointMaterial.size = feature.style.point.radius;
  return new THREE.Points(geom, pointMaterial);
}

var lineMaterial = new THREE.LineBasicMaterial();

function featureToLine(feature, options) {
  var ptsIn = feature.vertices;
  var normals = feature.normals;
  var colors = new Uint8Array(ptsIn.length);
  var count = ptsIn.length / 3;
  var batchIds = options.batchId ? new Uint32Array(count) : undefined;
  var featureId = 0;
  var vertices;
  var zTranslation = options.GlobalZTrans - feature.altitude.min;

  if (zTranslation != 0) {
    vertices = new Float32Array(ptsIn.length);
    coordinatesToVertices(ptsIn, normals, vertices, zTranslation);
  } else {
    vertices = new Float32Array(ptsIn);
  }

  var geom = new THREE.BufferGeometry();
  geom.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  var lines; // TODO CREATE material for each feature

  lineMaterial.linewidth = feature.style.stroke.width;
  var globals = {
    stroke: true
  };

  if (feature.geometries.length > 1) {
    var countIndices = (count - feature.geometries.length) * 2;
    var indices = new Uint16Array(countIndices);
    var i = 0; // Multi line case

    var _iterator2 = _createForOfIteratorHelper(feature.geometries),
        _step2;

    try {
      var _loop2 = function () {
        var geometry = _step2.value;
        var style = feature.style.drawingStylefromContext({
          globals: globals,
          properties: function properties() {
            return geometry.properties;
          }
        });
        var start = geometry.indices[0].offset; // To avoid integer overflow with indice value (16 bits)

        if (start > 0xffff) {
          console.warn('Feature to Line: integer overflow, too many points in lines');
          return "break";
        }

        var count = geometry.indices[0].count;
        var end = start + count;
        fillColorArray(colors, count, toColor(style.stroke.color), start);

        for (var j = start; j < end - 1; j++) {
          if (j < 0xffff) {
            indices[i++] = j;
            indices[i++] = j + 1;
          } else {
            break;
          }
        }

        if (batchIds) {
          var id = options.batchId(geometry.properties, featureId);
          fillBatchIdArray(id, batchIds, start, end);
          featureId++;
        }
      };

      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        var _ret = _loop2();

        if (_ret === "break") break;
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }

    geom.setAttribute('color', new THREE.BufferAttribute(colors, 3, true));

    if (batchIds) {
      geom.setAttribute('batchId', new THREE.BufferAttribute(batchIds, 1));
    }

    geom.setIndex(new THREE.BufferAttribute(indices, 1));
    lines = new THREE.LineSegments(geom, lineMaterial);
  } else {
    var style = feature.style.drawingStylefromContext({
      globals: globals,
      properties: function properties() {
        return feature.geometries[0].properties;
      }
    });
    fillColorArray(colors, count, toColor(style.stroke.color));
    geom.setAttribute('color', new THREE.BufferAttribute(colors, 3, true));

    if (batchIds) {
      var id = options.batchId(feature.geometries[0].properties, featureId);
      fillBatchIdArray(id, batchIds, 0, count);
      geom.setAttribute('batchId', new THREE.BufferAttribute(batchIds, 1));
    }

    lines = new THREE.Line(geom, lineMaterial);
  }

  return lines;
}

var material = new THREE.MeshBasicMaterial();

function featureToPolygon(feature, options) {
  var ptsIn = feature.vertices;
  var normals = feature.normals;
  var vertices;
  var zTranslation = options.GlobalZTrans - feature.altitude.min;

  if (zTranslation != 0) {
    vertices = new Float32Array(ptsIn.length);
    coordinatesToVertices(ptsIn, normals, vertices, zTranslation);
  } else {
    vertices = new Float32Array(ptsIn);
  }

  var colors = new Uint8Array(ptsIn.length);
  var indices = [];
  var batchIds = options.batchId ? new Uint32Array(vertices.length / 3) : undefined;
  var globals = {
    fill: true
  };
  var featureId = 0;

  var _iterator3 = _createForOfIteratorHelper(feature.geometries),
      _step3;

  try {
    var _loop3 = function () {
      var geometry = _step3.value;
      var start = geometry.indices[0].offset; // To avoid integer overflow with indice value (16 bits)

      if (start > 0xffff) {
        console.warn('Feature to Polygon: integer overflow, too many points in polygons');
        return "break";
      }

      var style = feature.style.drawingStylefromContext({
        globals: globals,
        properties: function properties() {
          return geometry.properties;
        }
      });
      var lastIndice = geometry.indices.slice(-1)[0];
      var end = lastIndice.offset + lastIndice.count;
      fillColorArray(colors, end - start, toColor(style.fill.color), start);
      var geomVertices = vertices.slice(start * 3, end * 3);
      var holesOffsets = geometry.indices.map(function (i) {
        return i.offset - start;
      }).slice(1);
      var triangles = (0, _earcut["default"])(geomVertices, holesOffsets, 3);
      var startIndice = indices.length;
      indices.length += triangles.length;

      for (var i = 0; i < triangles.length; i++) {
        indices[startIndice + i] = triangles[i] + start;
      }

      if (batchIds) {
        var id = options.batchId(geometry.properties, featureId);
        fillBatchIdArray(id, batchIds, start, end);
        featureId++;
      }
    };

    for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
      var _ret2 = _loop3();

      if (_ret2 === "break") break;
    }
  } catch (err) {
    _iterator3.e(err);
  } finally {
    _iterator3.f();
  }

  var geom = new THREE.BufferGeometry();
  geom.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  geom.setAttribute('color', new THREE.BufferAttribute(colors, 3, true));

  if (batchIds) {
    geom.setAttribute('batchId', new THREE.BufferAttribute(batchIds, 1));
  }

  geom.setIndex(new THREE.BufferAttribute(new Uint16Array(indices), 1));
  return new THREE.Mesh(geom, material);
}

function area(contour, offset, count) {
  offset *= 3;
  var n = count * 3;
  var a = 0.0;

  for (var p = n + offset - 3, q = offset; q < n; p = q, q += 3) {
    a += contour[p] * contour[q + 1] - contour[q] * contour[p + 1];
  }

  return a * 0.5;
}

var bottomColor = new THREE.Color();

function featureToExtrudedPolygon(feature, options) {
  var ptsIn = feature.vertices;
  var offset = feature.geometries[0].indices[0].offset;
  var count = feature.geometries[0].indices[0].count;
  var isClockWise = area(ptsIn, offset, count) < 0;
  var normals = feature.normals;
  var vertices = new Float32Array(ptsIn.length * 2);
  var colors = new Uint8Array(ptsIn.length * 2);
  var indices = [];
  var totalVertices = ptsIn.length / 3;
  var batchIds = options.batchId ? new Uint32Array(vertices.length / 3) : undefined;
  var featureId = 0;
  var z = options.GlobalZTrans - feature.altitude.min;
  var globals = {
    fill: true
  };

  var _iterator4 = _createForOfIteratorHelper(feature.geometries),
      _step4;

  try {
    var _loop4 = function () {
      var geometry = _step4.value;
      var style = feature.style.drawingStylefromContext({
        globals: globals,
        properties: function properties() {
          return geometry.properties;
        }
      }); // topColor is assigned to the top of extruded polygon

      var topColor = toColor(style.fill.color); // bottomColor is assigned to the bottom of extruded polygon

      bottomColor.copy(topColor);
      bottomColor.multiplyScalar(0.5);
      var start = geometry.indices[0].offset;
      var lastIndice = geometry.indices.slice(-1)[0];
      var end = lastIndice.offset + lastIndice.count;
      var count = end - start;
      coordinatesToVertices(ptsIn, normals, vertices, z, start, count);
      fillColorArray(colors, count, bottomColor, start);
      var startTop = start + totalVertices;
      var endTop = end + totalVertices;
      coordinatesToVertices(ptsIn, normals, vertices, z + style.fill.extrusion_height, startTop, count, start);
      fillColorArray(colors, count, topColor, startTop);
      var geomVertices = vertices.slice(startTop * 3, endTop * 3);
      var holesOffsets = geometry.indices.map(function (i) {
        return i.offset - start;
      }).slice(1);
      var triangles = (0, _earcut["default"])(geomVertices, holesOffsets, 3);
      var startIndice = indices.length;
      indices.length += triangles.length;

      for (var i = 0; i < triangles.length; i++) {
        indices[startIndice + i] = triangles[i] + startTop;
      }

      var _iterator5 = _createForOfIteratorHelper(geometry.indices),
          _step5;

      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          var indice = _step5.value;
          addExtrudedPolygonSideFaces(indices, totalVertices, indice.offset, indice.count, isClockWise);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }

      if (batchIds) {
        var id = options.batchId(geometry.properties, featureId);
        fillBatchIdArray(id, batchIds, start, end);
        fillBatchIdArray(id, batchIds, startTop, endTop);
        featureId++;
      }
    };

    for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
      _loop4();
    }
  } catch (err) {
    _iterator4.e(err);
  } finally {
    _iterator4.f();
  }

  var geom = new THREE.BufferGeometry();
  geom.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  geom.setAttribute('color', new THREE.BufferAttribute(colors, 3, true));

  if (batchIds) {
    geom.setAttribute('batchId', new THREE.BufferAttribute(batchIds, 1));
  }

  geom.setIndex(new THREE.BufferAttribute(new Uint16Array(indices), 1));
  var mesh = new THREE.Mesh(geom, material);
  return mesh;
}
/**
 * Convert a [Feature]{@link Feature} to a Mesh
 *
 * @param {Feature} feature - the feature to convert
 * @param {Object} options - options controlling the conversion
 * @return {THREE.Mesh} mesh
 */


function featureToMesh(feature, options) {
  if (!feature.vertices) {
    return;
  }

  var mesh;

  switch (feature.type) {
    case _Feature.FEATURE_TYPES.POINT:
      mesh = featureToPoint(feature, options);
      break;

    case _Feature.FEATURE_TYPES.LINE:
      mesh = featureToLine(feature, options);
      break;

    case _Feature.FEATURE_TYPES.POLYGON:
      if (feature.style.fill.extrusion_height) {
        mesh = featureToExtrudedPolygon(feature, options);
      } else {
        mesh = featureToPolygon(feature, options);
      }

      break;

    default:
  } // set mesh material


  mesh.material.vertexColors = true;
  mesh.material.color = new THREE.Color(0xffffff);
  mesh.feature = feature;
  mesh.position.z = feature.altitude.min - options.GlobalZTrans;
  return mesh;
}
/**
 * @module Feature2Mesh
 */


var _default = {
  /**
   * Return a function that converts [Features]{@link module:GeoJsonParser} to Meshes. Feature collection will be converted to a
   * a THREE.Group.
   *
   * @param {Object} options - options controlling the conversion
   * @param {function} [options.batchId] - optional function to create batchId attribute. It is passed the feature property and the feature index. As the batchId is using an unsigned int structure on 32 bits, the batchId could be between 0 and 4,294,967,295.
   * @return {function}
   * @example <caption>Example usage of batchId with featureId.</caption>
   * view.addLayer({
   *     id: 'WFS Buildings',
   *     type: 'geometry',
   *     update: itowns.FeatureProcessing.update,
   *     convert: itowns.Feature2Mesh.convert({
   *         batchId: (property, featureId) => featureId,
   *     }),
   *     filter: acceptFeature,
   *     source,
   * });
   *
   * @example <caption>Example usage of batchId with property.</caption>
   * view.addLayer({
   *     id: 'WFS Buildings',
   *     type: 'geometry',
   *     update: itowns.FeatureProcessing.update,
   *     convert: itowns.Feature2Mesh.convert({
   *         batchId: (property, featureId) => property.house ? 10 : featureId,
   *         }),
   *     filter: acceptFeature,
   *     source,
   * });
   */
  convert: function convert() {
    var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
    (0, _Undeprecator.deprecatedFeature2MeshOptions)(options);
    return function (collection) {
      if (!collection) {
        return;
      }

      var features = collection.features;

      if (!features || features.length == 0) {
        return;
      }

      var group = new THREE.Group();
      options.GlobalZTrans = collection.center.z;
      features.forEach(function (feature) {
        return group.add(featureToMesh(feature, options));
      });
      group.quaternion.copy(collection.quaternion);
      group.position.copy(collection.position);
      return group;
    };
  }
};
exports["default"] = _default;