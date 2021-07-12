"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _Crs = _interopRequireDefault(require("./Geographic/Crs"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * A TileMesh is a THREE.Mesh with a geometricError and an OBB
 * The objectId property of the material is the with the id of the TileMesh
 * @constructor
 * @param {TileGeometry} geometry - the tile geometry
 * @param {THREE.Material} material - a THREE.Material compatible with THREE.Mesh
 * @param {Layer} layer - the layer the tile is added to
 * @param {Extent} extent - the tile extent
 * @param {?number} level - the tile level (default = 0)
 */
var TileMesh = /*#__PURE__*/function (_THREE$Mesh) {
  (0, _inherits2["default"])(TileMesh, _THREE$Mesh);

  var _super = _createSuper(TileMesh);

  function TileMesh(geometry, material, layer, extent) {
    var _this;

    var level = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : 0;
    (0, _classCallCheck2["default"])(this, TileMesh);
    _this = _super.call(this, geometry, material);

    if (!extent) {
      throw new Error('extent is mandatory to build a TileMesh');
    }

    _this.layer = layer;
    _this.extent = extent;
    _this.extent.zoom = level;
    _this.level = level;
    _this.material.objectId = _this.id;
    _this.obb = _this.geometry.OBB.clone();
    _this.boundingSphere = new THREE.Sphere();

    _this.obb.box3D.getBoundingSphere(_this.boundingSphere);

    _this._tms = new Map();

    var _iterator = _createForOfIteratorHelper(layer.tileMatrixSets),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var tms = _step.value;

        _this._tms.set(tms, _this.extent.tiledCovering(tms));
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    _this.frustumCulled = false;
    _this.matrixAutoUpdate = false;
    _this.rotationAutoUpdate = false;
    _this.layerUpdateState = {};
    _this.isTileMesh = true;
    _this.domElements = {};
    return _this;
  }
  /**
   * If specified, update the min and max elevation of the OBB
   * and updates accordingly the bounding sphere and the geometric error
   *
   * @param {?number} min
   * @param {?number} max
   * @param {?number} scale
   */


  (0, _createClass2["default"])(TileMesh, [{
    key: "setBBoxZ",
    value: function setBBoxZ(min, max, scale) {
      if (min == null && max == null) {
        return;
      } // FIXME: Why the floors ? This is not conservative : the obb may be too short by almost 1m !


      if (Math.floor(min) !== Math.floor(this.obb.z.min) || Math.floor(max) !== Math.floor(this.obb.z.max)) {
        this.obb.updateZ(min, max, scale);

        if (this.horizonCullingPointElevationScaled) {
          this.horizonCullingPointElevationScaled.setLength(this.obb.z.delta + this.horizonCullingPoint.length());
        }

        this.obb.box3D.getBoundingSphere(this.boundingSphere);
      }
    }
  }, {
    key: "getExtentsByProjection",
    value: function getExtentsByProjection(crs) {
      return this._tms.get(_Crs["default"].formatToTms(crs));
    }
    /**
     * Search for a common ancestor between this tile and another one. It goes
     * through parents on each side until one is found.
     *
     * @param {TileMesh} tile
     *
     * @return {TileMesh} the resulting common ancestor
     */

  }, {
    key: "findCommonAncestor",
    value: function findCommonAncestor(tile) {
      if (!tile) {
        return undefined;
      }

      if (tile.level == this.level) {
        if (tile.id == this.id) {
          return tile;
        } else if (tile.level != 0) {
          return this.parent.findCommonAncestor(tile.parent);
        } else {
          return undefined;
        }
      } else if (tile.level < this.level) {
        return this.parent.findCommonAncestor(tile);
      } else {
        return this.findCommonAncestor(tile.parent);
      }
    }
  }, {
    key: "onBeforeRender",
    value: function onBeforeRender() {
      if (this.material.layersNeedUpdate) {
        this.material.updateLayersUniforms();
      }
    }
  }, {
    key: "findClosestDomElement",
    value: function findClosestDomElement(id) {
      if (this.parent.isTileMesh) {
        return this.parent.domElements[id] || this.parent.findClosestDomElement(id);
      }
    }
  }]);
  return TileMesh;
}(THREE.Mesh);

var _default = TileMesh;
exports["default"] = _default;