"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var THREE = _interopRequireWildcard(require("three"));

var _C3DTBoundingVolume = _interopRequireDefault(require("./C3DTBoundingVolume"));

var _C3DTilesTypes = _interopRequireDefault(require("./C3DTilesTypes"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var inverseTileTransform = new THREE.Matrix4();
/** @classdesc
 * A 3D Tiles
 *  [Tileset](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/specification/schema/tileset.schema.json).
 * @property {C3DTilesTypes} type - Used by 3D Tiles extensions
 * (e.g. {@link C3DTBatchTableHierarchyExtension}) to know in which context
 * (i.e. for which 3D Tiles class) the parsing of the extension should be done.
 *  @property {object} asset - Generic information about the tileset, see
 *  [asset specification]https://github.com/CesiumGS/3d-tiles/blob/master/specification/schema/asset.schema.json
 *  @property {object} properties - Properties associated with the tileset, see
 *  [tileset specification](https://github.com/CesiumGS/3d-tiles/blob/master/specification/schema/tileset.schema.json#L11)
 *  @property {number} geometricError - see [tileset
 *  specification](https://github.com/CesiumGS/3d-tiles/blob/master/specification/schema/tileset.schema.json#L18)
 *  @property {string[]} extensionsUsed - see [tileset
 *  specification](https://github.com/CesiumGS/3d-tiles/blob/master/specification/schema/tileset.schema.json#L27)
 *  @property {array} extensionsRequired - see [tileset specification](https://github.com/CesiumGS/3d-tiles/blob/master/specification/schema/tileset.schema.json#L36)
 *  @property {object[]} tiles - an array holding all the
 *  [tiles](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/specification/schema/tile.schema.json)
 *  (not their content which is stored in the attribute object3d of the
 *  layer). This list represents a flattened tileset.
 *  @property {object} extensions - Extensions of the tileset in the form:
 * {extensioName1: extensionObject1, extensioName2: extensionObject2, ...}
 */

var C3DTileset = /*#__PURE__*/function () {
  function C3DTileset(json, baseURL, registeredExtensions) {
    (0, _classCallCheck2["default"])(this, C3DTileset);
    this.type = _C3DTilesTypes["default"].tileset;
    this.asset = json.asset;
    this.properties = json.properties;
    this.geometricError = json.geometricError;
    this.extensionsUsed = json.extensionsUsed;
    this.extensionsRequired = json.extensionsRequired;
    this.tiles = [];
    this.parseTiles(json.root, baseURL, undefined, registeredExtensions);

    if (json.extensions) {
      this.extensions = registeredExtensions.parseExtensions(json.extensions, this.type);
    }
  }
  /**
   * Recursion on the 3DTiles tileset (which is a tree) to parse the tiles
   * (nodes of the tree).
   * @param {object} tile - current tile
   * @param {string} baseURL - url of the source tileset and tiles
   * @param {object} parent - parent tile (used for computing the transform
   * matrix from local to global coordinates)
   * @param {object} registeredExtensions - 3D Tiles extensions registered
   * in the C3DTilesLayer (see {@link C3DTExtensions}
   */


  (0, _createClass2["default"])(C3DTileset, [{
    key: "parseTiles",
    value: function parseTiles(tile, baseURL, parent, registeredExtensions) {
      // compute transform (will become Object3D.matrix when the object is
      // downloaded)
      tile.transform = tile.transform ? new THREE.Matrix4().fromArray(tile.transform) : undefined; // The only reason to store _worldFromLocalTransform is because of
      // extendTileset where we need the transform chain for one tile.

      tile._worldFromLocalTransform = tile.transform;

      if (parent && parent._worldFromLocalTransform) {
        if (tile.transform) {
          tile._worldFromLocalTransform = new THREE.Matrix4().multiplyMatrices(parent._worldFromLocalTransform, tile.transform);
        } else {
          tile._worldFromLocalTransform = parent._worldFromLocalTransform;
        }
      } // inverseTileTransform is only used for volume.region


      if (tile.viewerRequestVolume && tile.viewerRequestVolume.region || tile.boundingVolume && tile.boundingVolume.region) {
        if (tile._worldFromLocalTransform) {
          inverseTileTransform.copy(tile._worldFromLocalTransform).invert();
        } else {
          inverseTileTransform.identity();
        }
      }

      tile.viewerRequestVolume = tile.viewerRequestVolume ? new _C3DTBoundingVolume["default"](tile.viewerRequestVolume, inverseTileTransform, registeredExtensions) : undefined;
      tile.boundingVolume = tile.boundingVolume ? new _C3DTBoundingVolume["default"](tile.boundingVolume, inverseTileTransform, registeredExtensions) : undefined;
      this.tiles.push(tile);
      tile.tileId = this.tiles.length - 1;
      tile.baseURL = baseURL;

      if (tile.children) {
        var _iterator = _createForOfIteratorHelper(tile.children),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var child = _step.value;
            this.parseTiles(child, baseURL, tile, registeredExtensions);
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }
    }
  }, {
    key: "extendTileset",
    value: function extendTileset(tileset, nodeId, baseURL, registeredExtensions) {
      this.parseTiles(tileset.root, baseURL, this.tiles[nodeId], registeredExtensions);
      this.tiles[nodeId].children = [tileset.root];
      this.tiles[nodeId].isTileset = true;
    }
  }]);
  return C3DTileset;
}();

var _default = C3DTileset;
exports["default"] = _default;