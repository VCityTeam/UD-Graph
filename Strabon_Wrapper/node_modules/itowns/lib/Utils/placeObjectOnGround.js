"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _DEMUtils = _interopRequireDefault(require("./DEMUtils"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var temp = {
  v: new THREE.Vector3(),
  coord1: new _Coordinates["default"]('EPSG:4978'),
  coord2: new _Coordinates["default"]('EPSG:4978'),
  offset: new THREE.Vector2()
};

function _updateVector3(layer, method, nodes, vecCRS, vec, offset) {
  var matrices = arguments.length > 6 && arguments[6] !== undefined ? arguments[6] : {};
  var coords = arguments.length > 7 ? arguments[7] : undefined;
  var cache = arguments.length > 8 ? arguments[8] : undefined;
  var coord = coords || new _Coordinates["default"](vecCRS);

  if (matrices.worldFromLocal) {
    coord.setFromVector3(temp.v.copy(vec).applyMatrix4(matrices.worldFromLocal));
  } else {
    coord.setFromVector3(vec);
  }

  var result = _DEMUtils["default"].getTerrainObjectAt(layer, coord, method, nodes, cache);

  if (result) {
    result.coord.z += offset;
    result.coord.as(vecCRS, temp.coord2).toVector3(vec);

    if (matrices.localFromWorld) {
      vec.applyMatrix4(matrices.localFromWorld);
    }

    return {
      id: result.texture.id,
      version: result.texture.version,
      tile: result.tile
    };
  }
}
/**
 * @deprecated
 * Helper method that will position an object directly on the ground.
 *
 * @param {TiledGeometryLayer} layer - The tile layer owning the elevation
 * textures we're going to query. This is typically a `GlobeLayer` or
 * `PlanarLayer` (accessible through `view.tileLayer`).
 * @param {string} crs - The CRS used by the object coordinates. You
 * probably want to use `view.referenceCRS` here.
 * @param {Object3D} obj - the object we want to modify.
 * @param {Object} options
 * @param {number} [options.method=FAST_READ_Z] - There are two available methods:
 * `FAST_READ_Z` (default) or `PRECISE_READ_Z`. The first one is faster,
 * while the second one is slower but gives better precision.
 * @param {boolean} options.modifyGeometry - if unset/false, this function
 * will modify object.position. If true, it will modify
 * `obj.geometry.vertices` or `obj.geometry.attributes.position`.
 * @param {TileMesh[]} [tileHint] - Optional array of tiles to speed up the
 * process. You can give candidates tiles likely to contain `coord`.
 * Otherwise the lookup process starts from the root of `layer`.
 *
 * @return {boolean} true if successful, false if we couldn't lookup the elevation at the given coords
 */

/* istanbul ignore next */


function placeObjectOnGround(layer, crs, obj) {
  var options = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};
  var tileHint = arguments.length > 4 ? arguments[4] : undefined;
  console.warn('placeObjectOnGround has been deprecated because it needs review and test');
  var tiles;

  if (tileHint) {
    tiles = tileHint.concat(layer.level0Nodes);
  } else {
    tiles = layer.level0Nodes;
  }

  if (!options.modifyGeometry) {
    if (options.cache) {
      options.cache.length = 1;
    }

    var matrices = {
      worldFromLocal: obj.parent ? obj.parent.matrixWorld : undefined,
      localFromWorld: obj.parent ? new THREE.Matrix4().copy(obj.parent.matrixWorld).invert() : undefined
    };

    var result = _updateVector3(layer, options.method || _DEMUtils["default"].FAST_READ_Z, tiles, crs, obj.position, options.offset || 0, matrices, undefined, options.cache ? options.cache[0] : undefined);

    if (result) {
      if (options.cache) {
        options.cache[0] = result;
      }

      obj.updateMatrix();
      obj.updateMatrixWorld();
      return true;
    }
  } else {
    var _matrices = {
      worldFromLocal: obj.matrixWorld,
      localFromWorld: new THREE.Matrix4().copy(obj.matrixWorld).invert()
    };
    var geometry = obj.geometry;

    if (geometry.vertices) {
      if (options.cache) {
        options.cache.length = geometry.vertices.length;
      }

      var success = true;
      var coord = new _Coordinates["default"](crs);

      for (var i = 0; i < geometry.vertices.length; i++) {
        var cached = options.cache ? options.cache[i] : undefined;

        var _result = _updateVector3(layer, options.method || _DEMUtils["default"].FAST_READ_Z, tiles, crs, geometry.vertices[i], options.offset || 0, _matrices, coord, cached);

        if (options.cache) {
          options.cache[i] = _result;
        }

        if (!_result) {
          success = false;
        }
      }

      geometry.verticesNeedUpdate = true;
      return success;
    } else if (geometry.isBufferGeometry) {
      if (options.cache) {
        options.cache.length = geometry.attributes.position.count;
      }

      var _success = true;
      var tmp = new THREE.Vector3();

      var _coord = new _Coordinates["default"](crs);

      for (var _i = 0; _i < geometry.attributes.position.count; _i++) {
        var _cached = options.cache ? options.cache[_i] : undefined;

        tmp.fromBufferAttribute(geometry.attributes.position, _i);
        var prev = tmp.z;

        var _result2 = _updateVector3(layer, options.method || _DEMUtils["default"].FAST_READ_Z, tiles, crs, tmp, options.offset || 0, _matrices, _coord, _cached);

        if (options.cache) {
          options.cache[_i] = _result2;
        }

        if (!_result2) {
          _success = false;
        }

        if (prev != tmp.z) {
          geometry.attributes.position.needsUpdate = true;
        }

        geometry.attributes.position.setXYZ(_i, tmp.x, tmp.y, tmp.z);
      }

      return _success;
    }
  }
}

var _default = placeObjectOnGround;
exports["default"] = _default;