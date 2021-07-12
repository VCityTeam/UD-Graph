"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = computeBuffers;

var THREE = _interopRequireWildcard(require("three"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function computeBuffers(params) {
  // Create output buffers.
  var outBuffers = {
    index: null,
    position: null,
    normal: null,
    // 2 UV set per tile: wgs84 (uv_0) and pm (uv_1)
    //    - wgs84: 1 texture per tile because tiles are using wgs84 projection
    //    - pm: use multiple textures per tile.
    //      +-------------------------+
    //      |                         |
    //      |     Texture 0           |
    //      +-------------------------+
    //      |                         |
    //      |     Texture 1           |
    //      +-------------------------+
    //      |                         |
    //      |     Texture 2           |
    //      +-------------------------+
    //        * u = wgs84.u
    //        * v = textureid + v in builder texture
    uvs: []
  };
  var computeUvs = [];
  var builder = params.builder;
  var nSeg = params.segment || 8; // segments count :
  // Tile : (nSeg + 1) * (nSeg + 1)
  // Skirt : 8 * (nSeg - 1)

  var nVertex = (nSeg + 1) * (nSeg + 1) + (params.disableSkirt ? 0 : 4 * nSeg);

  if (nVertex > Math.pow(2, 32)) {
    throw new Error('Tile segments count is too big');
  }

  var triangles = nSeg * nSeg * 2 + (params.disableSkirt ? 0 : 4 * nSeg * 2);
  outBuffers.position = new Float32Array(nVertex * 3);
  outBuffers.normal = new Float32Array(nVertex * 3);
  var uvCount = params.builder.uvCount;

  if (uvCount > 1) {
    outBuffers.uvs[1] = new Float32Array(nVertex);
  }

  computeUvs[0] = function () {};

  if (params.buildIndexAndUv_0) {
    if (nVertex < Math.pow(2, 8)) {
      outBuffers.index = new Uint8Array(triangles * 3);
    } else if (nVertex < Math.pow(2, 16)) {
      outBuffers.index = new Uint16Array(triangles * 3);
    } else if (nVertex < Math.pow(2, 32)) {
      outBuffers.index = new Uint32Array(triangles * 3);
    }

    outBuffers.uvs[0] = new Float32Array(nVertex * 2);

    computeUvs[0] = function (id, u, v) {
      outBuffers.uvs[0][id * 2 + 0] = u;
      outBuffers.uvs[0][id * 2 + 1] = v;
    };
  }

  var widthSegments = Math.max(2, Math.floor(nSeg) || 2);
  var heightSegments = Math.max(2, Math.floor(nSeg) || 2);
  var idVertex = 0;
  var vertices = [];
  var skirt = [];
  var skirtEnd = [];
  builder.prepare(params);

  for (var y = 0; y <= heightSegments; y++) {
    var verticesRow = [];
    var v = y / heightSegments;
    builder.vProjecte(v, params);

    if (uvCount > 1) {
      (function () {
        var u = builder.computeUvs[1](params);

        computeUvs[1] = function (id) {
          outBuffers.uvs[1][id] = u;
        };
      })();
    }

    for (var x = 0; x <= widthSegments; x++) {
      var u = x / widthSegments;
      var id_m3 = idVertex * 3;
      builder.uProjecte(u, params);
      var vertex = builder.vertexPosition(params, params.projected);
      var normal = builder.vertexNormal(params); // move geometry to center world

      vertex.sub(params.center); // align normal to z axis

      if (params.quatNormalToZ) {
        vertex.applyQuaternion(params.quatNormalToZ);
        normal.applyQuaternion(params.quatNormalToZ);
      }

      vertex.toArray(outBuffers.position, id_m3);
      normal.toArray(outBuffers.normal, id_m3);

      var _iterator = _createForOfIteratorHelper(computeUvs),
          _step;

      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var computeUv = _step.value;
          computeUv(idVertex, u, v);
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }

      if (!params.disableSkirt) {
        if (y !== 0 && y !== heightSegments) {
          if (x === widthSegments) {
            skirt.push(idVertex);
          } else if (x === 0) {
            skirtEnd.push(idVertex);
          }
        }
      }

      verticesRow.push(idVertex);
      idVertex++;
    }

    vertices.push(verticesRow);

    if (y === 0) {
      skirt = skirt.concat(verticesRow);
    } else if (y === heightSegments) {
      skirt = skirt.concat(verticesRow.slice().reverse());
    }
  }

  if (!params.disableSkirt) {
    skirt = skirt.concat(skirtEnd.reverse());
  }

  function bufferize(va, vb, vc, idVertex) {
    outBuffers.index[idVertex + 0] = va;
    outBuffers.index[idVertex + 1] = vb;
    outBuffers.index[idVertex + 2] = vc;
    return idVertex + 3;
  }

  var idVertex2 = 0;

  if (params.buildIndexAndUv_0) {
    for (var _y = 0; _y < heightSegments; _y++) {
      for (var _x = 0; _x < widthSegments; _x++) {
        var v1 = vertices[_y][_x + 1];
        var v2 = vertices[_y][_x];
        var v3 = vertices[_y + 1][_x];
        var v4 = vertices[_y + 1][_x + 1];
        idVertex2 = bufferize(v4, v2, v1, idVertex2);
        idVertex2 = bufferize(v4, v3, v2, idVertex2);
      }
    }
  }

  var iStart = idVertex; // TODO: WARNING beware skirt's size influences performance
  // The size of the skirt is now a ratio of the size of the tile.
  // To be perfect it should depend on the real elevation delta but too heavy to compute

  if (!params.disableSkirt) {
    // We compute the actual size of tile segment to use later for the skirt.
    var segmentSize = new THREE.Vector3().fromArray(outBuffers.position).distanceTo(new THREE.Vector3().fromArray(outBuffers.position, 3));

    var buildIndexSkirt = function () {};

    var buildUVSkirt = function () {};

    if (params.buildIndexAndUv_0) {
      buildIndexSkirt = function (id, v1, v2, v3, v4) {
        id = bufferize(v1, v2, v3, id);
        id = bufferize(v1, v3, v4, id);
        return id;
      };

      buildUVSkirt = function (id) {
        outBuffers.uvs[0][idVertex * 2 + 0] = outBuffers.uvs[0][id * 2 + 0];
        outBuffers.uvs[0][idVertex * 2 + 1] = outBuffers.uvs[0][id * 2 + 1];
      };
    }

    for (var i = 0; i < skirt.length; i++) {
      var id = skirt[i];

      var _id_m = idVertex * 3;

      var id2_m3 = id * 3;
      outBuffers.position[_id_m + 0] = outBuffers.position[id2_m3 + 0] - outBuffers.normal[id2_m3 + 0] * segmentSize;
      outBuffers.position[_id_m + 1] = outBuffers.position[id2_m3 + 1] - outBuffers.normal[id2_m3 + 1] * segmentSize;
      outBuffers.position[_id_m + 2] = outBuffers.position[id2_m3 + 2] - outBuffers.normal[id2_m3 + 2] * segmentSize;
      outBuffers.normal[_id_m + 0] = outBuffers.normal[id2_m3 + 0];
      outBuffers.normal[_id_m + 1] = outBuffers.normal[id2_m3 + 1];
      outBuffers.normal[_id_m + 2] = outBuffers.normal[id2_m3 + 2];
      buildUVSkirt(id);

      if (uvCount > 1) {
        outBuffers.uvs[1][idVertex] = outBuffers.uvs[1][id];
      }

      var idf = (i + 1) % skirt.length;
      var _v2 = idVertex;

      var _v3 = idf === 0 ? iStart : idVertex + 1;

      var _v4 = skirt[idf];
      idVertex2 = buildIndexSkirt(idVertex2, id, _v2, _v3, _v4);
      idVertex++;
    }
  }

  return outBuffers;
}