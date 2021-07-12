"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.RasterElevationTile = exports.RasterColorTile = exports["default"] = exports.EMPTY_TEXTURE_ZOOM = void 0;

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _LayeredMaterial = require("./LayeredMaterial");

var _XbilParser = require("../Parser/XbilParser");

var _Crs = _interopRequireDefault(require("../Core/Geographic/Crs"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var EMPTY_TEXTURE_ZOOM = -1;
exports.EMPTY_TEXTURE_ZOOM = EMPTY_TEXTURE_ZOOM;
var pitch = new THREE.Vector4();
/**
 * A `RasterTile` is part of raster [`Layer`]{@link Layer} data.
 * This part is a spatial subdivision of the extent of a layer.
 * In the `RasterTile`, The data are converted on three.js textures.
 * This `RasterTile` textures are assigned to a `LayeredMaterial`.
 * This material is applied on terrain (TileMesh).
 * The color textures are mapped to color the terrain.
 * The elevation textures are used to displace vertex terrain.
 *
 * @class RasterTile
 */

var RasterTile = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(RasterTile, _THREE$EventDispatche);

  var _super = _createSuper(RasterTile);

  function RasterTile(material, layer) {
    var _this;

    (0, _classCallCheck2["default"])(this, RasterTile);
    _this = _super.call(this);
    _this.layer = layer;
    _this.crs = layer.parent.tileMatrixSets.indexOf(_Crs["default"].formatToTms(layer.crs));

    if (_this.crs == -1) {
      console.error('Unknown crs:', layer.crs);
    }

    _this.textures = [];
    _this.offsetScales = [];
    _this.level = EMPTY_TEXTURE_ZOOM;
    _this.material = material;

    _this._handlerCBEvent = function () {
      _this.material.layersNeedUpdate = true;
    };

    layer.addEventListener('visible-property-changed', _this._handlerCBEvent);
    return _this;
  }

  (0, _createClass2["default"])(RasterTile, [{
    key: "id",
    get: function get() {
      return this.layer.id;
    }
  }, {
    key: "opacity",
    get: function get() {
      return this.layer.opacity;
    }
  }, {
    key: "visible",
    get: function get() {
      return this.layer.visible;
    }
  }, {
    key: "initFromParent",
    value: function initFromParent(parent, extents) {
      if (parent && parent.level > this.level) {
        var index = 0;

        var _iterator = _createForOfIteratorHelper(extents),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var c = _step.value;

            var _iterator2 = _createForOfIteratorHelper(parent.textures),
                _step2;

            try {
              for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
                var texture = _step2.value;

                if (c.isInside(texture.extent)) {
                  this.setTexture(index++, texture, c.offsetToParent(texture.extent));
                  break;
                }
              }
            } catch (err) {
              _iterator2.e(err);
            } finally {
              _iterator2.f();
            }
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }
    }
  }, {
    key: "dispose",
    value: function dispose(removeEvent) {
      if (removeEvent) {
        this.layer.removeEventListener('visible-property-changed', this._handlerCBEvent); // dispose all events

        this._listeners = {};
      } // TODO: WARNING  verify if textures to dispose aren't attached with ancestor


      var _iterator3 = _createForOfIteratorHelper(this.textures),
          _step3;

      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var texture = _step3.value;

          if (texture.isTexture) {
            texture.dispose();
          }
        }
      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }

      this.level = EMPTY_TEXTURE_ZOOM;
      this.textures = [];
      this.offsetScales = [];
      this.material.layersNeedUpdate = true;
    }
  }, {
    key: "setTexture",
    value: function setTexture(index, texture, offsetScale) {
      this.level = texture && index == 0 ? texture.extent.zoom : this.level;
      this.textures[index] = texture || null;
      this.offsetScales[index] = offsetScale;
      this.material.layersNeedUpdate = true;
    }
  }, {
    key: "setTextures",
    value: function setTextures(textures, pitchs) {
      this.dispose(false);

      for (var i = 0, il = textures.length; i < il; ++i) {
        this.setTexture(i, textures[i], pitchs[i]);
      }
    }
  }]);
  return RasterTile;
}(THREE.EventDispatcher);

var _default = RasterTile;
exports["default"] = _default;

