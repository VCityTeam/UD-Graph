"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.readTextureValueWithBilinearFiltering = readTextureValueWithBilinearFiltering;
exports["default"] = void 0;

var _slicedToArray2 = _interopRequireDefault(require("@babel/runtime/helpers/slicedToArray"));

var THREE = _interopRequireWildcard(require("three"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _placeObjectOnGround = _interopRequireDefault(require("./placeObjectOnGround"));

var FAST_READ_Z = 0;
var PRECISE_READ_Z = 1;
/**
 * Utility module to retrieve elevation at a given coordinates. The returned
 * value is read in the elevation textures used by the graphics card to render
 * the tiles (globe or plane). This implies that the return value may change
 * depending on the current tile resolution.
 *
 * @module DEMUtils
 */

var _default = {
  /**
   * Gives the elevation value of a {@link TiledGeometryLayer}, at a specific
   * {@link Coordinates}.
   *
   * @param {TiledGeometryLayer} layer - The tile layer owning the elevation
   * textures we're going to query. This is typically a `GlobeLayer` or
   * `PlanarLayer` (accessible through `view.tileLayer`).
   * @param {Coordinates} coord - The coordinates that we're interested in.
   * @param {number} [method=FAST_READ_Z] - There are two available methods:
   * `FAST_READ_Z` (default) or `PRECISE_READ_Z`. The first one is faster,
   * while the second one is slower but gives better precision.
   * @param {TileMesh[]} [tileHint] - Optional array of tiles to speed up the
   * process. You can give candidates tiles likely to contain `coord`.
   * Otherwise the lookup process starts from the root of `layer`.
   *
   * @return {number} If found, a value in meters is returned; otherwise
   * `undefined`.
   */
  getElevationValueAt: function getElevationValueAt(layer, coord) {
    var method = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : FAST_READ_Z;
    var tileHint = arguments.length > 3 ? arguments[3] : undefined;

    var result = _readZ(layer, method, coord, tileHint || layer.level0Nodes);

    if (result) {
      return result.coord.z;
    }
  },

  /**
   * @typedef Terrain
   * @type {Object}
   *
   * @property {Coordinates} coord - Pick coordinate with the elevation in coord.z.
   * @property {THREE.Texture} texture - the picked elevation texture.
   * The texture where the `z` value has been read from
   * @property {TileMesh} tile - the picked tile and the tile containing the texture
   */

  /**
   * Gives a {@link Terrain} object, at a specific {@link Coordinates}. The returned
   * object is as follow:
   * - `coord`, Coordinate, coord.z is the value in meters of the elevation at the coordinates
   * - `texture`, the texture where the `z` value has been read from
   * - `tile`, the tile containing the texture
   * @example
   * // place mesh on the ground
   * const coord = new Coordinates('EPSG:4326', 6, 45);
   * const result = DEMUtils.getTerrainObjectAt(view.tileLayer, coord)
   * mesh.position.copy(result.coord.as(view.referenceCrs));
   * view.scene.add(mesh);
   * mesh.updateMatrixWorld();
   *
   *
   * @param {TiledGeometryLayer} layer - The tile layer owning the elevation
   * textures we're going to query. This is typically a `GlobeLayer` or
   * `PlanarLayer` (accessible through `view.tileLayer`).
   * @param {Coordinates} coord - The coordinates that we're interested in.
   * @param {number} [method=FAST_READ_Z] - There are two available methods:
   * `FAST_READ_Z` (default) or `PRECISE_READ_Z`. The first one is faster,
   * while the second one is slower but gives better precision.
   * @param {TileMesh[]} [tileHint] - Optional array of tiles to speed up the
   * process. You can give candidates tiles likely to contain `coord`.
   * Otherwise the lookup process starts from the root of `layer`.
   * @param {Object} [cache] - Object to cache previous result and speed up the next `getTerrainObjectAt`` use.
   *
   * @return {Terrain} - The {@link Terrain} object.
   */
  getTerrainObjectAt: function getTerrainObjectAt(layer, coord) {
    var method = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : FAST_READ_Z;
    var tileHint = arguments.length > 3 ? arguments[3] : undefined;
    var cache = arguments.length > 4 ? arguments[4] : undefined;
    return _readZ(layer, method, coord, tileHint || layer.level0Nodes, cache);
  },
  FAST_READ_Z: FAST_READ_Z,
  PRECISE_READ_Z: PRECISE_READ_Z,
  placeObjectOnGround: _placeObjectOnGround["default"]
};
exports["default"] = _default;

function tileAt(pt, tile) {
  if (tile.extent) {
    if (!tile.extent.isPointInside(pt)) {
      return undefined;
    }

    for (var i = 0; i < tile.children.length; i++) {
      var t = tileAt(pt, tile.children[i]);

      if (t) {
        return t;
      }
    }

    var tileLayer = tile.material.getElevationLayer();

    if (tileLayer && tileLayer.level >= 0) {
      return tile;
    }

    return undefined;
  }
}

var _canvas;

function _readTextureValueAt(metadata, texture) {
  for (var _len = arguments.length, uv = new Array(_len > 2 ? _len - 2 : 0), _key = 2; _key < _len; _key++) {
    uv[_key - 2] = arguments[_key];
  }

  for (var i = 0; i < uv.length; i += 2) {
    uv[i] = THREE.MathUtils.clamp(uv[i], 0, texture.image.width - 1);
    uv[i + 1] = THREE.MathUtils.clamp(uv[i + 1], 0, texture.image.height - 1);
  }

  if (texture.image.data) {
    // read a single value
    if (uv.length === 2) {
      var v = texture.image.data[uv[1] * texture.image.width + uv[0]];
      return v != metadata.noDataValue ? v : undefined;
    } // or read multiple values


    var result = [];

    for (var _i = 0; _i < uv.length; _i += 2) {
      var _v = texture.image.data[uv[_i + 1] * texture.image.width + uv[_i]];
      result.push(_v != metadata.noDataValue ? _v : undefined);
    }

    return result;
  } else {
    if (!_canvas) {
      _canvas = document.createElement('canvas');
      _canvas.width = 2;
      _canvas.height = 2;
    }

    var minx = Infinity;
    var miny = Infinity;
    var maxx = -Infinity;
    var maxy = -Infinity;

    for (var _i2 = 0; _i2 < uv.length; _i2 += 2) {
      minx = Math.min(uv[_i2], minx);
      miny = Math.min(uv[_i2 + 1], miny);
      maxx = Math.max(uv[_i2], maxx);
      maxy = Math.max(uv[_i2 + 1], maxy);
    }

    var dw = maxx - minx + 1;
    var dh = maxy - miny + 1;
    _canvas.width = Math.max(_canvas.width, dw);
    _canvas.height = Math.max(_canvas.height, dh);

    var ctx = _canvas.getContext('2d');

    ctx.drawImage(texture.image, minx, miny, dw, dh, 0, 0, dw, dh);
    var d = ctx.getImageData(0, 0, dw, dh);
    var _result = [];

    for (var _i3 = 0; _i3 < uv.length; _i3 += 2) {
      var ox = uv[_i3] - minx;
      var oy = uv[_i3 + 1] - miny; // d is 4 bytes per pixel

      var _v2 = THREE.MathUtils.lerp(metadata.colorTextureElevationMinZ, metadata.colorTextureElevationMaxZ, d.data[4 * oy * dw + 4 * ox] / 255);

      _result.push(_v2 != metadata.noDataValue ? _v2 : undefined);
    }

    if (uv.length === 2) {
      return _result[0];
    } else {
      return _result;
    }
  }
}

function _convertUVtoTextureCoords(texture, u, v) {
  var width = texture.image.width;
  var height = texture.image.height;
  var up = Math.max(0, u * width - 0.5);
  var vp = Math.max(0, v * height - 0.5);
  var u1 = Math.floor(up);
  var u2 = Math.ceil(up);
  var v1 = Math.floor(vp);
  var v2 = Math.ceil(vp);
  return {
    u1: u1,
    u2: u2,
    v1: v1,
    v2: v2,
    wu: up - u1,
    wv: vp - v1
  };
}

function _readTextureValueNearestFiltering(metadata, texture, vertexU, vertexV) {
  var coords = _convertUVtoTextureCoords(texture, vertexU, vertexV);

  var u = coords.wu <= 0 ? coords.u1 : coords.u2;
  var v = coords.wv <= 0 ? coords.v1 : coords.v2;
  return _readTextureValueAt(metadata, texture, u, v);
}

function _lerpWithUndefinedCheck(x, y, t) {
  if (x == undefined) {
    return y;
  } else if (y == undefined) {
    return x;
  } else {
    return THREE.MathUtils.lerp(x, y, t);
  }
}

function readTextureValueWithBilinearFiltering(metadata, texture, vertexU, vertexV) {
  var coords = _convertUVtoTextureCoords(texture, vertexU, vertexV);

  var _readTextureValueAt2 = _readTextureValueAt(metadata, texture, coords.u1, coords.v1, coords.u2, coords.v1, coords.u1, coords.v2, coords.u2, coords.v2),
      _readTextureValueAt3 = (0, _slicedToArray2["default"])(_readTextureValueAt2, 4),
      z11 = _readTextureValueAt3[0],
      z21 = _readTextureValueAt3[1],
      z12 = _readTextureValueAt3[2],
      z22 = _readTextureValueAt3[3]; // horizontal filtering


  var zu1 = _lerpWithUndefinedCheck(z11, z21, coords.wu);

  var zu2 = _lerpWithUndefinedCheck(z12, z22, coords.wu); // then vertical filtering


  return _lerpWithUndefinedCheck(zu1, zu2, coords.wv);
}

function _readZFast(layer, texture, uv) {
  var elevationLayer = layer.attachedLayers.filter(function (l) {
    return l.isElevationLayer;
  })[0];
  return _readTextureValueNearestFiltering(elevationLayer, texture, uv.x, uv.y);
}

var bary = new THREE.Vector3();

function _readZCorrect(layer, texture, uv, tileDimensions, tileOwnerDimensions) {
  // We need to emulate the vertex shader code that does 2 thing:
  //   - interpolate (u, v) between triangle vertices: u,v will be multiple of 1/nsegments
  //     (for now assume nsegments == 16)
  //   - read elevation texture at (u, v) for
  // Determine u,v based on the vertices count.
  // 'modulo' is the gap (in [0, 1]) between 2 successive vertices in the geometry
  // e.g if you have 5 vertices, the only possible values for u (or v) are: 0, 0.25, 0.5, 0.75, 1
  // so modulo would be 0.25
  // note: currently the number of segments is hard-coded to 16 (see TileProvider) => 17 vertices
  var modulo = tileDimensions.x / tileOwnerDimensions.x / (17 - 1);
  var u = Math.floor(uv.x / modulo) * modulo;
  var v = Math.floor(uv.y / modulo) * modulo;

  if (u == 1) {
    u -= modulo;
  }

  if (v == 1) {
    v -= modulo;
  } // Build 4 vertices, 3 of them will be our triangle:
  //    11---21
  //    |   / |
  //    |  /  |
  //    | /   |
  //    21---22


  var u1 = u;
  var u2 = u + modulo;
  var v1 = v;
  var v2 = v + modulo; // Our multiple z-value will be weigh-blended, depending on the distance of the real point
  // so lu (resp. lv) are the weight. When lu -> 0 (resp. 1) the final value -> z at u1 (resp. u2)

  var lu = (uv.x - u) / modulo;
  var lv = (uv.y - v) / modulo; // Determine if we're going to read the vertices from the top-left or lower-right triangle
  // (low-right = on the line 21-22 or under the diagonal lu = 1 - lv)

  var tri = new THREE.Triangle(new THREE.Vector3(u1, v2), new THREE.Vector3(u2, v1), lv == 1 || lu / (1 - lv) >= 1 ? new THREE.Vector3(u2, v2) : new THREE.Vector3(u1, v1)); // bary holds the respective weight of each vertices of the triangles

  tri.getBarycoord(new THREE.Vector3(uv.x, uv.y), bary);
  var elevationLayer = layer.attachedLayers.filter(function (l) {
    return l.isElevationLayer;
  })[0]; // read the 3 interesting values

  var z1 = readTextureValueWithBilinearFiltering(elevationLayer, texture, tri.a.x, tri.a.y);
  var z2 = readTextureValueWithBilinearFiltering(elevationLayer, texture, tri.b.x, tri.b.y);
  var z3 = readTextureValueWithBilinearFiltering(elevationLayer, texture, tri.c.x, tri.c.y); // Blend with bary

  return z1 * bary.x + z2 * bary.y + z3 * bary.z;
}

var temp = {
  v: new THREE.Vector3(),
  coord1: new _Coordinates["default"]('EPSG:4978'),
  coord2: new _Coordinates["default"]('EPSG:4978'),
  offset: new THREE.Vector2()
};
var dimension = new THREE.Vector2();

function offsetInExtent(point, extent) {
  var target = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : new THREE.Vector2();

  if (point.crs != extent.crs) {
    throw new Error("Unsupported mix: ".concat(point.crs, " and ").concat(extent.crs));
  }

  extent.dimensions(dimension);
  var originX = (point.x - extent.west) / dimension.x;
  var originY = (extent.north - point.y) / dimension.y;
  return target.set(originX, originY);
}

function _readZ(layer, method, coord, nodes, cache) {
  var pt = coord.as(layer.extent.crs, temp.coord1);
  var tileWithValidElevationTexture = null; // first check in cache

  if (cache && cache.tile && cache.tile.material) {
    tileWithValidElevationTexture = tileAt(pt, cache.tile);
  }

  for (var i = 0; !tileWithValidElevationTexture && i < nodes.length; i++) {
    tileWithValidElevationTexture = tileAt(pt, nodes[i]);
  }

  if (!tileWithValidElevationTexture) {
    // failed to find a tile, abort
    return;
  }

  var tile = tileWithValidElevationTexture;
  var tileLayer = tile.material.getElevationLayer();
  var src = tileLayer.textures[0]; // check cache value if existing

  if (cache) {
    if (cache.id === src.id && cache.version === src.version) {
      return {
        coord: pt,
        texture: src,
        tile: tile
      };
    }
  } // Assuming that tiles are split in 4 children, we lookup the parent that
  // really owns this texture


  var stepsUpInHierarchy = Math.round(Math.log2(1.0 / tileLayer.offsetScales[0].z));

  for (var _i4 = 0; _i4 < stepsUpInHierarchy; _i4++) {
    tileWithValidElevationTexture = tileWithValidElevationTexture.parent;
  } // offset = offset from top-left


  offsetInExtent(pt, tileWithValidElevationTexture.extent, temp.offset); // At this point we have:
  //   - tileWithValidElevationTexture.texture.image which is the current image
  //     used for rendering
  //   - offset which is the offset in this texture for the coordinate we're
  //     interested in
  // We now have 2 options:
  //   - the fast one: read the value of tileWithValidElevationTexture.texture.image
  //     at (offset.x, offset.y) and we're done
  //   - the correct one: emulate the vertex shader code

  if (method == PRECISE_READ_Z) {
    pt.z = _readZCorrect(layer, src, temp.offset, tile.extent.dimensions(), tileWithValidElevationTexture.extent.dimensions());
  } else {
    pt.z = _readZFast(layer, src, temp.offset);
  }

  if (pt.z != undefined) {
    return {
      coord: pt,
      texture: src,
      tile: tile
    };
  }
}