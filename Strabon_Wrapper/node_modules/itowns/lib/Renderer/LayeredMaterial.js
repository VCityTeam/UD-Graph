"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.unpack1K = unpack1K;
exports.getMaxColorSamplerUnitsCount = getMaxColorSamplerUnitsCount;
exports["default"] = exports.ELEVATION_MODES = exports.colorLayerEffects = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _ShaderUtils = _interopRequireDefault(require("./Shader/ShaderUtils"));

var _Capabilities = _interopRequireDefault(require("../Core/System/Capabilities"));

var _RenderMode = _interopRequireDefault(require("./RenderMode"));

var _CommonMaterial = _interopRequireDefault(require("./CommonMaterial"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

/* babel-plugin-inline-import './Shader/TileVS.glsl' */
var TileVS = "#include <itowns/WebGL2_pars_vertex>\n#include <itowns/precision_qualifier>\n#include <common>\n#include <itowns/project_pars_vertex>\n#include <itowns/elevation_pars_vertex>\n#include <logdepthbuf_pars_vertex>\nattribute vec2      uv_0;\n#if NUM_CRS > 1\nattribute float     uv_1;\n#endif\nattribute vec3      normal;\n\nuniform mat4 modelMatrix;\nuniform bool lightingEnabled;\nvarying vec2 vHighPrecisionZW;\n\n#if MODE == MODE_FINAL\n#include <fog_pars_vertex>\nvarying vec3        vUv;\nvarying vec3        vNormal;\n#endif\nvoid main() {\n        vec2 uv = vec2(uv_0.x, 1.0 - uv_0.y);\n\n        #include <begin_vertex>\n        #include <itowns/elevation_vertex>\n        #include <project_vertex>\n        #include <logdepthbuf_vertex>\n        vHighPrecisionZW = gl_Position.zw;\n#if MODE == MODE_FINAL\n        #include <fog_vertex>\n        #if NUM_CRS > 1\n        vUv = vec3(uv_0, (uv_1 > 0.) ? uv_1 : uv_0.y); // set uv_1 = uv_0 if uv_1 is undefined\n        #else\n        vUv = vec3(uv_0, 0.0);\n        #endif\n        vNormal = normalize ( mat3( modelMatrix[0].xyz, modelMatrix[1].xyz, modelMatrix[2].xyz ) * normal );\n#endif\n}\n";

/* babel-plugin-inline-import './Shader/TileFS.glsl' */
var TileFS = "#include <itowns/WebGL2_pars_fragment>\n#include <itowns/precision_qualifier>\n#include <logdepthbuf_pars_fragment>\n#include <itowns/pitUV>\n#include <itowns/color_layers_pars_fragment>\n#if MODE == MODE_FINAL\n#include <itowns/fog_pars_fragment>\n#include <itowns/overlay_pars_fragment>\n#include <itowns/lighting_pars_fragment>\n#endif\n#include <itowns/mode_pars_fragment>\n\nuniform vec3        diffuse;\nuniform float       opacity;\nvarying vec3        vUv; // uv_0.x/uv_1.x, uv_0.y, uv_1.y\nvarying vec2        vHighPrecisionZW;\n\nvoid main() {\n    #include <logdepthbuf_fragment>\n\n#if MODE == MODE_ID\n\n    #include <itowns/mode_id_fragment>\n\n#elif MODE == MODE_DEPTH\n\n    #include <itowns/mode_depth_fragment>\n\n#else\n\n    gl_FragColor = vec4(diffuse, opacity);\n\n    uvs[0] = vec3(vUv.xy, 0.);\n\n#if NUM_CRS > 1\n    uvs[1] = vec3(vUv.x, fract(vUv.z), floor(vUv.z));\n#endif\n\n    vec4 color;\n    #pragma unroll_loop\n    for ( int i = 0; i < NUM_FS_TEXTURES; i ++ ) {\n        color = getLayerColor( i , colorTextures[ i ], colorOffsetScales[ i ], colorLayers[ i ]);\n        gl_FragColor.rgb = mix(gl_FragColor.rgb, color.rgb, color.a);\n    }\n\n  #if defined(DEBUG)\n    if (showOutline) {\n        #pragma unroll_loop\n        for ( int i = 0; i < NUM_CRS; i ++) {\n            color = getOutlineColor( outlineColors[ i ], uvs[ i ].xy);\n            gl_FragColor.rgb = mix(gl_FragColor.rgb, color.rgb, color.a);\n        }\n    }\n  #endif\n\n    #include <itowns/fog_fragment>\n    #include <itowns/lighting_fragment>\n    #include <itowns/overlay_fragment>\n\n#endif\n}\n";
var identityOffsetScale = new THREE.Vector4(0.0, 0.0, 1.0, 1.0);
var defaultTex = new THREE.Texture(); // from three.js packDepthToRGBA

var UnpackDownscale = 255 / 256; // 0..1 -> fraction (excluding 1)

var bitSh = new THREE.Vector4(UnpackDownscale / (256.0 * 256.0 * 256.0), UnpackDownscale / (256.0 * 256.0), UnpackDownscale / 256.0, UnpackDownscale);

function unpack1K(color, factor) {
  return factor ? bitSh.dot(color) * factor : bitSh.dot(color);
} // Max sampler color count to LayeredMaterial
// Because there's a statement limitation to unroll, in getColorAtIdUv method


var maxSamplersColorCount = 15;
var samplersElevationCount = 1;

function getMaxColorSamplerUnitsCount() {
  var maxSamplerUnitsCount = _Capabilities["default"].getMaxTextureUnitsCount();

  return Math.min(maxSamplerUnitsCount - samplersElevationCount, maxSamplersColorCount);
}

var colorLayerEffects = {
  noEffect: 0,
  removeLightColor: 1,
  removeWhiteColor: 2,
  customEffect: 3
};
exports.colorLayerEffects = colorLayerEffects;
var defaultStructLayer = {
  bias: 0,
  zmin: 0,
  zmax: 0,
  scale: 0,
  mode: 0,
  textureOffset: 0,
  opacity: 0,
  crs: 0,
  effect_parameter: 0,
  effect_type: colorLayerEffects.noEffect
};

function _updateLayersUniforms(uniforms, olayers, max) {
  // prepare convenient access to elevation or color uniforms
  var layers = uniforms.layers.value;
  var textures = uniforms.textures.value;
  var offsetScales = uniforms.offsetScales.value;
  var textureCount = uniforms.textureCount; // flatten the 2d array [i,j] -> layers[_layerIds[i]].textures[j]

  var count = 0;

  var _iterator = _createForOfIteratorHelper(olayers),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var layer = _step.value;
      // textureOffset property is added to RasterTile
      layer.textureOffset = count;

      for (var _i = 0, il = layer.textures.length; _i < il; ++_i, ++count) {
        if (count < max) {
          offsetScales[count] = layer.offsetScales[_i];
          textures[count] = layer.textures[_i];
          layers[count] = layer;
        }
      }
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }

  if (count > max) {
    console.warn("LayeredMaterial: Not enough texture units (".concat(max, " < ").concat(count, "), excess textures have been discarded."));
  }

  textureCount.value = count; // WebGL 2.0 doesn't support the undefined uniforms.
  // So the undefined uniforms are defined by default value.

  for (var i = count; i < textures.length; i++) {
    textures[i] = defaultTex;
    offsetScales[i] = identityOffsetScale;
    layers[i] = defaultStructLayer;
  }
}

var ELEVATION_MODES = {
  RGBA: 0,
  COLOR: 1,
  DATA: 2
};
exports.ELEVATION_MODES = ELEVATION_MODES;
var nbSamplers;
var fragmentShader = [];

var LayeredMaterial = /*#__PURE__*/function (_THREE$RawShaderMater) {
  (0, _inherits2["default"])(LayeredMaterial, _THREE$RawShaderMater);

  var _super = _createSuper(LayeredMaterial);

  function LayeredMaterial() {
    var _this;

    var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
    var crsCount = arguments.length > 1 ? arguments[1] : undefined;
    (0, _classCallCheck2["default"])(this, LayeredMaterial);
    _this = _super.call(this, options);
    nbSamplers = nbSamplers || [samplersElevationCount, getMaxColorSamplerUnitsCount()];
    _this.defines.NUM_VS_TEXTURES = nbSamplers[0];
    _this.defines.NUM_FS_TEXTURES = nbSamplers[1];
    _this.defines.USE_FOG = 1;
    _this.defines.NUM_CRS = crsCount;

    _CommonMaterial["default"].setDefineMapping((0, _assertThisInitialized2["default"])(_this), 'ELEVATION', ELEVATION_MODES);

    _CommonMaterial["default"].setDefineMapping((0, _assertThisInitialized2["default"])(_this), 'MODE', _RenderMode["default"].MODES);

    _CommonMaterial["default"].setDefineProperty((0, _assertThisInitialized2["default"])(_this), 'mode', 'MODE', _RenderMode["default"].MODES.FINAL);

    if (_Capabilities["default"].isLogDepthBufferSupported()) {
      _this.defines.USE_LOGDEPTHBUF = 1;
      _this.defines.USE_LOGDEPTHBUF_EXT = 1;
    }

    _this.vertexShader = TileVS;
    fragmentShader[crsCount] = fragmentShader[crsCount] || _ShaderUtils["default"].unrollLoops(TileFS, _this.defines);
    _this.fragmentShader = fragmentShader[crsCount]; // Color uniforms

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'diffuse', new THREE.Color(0.04, 0.23, 0.35));

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'opacity', _this.opacity); // Lighting uniforms


    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'lightingEnabled', false);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'lightPosition', new THREE.Vector3(-0.5, 0.0, 1.0)); // Misc properties


    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'fogDistance', 1000000000.0);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'fogColor', new THREE.Color(0.76, 0.85, 1.0));

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'overlayAlpha', 0);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'overlayColor', new THREE.Color(1.0, 0.3, 0.0));

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'objectId', 0); // > 0 produces gaps,
    // < 0 causes oversampling of textures
    // = 0 causes sampling artefacts due to bad estimation of texture-uv gradients
    // best is a small negative number


    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'minBorderDistance', -0.01); // LayeredMaterialLayers


    _this.layers = [];
    _this.elevationLayerIds = [];
    _this.colorLayerIds = []; // elevation layer uniforms, to be updated using updateUniforms()

    _this.uniforms.elevationLayers = new THREE.Uniform(new Array(nbSamplers[0]).fill(defaultStructLayer));
    _this.uniforms.elevationTextures = new THREE.Uniform(new Array(nbSamplers[0]).fill(defaultTex));
    _this.uniforms.elevationOffsetScales = new THREE.Uniform(new Array(nbSamplers[0]).fill(identityOffsetScale));
    _this.uniforms.elevationTextureCount = new THREE.Uniform(0); // color layer uniforms, to be updated using updateUniforms()

    _this.uniforms.colorLayers = new THREE.Uniform(new Array(nbSamplers[1]).fill(defaultStructLayer));
    _this.uniforms.colorTextures = new THREE.Uniform(new Array(nbSamplers[1]).fill(defaultTex));
    _this.uniforms.colorOffsetScales = new THREE.Uniform(new Array(nbSamplers[1]).fill(identityOffsetScale));
    _this.uniforms.colorTextureCount = new THREE.Uniform(0);
    var _visible = _this.visible; // can't do an ES6 setter/getter here

    Object.defineProperty((0, _assertThisInitialized2["default"])(_this), 'visible', {
      get: function get() {
        return _visible;
      },
      set: function set(v) {
        if (_visible != v) {
          _visible = v;
          this.dispatchEvent({
            type: v ? 'shown' : 'hidden'
          });
        }
      }
    });
    return _this;
  }

  (0, _createClass2["default"])(LayeredMaterial, [{
    key: "onBeforeCompile",
    value: function onBeforeCompile(shader, renderer) {
      if (renderer.capabilities.isWebGL2) {
        this.defines.WEBGL2 = true;
        shader.glslVersion = '300 es';
      }
    }
  }, {
    key: "getUniformByType",
    value: function getUniformByType(type) {
      return {
        layers: this.uniforms["".concat(type, "Layers")],
        textures: this.uniforms["".concat(type, "Textures")],
        offsetScales: this.uniforms["".concat(type, "OffsetScales")],
        textureCount: this.uniforms["".concat(type, "TextureCount")]
      };
    }
  }, {
    key: "updateLayersUniforms",
    value: function updateLayersUniforms() {
      var _this2 = this;

      var colorlayers = this.layers.filter(function (l) {
        return _this2.colorLayerIds.includes(l.id) && l.visible && l.opacity > 0;
      });
      colorlayers.sort(function (a, b) {
        return _this2.colorLayerIds.indexOf(a.id) - _this2.colorLayerIds.indexOf(b.id);
      });

      _updateLayersUniforms(this.getUniformByType('color'), colorlayers, this.defines.NUM_FS_TEXTURES);

      if (this.elevationLayerIds.some(function (id) {
        return _this2.getLayer(id);
      }) || this.uniforms.elevationTextureCount.value && !this.elevationLayerIds.length) {
        var elevationLayer = this.getElevationLayer() ? [this.getElevationLayer()] : [];

        _updateLayersUniforms(this.getUniformByType('elevation'), elevationLayer, this.defines.NUM_VS_TEXTURES);
      }

      this.layersNeedUpdate = false;
    }
  }, {
    key: "dispose",
    value: function dispose() {
      this.dispatchEvent({
        type: 'dispose'
      });
      this.layers.forEach(function (l) {
        return l.dispose(true);
      });
      this.layers.length = 0;
      this.layersNeedUpdate = true;
    } // TODO: rename to setColorLayerIds and add setElevationLayerIds ?

  }, {
    key: "setSequence",
    value: function setSequence(sequenceLayer) {
      this.colorLayerIds = sequenceLayer;
      this.layersNeedUpdate = true;
    }
  }, {
    key: "setSequenceElevation",
    value: function setSequenceElevation(layerId) {
      this.elevationLayerIds[0] = layerId;
      this.layersNeedUpdate = true;
    }
  }, {
    key: "removeLayer",
    value: function removeLayer(layerId) {
      var index = this.layers.findIndex(function (l) {
        return l.id === layerId;
      });

      if (index > -1) {
        this.layers[index].dispose();
        this.layers.splice(index, 1);
        var idSeq = this.colorLayerIds.indexOf(layerId);

        if (idSeq > -1) {
          this.colorLayerIds.splice(idSeq, 1);
        } else {
          this.elevationLayerIds = [];
        }
      }
    }
  }, {
    key: "addLayer",
    value: function addLayer(rasterNode) {
      if (rasterNode.layer.id in this.layers) {
        console.warn('The "{layer.id}" layer was already present in the material, overwritting.');
      }

      this.layers.push(rasterNode);
    }
  }, {
    key: "getLayer",
    value: function getLayer(id) {
      return this.layers.find(function (l) {
        return l.id === id;
      });
    }
  }, {
    key: "getLayers",
    value: function getLayers(ids) {
      return this.layers.filter(function (l) {
        return ids.includes(l.id);
      });
    }
  }, {
    key: "getElevationLayer",
    value: function getElevationLayer() {
      var _this3 = this;

      return this.layers.find(function (l) {
        return l.id === _this3.elevationLayerIds[0];
      });
    }
  }, {
    key: "setElevationScale",
    value: function setElevationScale(scale) {
      if (this.elevationLayerIds.length) {
        this.getElevationLayer().scale = scale;
      }
    }
  }]);
  return LayeredMaterial;
}(THREE.RawShaderMaterial);

var _default = LayeredMaterial;
exports["default"] = _default;