var RasterColorTile = /*#__PURE__*/function (_RasterTile) {
  (0, _inherits2["default"])(RasterColorTile, _RasterTile);

  var _super2 = _createSuper(RasterColorTile);

  function RasterColorTile() {
    (0, _classCallCheck2["default"])(this, RasterColorTile);
    return _super2.apply(this, arguments);
  }

  (0, _createClass2["default"])(RasterColorTile, [{
    key: "effect_type",
    get: function get() {
      return this.layer.effect_type;
    }
  }, {
    key: "effect_parameter",
    get: function get() {
      return this.layer.effect_parameter;
    }
  }]);
  return RasterColorTile;
}(RasterTile);

exports.RasterColorTile = RasterColorTile;

var RasterElevationTile = /*#__PURE__*/function (_RasterTile2) {
  (0, _inherits2["default"])(RasterElevationTile, _RasterTile2);

  var _super3 = _createSuper(RasterElevationTile);

  function RasterElevationTile(material, layer) {
    var _this2;

    (0, _classCallCheck2["default"])(this, RasterElevationTile);
    _this2 = _super3.call(this, material, layer);
    var defaultEle = {
      bias: 0,
      scale: 1,
      mode: _LayeredMaterial.ELEVATION_MODES.DATA,
      zmin: 0,
      zmax: Infinity
    };
    var scaleFactor = 1.0; // Define elevation properties

    if (layer.useRgbaTextureElevation) {
      defaultEle.mode = _LayeredMaterial.ELEVATION_MODES.RGBA;
      defaultEle.zmax = 5000;
      throw new Error('Restore this feature');
    } else if (layer.useColorTextureElevation) {
      scaleFactor = layer.colorTextureElevationMaxZ - layer.colorTextureElevationMinZ;
      defaultEle.mode = _LayeredMaterial.ELEVATION_MODES.COLOR;
      defaultEle.bias = layer.colorTextureElevationMinZ;
      _this2.min = _this2.layer.colorTextureElevationMinZ;
      _this2.max = _this2.layer.colorTextureElevationMaxZ;
    } else {
      _this2.min = 0;
      _this2.max = 0;
    }

    _this2.bias = layer.bias || defaultEle.bias;
    _this2.scale = (layer.scale || defaultEle.scale) * scaleFactor;
    _this2.mode = layer.mode || defaultEle.mode;
    _this2.zmin = layer.zmin || defaultEle.zmin;
    _this2.zmax = layer.zmax || defaultEle.zmax;
    return _this2;
  }

  (0, _createClass2["default"])(RasterElevationTile, [{
    key: "initFromParent",
    value: function initFromParent(parent, extents) {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(RasterElevationTile.prototype), "initFromParent", this).call(this, parent, extents);
      this.updateMinMaxElevation();
    }
  }, {
    key: "setTextures",
    value: function setTextures(textures, offsetScales) {
      this.replaceNoDataValueFromTexture(textures[0]);
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(RasterElevationTile.prototype), "setTextures", this).call(this, textures, offsetScales);
      this.updateMinMaxElevation();
    }
  }, {
    key: "updateMinMaxElevation",
    value: function updateMinMaxElevation() {
      if (this.textures[0] && !this.layer.useColorTextureElevation) {
        var _computeMinMaxElevati = (0, _XbilParser.computeMinMaxElevation)(this.textures[0], this.offsetScales[0], this.layer.noDataValue),
            min = _computeMinMaxElevati.min,
            max = _computeMinMaxElevati.max;

        if (this.min != min || this.max != max) {
          this.min = min;
          this.max = max;
          this.dispatchEvent({
            type: 'updatedElevation',
            node: this
          });
        }
      }
    }
  }, {
    key: "replaceNoDataValueFromTexture",
    value: function replaceNoDataValueFromTexture(texture) {
      var nodatavalue = this.layer.noDataValue;

      if (nodatavalue == undefined) {
        return;
      } // replace no datat value with parent texture value.


      var parentTexture = this.textures[0];
      var parentDataElevation = parentTexture && parentTexture.image && parentTexture.image.data;
      var dataElevation = texture.image && texture.image.data;

      if (dataElevation && parentDataElevation && !(0, _XbilParser.checkNodeElevationTextureValidity)(dataElevation, nodatavalue)) {
        texture.extent.offsetToParent(parentTexture.extent, pitch);
        (0, _XbilParser.insertSignificantValuesFromParent)(dataElevation, parentDataElevation, nodatavalue, pitch);
      }
    }
  }]);
  return RasterElevationTile;
}(RasterTile);

exports.RasterElevationTile = RasterElevationTile;