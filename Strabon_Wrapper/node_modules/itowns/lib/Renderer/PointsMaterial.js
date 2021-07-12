"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.ClassificationScheme = exports.MODE = void 0;

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var THREE = _interopRequireWildcard(require("three"));

var _Capabilities = _interopRequireDefault(require("../Core/System/Capabilities"));

var _ShaderUtils = _interopRequireDefault(require("./Shader/ShaderUtils"));

var _CommonMaterial = _interopRequireDefault(require("./CommonMaterial"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/* babel-plugin-inline-import './Shader/PointsVS.glsl' */
var PointsVS = "#include <itowns/WebGL2_pars_vertex>\n#include <itowns/precision_qualifier>\n#include <itowns/project_pars_vertex>\n#if defined(USE_TEXTURES_PROJECTIVE)\n#include <itowns/projective_texturing_pars_vertex>\n#endif\n#include <common>\n#include <logdepthbuf_pars_vertex>\n\nuniform float size;\n\nuniform bool picking;\nuniform int mode;\nuniform float opacity;\nuniform vec4 overlayColor;\nuniform vec2 intensityRange;\nuniform bool applyOpacityClassication;\nattribute vec3 color;\nattribute vec4 unique_id;\nattribute float intensity;\nattribute float classification;\nuniform sampler2D classificationLUT;\n\n#if defined(NORMAL_OCT16)\nattribute vec2 oct16Normal;\n#elif defined(NORMAL_SPHEREMAPPED)\nattribute vec2 sphereMappedNormal;\n#else\nattribute vec3 normal;\n#endif\n\nvarying vec4 vColor;\n\n// see https://web.archive.org/web/20150303053317/http://lgdv.cs.fau.de/get/1602\n// and implementation in PotreeConverter (BINPointReader.cpp) and potree (BinaryDecoderWorker.js)\n#if defined(NORMAL_OCT16)\nvec3 decodeOct16Normal(vec2 encodedNormal) {\n    vec2 nNorm = 2. * (encodedNormal / 255.) - 1.;\n    vec3 n;\n    n.z = 1. - abs(nNorm.x) - abs(nNorm.y);\n    if (n.z >= 0.) {\n        n.x = nNorm.x;\n        n.y = nNorm.y;\n    } else {\n        n.x = sign(nNorm.x) - sign(nNorm.x) * sign(nNorm.y) * nNorm.y;\n        n.y = sign(nNorm.y) - sign(nNorm.y) * sign(nNorm.x) * nNorm.x;\n    }\n    return normalize(n);\n}\n#elif defined(NORMAL_SPHEREMAPPED)\n// see http://aras-p.info/texts/CompactNormalStorage.html method #4\n// or see potree's implementation in BINPointReader.cpp\nvec3 decodeSphereMappedNormal(vec2 encodedNormal) {\n    vec2 fenc = 2. * encodedNormal / 255. - 1.;\n    float f = dot(fenc,fenc);\n    float g = 2. * sqrt(1. - f);\n    vec3 n;\n    n.xy = fenc * g;\n    n.z = 1. - 2. * f;\n    return n;\n}\n#endif\n\nvoid main() {\n\n#if defined(NORMAL_OCT16)\n    vec3  normal = decodeOct16Normal(oct16Normal);\n#elif defined(NORMAL_SPHEREMAPPED)\n    vec3 normal = decodeSphereMappedNormal(sphereMappedNormal);\n#elif defined(NORMAL)\n    // nothing to do\n#else\n    // default to color\n    vec3 normal = color;\n#endif\n\n    if (picking) {\n        vColor = unique_id;\n    } else {\n        vColor.a = opacity;\n        if (applyOpacityClassication || mode == MODE_CLASSIFICATION) {\n            vec2 uv = vec2(classification, 0.5);\n            vColor = texture2D(classificationLUT, uv);\n            vColor.a *= opacity;\n        }\n\n        if (mode == MODE_INTENSITY) {\n            // adapt the grayscale knowing the range\n            float i = (intensity - intensityRange.x) / (intensityRange.y - intensityRange.x);\n            vColor.rgb = vec3(i, i, i);\n        } else if (mode == MODE_NORMAL) {\n            vColor.rgb = abs(normal);\n        } else if (mode == MODE_COLOR) {\n            // default to color mode\n            vColor.rgb = mix(color, overlayColor.rgb, overlayColor.a);\n        }\n    }\n\n    #include <begin_vertex>\n    #include <project_vertex>\n\n    if (size > 0.) {\n        gl_PointSize = size;\n    } else {\n        gl_PointSize = clamp(-size / gl_Position.w, 3.0, 10.0);\n    }\n\n#if defined(USE_TEXTURES_PROJECTIVE)\n    #include <itowns/projective_texturing_vertex>\n#endif\n    #include <logdepthbuf_vertex>\n}\n";

/* babel-plugin-inline-import './Shader/PointsFS.glsl' */
var PointsFS = "#include <itowns/WebGL2_pars_fragment>\n#include <itowns/precision_qualifier>\n#include <logdepthbuf_pars_fragment>\n#if defined(USE_TEXTURES_PROJECTIVE)\n#include <itowns/projective_texturing_pars_fragment>\n#endif\n\nvarying vec4 vColor;\nuniform bool picking;\nvoid main() {\n    #include <logdepthbuf_fragment>\n    // circular point rendering\n    if((length(gl_PointCoord - 0.5) > 0.5) || (vColor.a == 0.0)) {\n        discard;\n    }\n#if defined(USE_TEXTURES_PROJECTIVE)\n    vec4 color = vColor;\n    if (!picking) {\n        #pragma unroll_loop\n        for (int i = 0; i < ORIENTED_IMAGES_COUNT; i++) {\n            color = projectiveTextureColor(projectiveTextureCoords[ ORIENTED_IMAGES_COUNT - 1 - i ], projectiveTextureDistortion[ ORIENTED_IMAGES_COUNT - 1 - i ], projectiveTexture[ ORIENTED_IMAGES_COUNT - 1 - i ], mask[ORIENTED_IMAGES_COUNT - 1 - i], color);\n        }\n        gl_FragColor = vec4(color.rgb, color.a * opacity);\n    } else {\n        gl_FragColor = color;\n    }\n#else\n    gl_FragColor = vColor;\n#endif\n}\n";
var MODE = {
  COLOR: 0,
  INTENSITY: 1,
  CLASSIFICATION: 2,
  NORMAL: 3
};
exports.MODE = MODE;
var white = new THREE.Color(1.0, 1.0, 1.0);
/**
 * Every lidar point can have a classification assigned to it that defines
 * the type of object that has reflected the laser pulse. Lidar points can be
 * classified into a number of categories including bare earth or ground,
 * top of canopy, and water. The different classes are defined using numeric
 * integer codes in the files.
 *
 * @property {object} category - category classification,
 * @property {boolean} category.visible - category visibility,
 * @property {string} category.name - category name,
 * @property {THREE.Color} category.color - category color,
 * @property {number} category.opacity - category opacity,
 */
// eslint-disable-next-line

var
/* istanbul ignore next */
Classification = function Classification() {
  (0, _classCallCheck2["default"])(this, Classification);
};

var ClassificationScheme = {
  DEFAULT: {
    0: {
      visible: true,
      name: 'never classified',
      color: new THREE.Color(0.5, 0.5, 0.5),
      opacity: 1.0
    },
    1: {
      visible: true,
      name: 'unclassified',
      color: new THREE.Color(0.5, 0.5, 0.5),
      opacity: 1.0
    },
    2: {
      visible: true,
      name: 'ground',
      color: new THREE.Color(0.63, 0.32, 0.18),
      opacity: 1.0
    },
    3: {
      visible: true,
      name: 'low vegetation',
      color: new THREE.Color(0.0, 1.0, 0.0),
      opacity: 1.0
    },
    4: {
      visible: true,
      name: 'medium vegetation',
      color: new THREE.Color(0.0, 0.8, 0.0),
      opacity: 1.0
    },
    5: {
      visible: true,
      name: 'high vegetation',
      color: new THREE.Color(0.0, 0.6, 0.0),
      opacity: 1.0
    },
    6: {
      visible: true,
      name: 'building',
      color: new THREE.Color(1.0, 0.66, 0.0),
      opacity: 1.0
    },
    7: {
      visible: true,
      name: 'low point(noise)',
      color: new THREE.Color(1.0, 0.0, 1.0),
      opacity: 1.0
    },
    8: {
      visible: true,
      name: 'key-point',
      color: new THREE.Color(1.0, 0.0, 0.0),
      opacity: 1.0
    },
    9: {
      visible: true,
      name: 'water',
      color: new THREE.Color(0.0, 0.0, 1.0),
      opacity: 1.0
    },
    10: {
      visible: true,
      name: 'rail',
      color: new THREE.Color(0.8, 0.8, 1.0),
      opacity: 1.0
    },
    11: {
      visible: true,
      name: 'road Surface',
      color: new THREE.Color(0.4, 0.4, 0.7),
      opacity: 1.0
    },
    12: {
      visible: true,
      name: 'overlap',
      color: new THREE.Color(1.0, 1.0, 0.0),
      opacity: 1.0
    },
    DEFAULT: {
      visible: true,
      name: 'default',
      color: new THREE.Color(0.3, 0.6, 0.6),
      opacity: 0.5
    }
  }
};
exports.ClassificationScheme = ClassificationScheme;

var PointsMaterial = /*#__PURE__*/function (_THREE$RawShaderMater) {
  (0, _inherits2["default"])(PointsMaterial, _THREE$RawShaderMater);

  var _super = _createSuper(PointsMaterial);

  /**
   * @class      PointsMaterial
   * @param      {object}  [options={}]  The options
   * @param      {number}  [options.size=0]  size point
   * @param      {number}  [options.mode=MODE.COLOR]  display mode.
   * @param      {THREE.Vector4}  [options.overlayColor=new THREE.Vector4(0, 0, 0, 0)]  overlay color.
   * @param      {THREE.Vector2}  [options.intensityRange=new THREE.Vector2(0, 1)]  intensity range.
   * @param      {boolean}  [options.applyOpacityClassication=false]  apply opacity classification on all display mode.
   * @param      {Classification}  [options.classification] -  define points classification.
   * @property {Classification}  classification - points classification.
   *
   * @example
   * // change color category classification
   * const pointMaterial = new PointsMaterial();
   * pointMaterial.classification[3].color.setStyle('red');
   * pointMaterial.recomputeClassification();
   */
  function PointsMaterial() {
    var _this;

    var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
    (0, _classCallCheck2["default"])(this, PointsMaterial);
    var intensityRange = options.intensityRange || new THREE.Vector2(0, 1);
    var oiMaterial = options.orientedImageMaterial;
    var classification = options.classification || ClassificationScheme.DEFAULT;
    var applyOpacityClassication = options.applyOpacityClassication == undefined ? false : options.applyOpacityClassication;
    delete options.orientedImageMaterial;
    delete options.intensityRange;
    delete options.classification;
    delete options.applyOpacityClassication;
    _this = _super.call(this, options);
    _this.vertexShader = PointsVS;
    _this.scale = options.scale || 0.05 * 0.5 / Math.tan(1.0 / 2.0); // autosizing scale

    _CommonMaterial["default"].setDefineMapping((0, _assertThisInitialized2["default"])(_this), 'MODE', MODE);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'size', options.size || 0);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'mode', options.mode || MODE.COLOR);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'picking', false);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'opacity', _this.opacity);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'overlayColor', options.overlayColor || new THREE.Vector4(0, 0, 0, 0));

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'intensityRange', intensityRange);

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'applyOpacityClassication', applyOpacityClassication); // add classification texture to apply classification lut.


    var data = new Uint8Array(256 * 4);
    var texture = new THREE.DataTexture(data, 256, 1, THREE.RGBAFormat);
    texture.magFilter = THREE.NearestFilter;

    _CommonMaterial["default"].setUniformProperty((0, _assertThisInitialized2["default"])(_this), 'classificationLUT', texture); // Classification scheme


    _this.classification = classification; // Update classification

    _this.recomputeClassification();

    if (oiMaterial) {
      _this.uniforms.projectiveTextureAlphaBorder = oiMaterial.uniforms.projectiveTextureAlphaBorder;
      _this.uniforms.projectiveTextureDistortion = oiMaterial.uniforms.projectiveTextureDistortion;
      _this.uniforms.projectiveTextureMatrix = oiMaterial.uniforms.projectiveTextureMatrix;
      _this.uniforms.projectiveTexture = oiMaterial.uniforms.projectiveTexture;
      _this.uniforms.mask = oiMaterial.uniforms.mask;
      _this.uniforms.boostLight = oiMaterial.uniforms.boostLight;
      _this.defines.ORIENTED_IMAGES_COUNT = oiMaterial.defines.ORIENTED_IMAGES_COUNT;
      _this.defines.USE_DISTORTION = oiMaterial.defines.USE_DISTORTION;
      _this.defines.DEBUG_ALPHA_BORDER = oiMaterial.defines.DEBUG_ALPHA_BORDER;
      _this.defines.USE_TEXTURES_PROJECTIVE = true;
      _this.defines.USE_BASE_MATERIAL = true;
      _this.fragmentShader = _ShaderUtils["default"].unrollLoops(PointsFS, _this.defines);
    } else {
      _this.fragmentShader = PointsFS;
    }

    if (_Capabilities["default"].isLogDepthBufferSupported()) {
      _this.defines.USE_LOGDEPTHBUF = 1;
      _this.defines.USE_LOGDEPTHBUF_EXT = 1;
    }

    return _this;
  }

  (0, _createClass2["default"])(PointsMaterial, [{
    key: "recomputeClassification",
    value: function recomputeClassification() {
      var classification = this.classification;
      var data = this.classificationLUT.image.data;
      var width = this.classificationLUT.image.width;

      for (var i = 0; i < width; i++) {
        var color = void 0;
        var opacity = void 0;
        var visible = true;

        if (classification[i]) {
          color = classification[i].color;
          visible = classification[i].visible;
          opacity = classification[i].opacity;
        } else if (classification[i % 32]) {
          color = classification[i % 32].color;
          visible = classification[i % 32].visible;
          opacity = classification[i % 32].opacity;
        } else if (classification.DEFAULT) {
          color = classification.DEFAULT.color;
          visible = classification.DEFAULT.visible;
          opacity = classification.DEFAULT.opacity;
        } else {
          color = white;
          opacity = 1.0;
        }

        var j = 4 * i;
        data[j + 0] = parseInt(255 * color.r, 10);
        data[j + 1] = parseInt(255 * color.g, 10);
        data[j + 2] = parseInt(255 * color.b, 10);
        data[j + 3] = visible ? parseInt(255 * opacity, 10) : 0;
      }

      this.classificationLUT.needsUpdate = true;
      this.dispatchEvent({
        type: 'material_property_changed',
        target: this
      });
    }
  }, {
    key: "onBeforeCompile",
    value: function onBeforeCompile(shader, renderer) {
      if (renderer.capabilities.isWebGL2) {
        this.defines.WEBGL2 = true;
        shader.glslVersion = '300 es';
      }
    }
  }, {
    key: "copy",
    value: function copy(source) {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(PointsMaterial.prototype), "copy", this).call(this, source);

      if (source.uniforms.projectiveTextureAlphaBorder) {
        // Don't copy oriented image because, it's a link to oriented image material.
        // It needs a reference to oriented image material.
        this.uniforms.projectiveTextureAlphaBorder = source.uniforms.projectiveTextureAlphaBorder;
        this.uniforms.projectiveTextureDistortion = source.uniforms.projectiveTextureDistortion;
        this.uniforms.projectiveTextureMatrix = source.uniforms.projectiveTextureMatrix;
        this.uniforms.projectiveTexture = source.uniforms.projectiveTexture;
        this.uniforms.mask = source.uniforms.mask;
        this.uniforms.boostLight = source.uniforms.boostLight;
      }

      return this;
    }
  }, {
    key: "enablePicking",
    value: function enablePicking(picking) {
      this.picking = picking;
      this.blending = picking ? THREE.NoBlending : THREE.NormalBlending;
    }
  }, {
    key: "update",
    value: function update(source) {
      this.visible = source.visible;
      this.opacity = source.opacity;
      this.transparent = source.transparent;
      this.size = source.size;
      this.mode = source.mode;
      this.picking = source.picking;
      this.scale = source.scale;
      this.overlayColor.copy(source.overlayColor);
      this.intensityRange.copy(source.intensityRange);
      Object.assign(this.defines, source.defines);
      return this;
    }
  }]);
  return PointsMaterial;
}(THREE.RawShaderMaterial);

var _default = PointsMaterial;
exports["default"] = _default;