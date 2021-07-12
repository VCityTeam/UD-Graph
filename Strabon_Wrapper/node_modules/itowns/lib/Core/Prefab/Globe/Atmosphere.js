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

var _GeometryLayer2 = _interopRequireDefault(require("../../../Layer/GeometryLayer"));

var _Coordinates = _interopRequireDefault(require("../../Geographic/Coordinates"));

var _Ellipsoid = require("../../Math/Ellipsoid");

var _CoordStars = _interopRequireDefault(require("../../Geographic/CoordStars"));

var _SkyShader = _interopRequireDefault(require("./SkyShader"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/* babel-plugin-inline-import './Shaders/skyFS.glsl' */
var skyFS = "uniform vec3 v3LightPos;\nuniform float g;\nuniform float g2;\n\nvarying vec3 v3Direction;\nvarying vec3 c0;\nvarying vec3 c1;\n\n// Calculates the Mie phase function\nfloat getMiePhase(float fCos, float fCos2, float g, float g2) {\n    return 1.5 * ((1.0 - g2) / (2.0 + g2)) * (1.0 + fCos2) / pow(1.0 + g2 - 2.0 * g * fCos, 1.5);\n}\n\n// Calculates the Rayleigh phase function\nfloat getRayleighPhase(float fCos2) {\n    return 0.75 + 0.75 * fCos2;\n}\n\nvoid main (void) {\n    float fCos = dot(v3LightPos, v3Direction) / length(v3Direction);\n    float fCos2 = fCos * fCos;\n\n    vec3 color = getRayleighPhase(fCos2) * c0 + getMiePhase(fCos, fCos2, g, g2) * c1;\n\n    gl_FragColor = vec4(color, 1.0);\n    gl_FragColor.a = gl_FragColor.b;\n}";

/* babel-plugin-inline-import './Shaders/skyVS.glsl' */
var skyVS = "uniform vec3 v3LightPosition;   // The direction vector to the light source\nuniform vec3 v3InvWavelength;   // 1 / pow(wavelength, 4) for the red, green, and blue channels\nuniform float fCameraHeight;    // The camera's current height\nuniform float fCameraHeight2;   // fCameraHeight^2\nuniform float fOuterRadius;     // The outer (atmosphere) radius\nuniform float fOuterRadius2;    // fOuterRadius^2\nuniform float fInnerRadius;     // The inner (planetary) radius\nuniform float fInnerRadius2;    // fInnerRadius^2\nuniform float fKrESun;          // Kr * ESun\nuniform float fKmESun;          // Km * ESun\nuniform float fKr4PI;           // Kr * 4 * PI\nuniform float fKm4PI;           // Km * 4 * PI\nuniform float fScale;           // 1 / (fOuterRadius - fInnerRadius)\nuniform float fScaleDepth;      // The scale depth (i.e. the altitude at which the atmosphere's average density is found)\nuniform float fScaleOverScaleDepth; // fScale / fScaleDepth\n\nconst int nSamples = 3;\nconst float fSamples = 3.0;\n\nvarying vec3 v3Direction;\nvarying vec3 c0;\nvarying vec3 c1;\n\nfloat scale(float fCos) {\n    float x = 1.0 - fCos;\n    return fScaleDepth * exp(-0.00287 + x*(0.459 + x*(3.83 + x*(-6.80 + x*5.25))));\n}\n\nvoid main(void) {\n    float lengthCamera = length(cameraPosition);\n    float cameraHeight2 = lengthCamera * lengthCamera;\n\n    // Get the ray from the camera to the vertex and its length (which is the far point of the ray passing through the atmosphere)\n    vec3 v3Ray = position - cameraPosition;\n    float fFar = length(v3Ray);\n    v3Ray /= fFar;\n\n    // Calculate the closest intersection of the ray with the outer atmosphere (which is the near point of the ray passing through the atmosphere)\n    float B = 2.0 * dot(cameraPosition, v3Ray);\n    float C = cameraHeight2 - fOuterRadius2;\n    float fDet = max(0.0, B*B - 4.0 * C);\n    float fNear = 0.5 * (-B - sqrt(fDet));\n\n    // Calculate the ray's starting position, then calculate its scattering offset\n    vec3 v3Start = cameraPosition + v3Ray * fNear;\n    fFar -= fNear;\n    float fStartAngle = dot(v3Ray, v3Start) / fOuterRadius;\n    float fStartDepth = exp(-1.0 / fScaleDepth);\n    float fStartOffset = fStartDepth * scale(fStartAngle);\n\n    // Initialize the scattering loop variables\n    float fSampleLength = fFar / fSamples;\n    float fScaledLength = fSampleLength * fScale;\n    vec3 v3SampleRay = v3Ray * fSampleLength;\n    vec3 v3SamplePoint = v3Start + v3SampleRay * 0.5;\n\n    // Now loop through the sample rays\n    vec3 v3FrontColor = vec3(0.0, 0.0, 0.0);\n    for(int i=0; i<nSamples; i++)\n    {\n        float fHeight = length(v3SamplePoint);\n        float fDepth = exp(fScaleOverScaleDepth * (fInnerRadius - fHeight));\n        float fLightAngle = dot(v3LightPosition, v3SamplePoint) / fHeight;\n        float fCameraAngle = dot(v3Ray, v3SamplePoint) / fHeight;\n        float fScatter = (fStartOffset + fDepth * (scale(fLightAngle) - scale(fCameraAngle)));\n        vec3 v3Attenuate = exp(-fScatter * (v3InvWavelength * fKr4PI + fKm4PI));\n\n        v3FrontColor += v3Attenuate * (fDepth * fScaledLength);\n        v3SamplePoint += v3SampleRay;\n    }\n\n    // Finally, scale the Mie and Rayleigh colors and set up the varying variables for the pixel shader\n    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );\n    c0 = v3FrontColor * (v3InvWavelength * fKrESun);\n    c1 = v3FrontColor * fKmESun;\n    v3Direction = cameraPosition - position;\n}";

/* babel-plugin-inline-import './Shaders/groundFS.glsl' */
var groundFS = "varying vec3 c0;\nvarying vec3 c1;\n\nvoid main (void) {\n\tgl_FragColor = vec4(c1, 1.0 - c0/4.);\n}";

/* babel-plugin-inline-import './Shaders/groundVS.glsl' */
var groundVS = "uniform vec3 v3LightPosition;   // The direction vector to the light source\nuniform vec3 v3InvWavelength;   // 1 / pow(wavelength, 4) for the red, green, and blue channels\nuniform float fCameraHeight;    // The camera's current height\nuniform float fCameraHeight2;   // fCameraHeight^2\nuniform float fOuterRadius;     // The outer (atmosphere) radius\nuniform float fOuterRadius2;    // fOuterRadius^2\nuniform float fInnerRadius;     // The inner (planetary) radius\nuniform float fInnerRadius2;    // fInnerRadius^2\nuniform float fKrESun;          // Kr * ESun\nuniform float fKmESun;          // Km * ESun\nuniform float fKr4PI;           // Kr * 4 * PI\nuniform float fKm4PI;           // Km * 4 * PI\nuniform float fScale;           // 1 / (fOuterRadius - fInnerRadius)\nuniform float fScaleDepth;      // The scale depth (i.e. the altitude at which the atmosphere's average density is found)\nuniform float fScaleOverScaleDepth; // fScale / fScaleDepth\n\nvarying vec3 c0;\nvarying vec3 c1;\n\nconst int nSamples = 3;\nconst float fSamples = 3.0;\n\nfloat scale(float fCos)\n{\n    float x = 1.0 - fCos;\n    return fScaleDepth * exp(-0.00287 + x*(0.459 + x*(3.83 + x*(-6.80 + x*5.25))));\n}\n\nvoid main(void) {\n\n     float cameraHeight2 = length(cameraPosition) * length(cameraPosition);\n\n    // Get the ray from the camera to the vertex and its length (which is the far point of the ray passing through the atmosphere)\n    vec3 v3Ray = position - cameraPosition;\n    float fFar = length(v3Ray);\n    v3Ray /= fFar;\n\n    // Calculate the closest intersection of the ray with the outer atmosphere (which is the near point of the ray passing through the atmosphere)\n    float B = 2.0 * dot(cameraPosition, v3Ray);\n    float C = cameraHeight2 - fOuterRadius2;\n    float fDet = max(0.0, B*B - 4.0 * C);\n    float fNear = 0.5 * (-B - sqrt(fDet));\n\n    // Calculate the ray's starting position, then calculate its scattering offset\n    vec3 v3Start = cameraPosition + v3Ray * fNear;\n    fFar -= fNear;\n    float fDepth = exp((fInnerRadius - fOuterRadius) / fScaleDepth);\n    float fCameraAngle = dot(-v3Ray, position) / length(position);\n    float fLightAngle = dot(v3LightPosition, position) / length(position);\n    float fCameraScale = scale(fCameraAngle);\n    float fLightScale = scale(fLightAngle);\n    float fCameraOffset = fDepth*fCameraScale;\n    float fTemp = (fLightScale + fCameraScale);\n\n    // Initialize the scattering loop variables\n    float fSampleLength = fFar / fSamples;\n    float fScaledLength = fSampleLength * fScale;\n    vec3 v3SampleRay = v3Ray * fSampleLength;\n    vec3 v3SamplePoint = v3Start + v3SampleRay * 0.5;\n\n    // Now loop through the sample rays\n    vec3 v3FrontColor = vec3(0.0, 0.0, 0.0);\n    vec3 v3Attenuate = vec3(0.0, 0.0, 0.0);\n    for(int i=0; i<nSamples; i++)\n    {\n        float fHeight = length(v3SamplePoint);\n        float fDepth = exp(fScaleOverScaleDepth * (fInnerRadius - fHeight));\n        float fScatter = fDepth*fTemp - fCameraOffset;\n        v3Attenuate = exp(-fScatter * (v3InvWavelength * fKr4PI + fKm4PI));\n        v3FrontColor += v3Attenuate * (fDepth * fScaledLength);\n        v3SamplePoint += v3SampleRay;\n    }\n\n    // Calculate the attenuation factor for the ground\n    c0 = v3Attenuate;\n    c1 = v3FrontColor * (v3InvWavelength * fKrESun + fKmESun);\n\n    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );\n}";

/* babel-plugin-inline-import './Shaders/GlowFS.glsl' */
var GlowFS = "#include <logdepthbuf_pars_fragment>\n\nuniform int atmoIN;\nvarying float intensity;\n\nvec4 glowColor = vec4(0.45, 0.74, 1. ,1.0);\n\nvoid main() {\n    #include <logdepthbuf_fragment>\n    gl_FragColor = glowColor * intensity;\n}\n\n";

/* babel-plugin-inline-import './Shaders/GlowVS.glsl' */
var GlowVS = "#include <common>\n#include <logdepthbuf_pars_vertex>\n\nuniform int atmoIN;\nvarying float intensity;\n\nvoid main()\n{\n    vec3 normalES    = normalize( normalMatrix * normal );\n    vec3 normalCAMES = normalize( normalMatrix * cameraPosition );\n\n    if(atmoIN == 0) {\n        intensity = pow(0.666 - dot(normalES, normalCAMES), 4. );\n    } else {\n        intensity = pow( 1.  - dot(normalES, normalCAMES), 0.8 );\n    }\n\n    gl_Position = projectionMatrix * modelViewMatrix * vec4( position,  1.0 );\n\n    #include <logdepthbuf_vertex>\n}\n\n\n";
var LIGHTING_POSITION = new THREE.Vector3(1, 0, 0);
var v = new THREE.Vector3();
var coordCam = new _Coordinates["default"]('EPSG:4326');
var coordGeoCam = new _Coordinates["default"]('EPSG:4326');
var skyBaseColor = new THREE.Color(0x93d5f8);
var colorSky = new THREE.Color();
var spaceColor = new THREE.Color(0x030508);
var limitAlti = 600000;
var mfogDistance = _Ellipsoid.ellipsoidSizes.x * 160.0;

var Atmosphere = /*#__PURE__*/function (_GeometryLayer) {
  (0, _inherits2["default"])(Atmosphere, _GeometryLayer);

  var _super = _createSuper(Atmosphere);

  /**
  * It's layer to simulate Globe atmosphere.
  * There's 2 modes : simple and realistic (atmospheric-scattering).
   *
  * The atmospheric-scattering it is taken from :
  * * [Atmosphere Shader From Space (Atmospheric scattering)](http://stainlessbeer.weebly.com/planets-9-atmospheric-scattering.html)
  * * [Accurate Atmospheric Scattering (NVIDIA GPU Gems 2)]{@link https://developer.nvidia.com/gpugems/gpugems2/part-ii-shading-lighting-and-shadows/chapter-16-accurate-atmospheric-scattering}.
  *
  * @constructor
  * @extends GeometryLayer
  *
  * @param {string} id - The id of the layer Atmosphere.
  * @param {Object} [options] - options layer.
  * @param {number} [options.Kr] - `Kr` is the rayleigh scattering constant.
  * @param {number} [options.Km] - `Km` is the Mie scattering constant.
  * @param {number} [options.ESun] - `ESun` is the brightness of the sun.
  * @param {number} [options.g] - constant `g` that affects the symmetry of the scattering.
  * @param {number} [options.innerRadius] - The inner (planetary) radius
  * @param {number} [options.outerRadius] - The outer (Atmosphere) radius
  * @param {number[]} [options.wavelength] - The constant is the `wavelength` (or color) of light.
  * @param {number} [options.scaleDepth] - The `scale depth` (i.e. the altitude at which the atmosphere's average density is found).
  * @param {number} [options.mieScaleDepth] - not used.
  */
  function Atmosphere() {
    var _this;

    var id = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'atmosphere';
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, Atmosphere);
    options.source = false;
    _this = _super.call(this, id, new THREE.Object3D(), options);
    _this.isAtmosphere = true;
    var material = new THREE.ShaderMaterial({
      uniforms: {
        atmoIN: {
          type: 'i',
          value: 0
        },
        screenSize: {
          type: 'v2',
          value: new THREE.Vector2(window.innerWidth, window.innerHeight)
        } // Should be updated on screen resize...

      },
      vertexShader: GlowVS,
      fragmentShader: GlowFS,
      side: THREE.BackSide,
      blending: THREE.AdditiveBlending,
      transparent: true,
      wireframe: false
    });
    var sphereGeometry = new THREE.SphereGeometry(1, 64, 64);
    var basicAtmosphereOut = new THREE.Mesh(sphereGeometry, material);
    basicAtmosphereOut.scale.copy(_Ellipsoid.ellipsoidSizes).multiplyScalar(1.14);
    _this.basicAtmosphere = new THREE.Object3D();
    _this.realisticAtmosphere = new THREE.Object3D();
    _this.realisticAtmosphere.visible = false;

    _this.object3d.add(_this.basicAtmosphere);

    _this.object3d.add(_this.realisticAtmosphere);

    _this.basicAtmosphere.add(basicAtmosphereOut);

    var materialAtmoIn = new THREE.ShaderMaterial({
      uniforms: {
        atmoIN: {
          type: 'i',
          value: 1
        },
        screenSize: {
          type: 'v2',
          value: new THREE.Vector2(window.innerWidth, window.innerHeight)
        } // Should be updated on screen resize...

      },
      vertexShader: GlowVS,
      fragmentShader: GlowFS,
      side: THREE.FrontSide,
      blending: THREE.AdditiveBlending,
      transparent: true,
      depthWrite: false
    });
    var basicAtmosphereIn = new THREE.Mesh(sphereGeometry, materialAtmoIn);
    basicAtmosphereIn.scale.copy(_Ellipsoid.ellipsoidSizes).multiplyScalar(1.002);

    _this.basicAtmosphere.add(basicAtmosphereIn);

    _this.realisticLightingPosition = {
      x: -0.5,
      y: 0.0,
      z: 1.0
    };
    _this.fog = {
      enable: true,
      distance: mfogDistance
    }; // Atmosphere Shader From Space (Atmospheric scattering)
    // http://stainlessbeer.weebly.com/planets-9-atmospheric-scattering.html
    // https://developer.nvidia.com/gpugems/gpugems2/part-ii-shading-lighting-and-shadows/chapter-16-accurate-atmospheric-scattering

    _this.realisticAtmosphereInitParams = options.Kr ? options : {
      Kr: 0.0025,
      Km: 0.0015,
      ESun: 20.0,
      g: -0.950,
      innerRadius: 6400000,
      outerRadius: 6700000,
      wavelength: [0.650, 0.570, 0.475],
      scaleDepth: 0.25 // mieScaleDepth: 0.1,

    };

    _this.object3d.updateMatrixWorld();

    return _this;
  }

  (0, _createClass2["default"])(Atmosphere, [{
    key: "update",
    value: function update(context, layer, node) {
      // update uniforms
      node.material.fogDistance = this.fog.distance;
      node.material.lightingEnabled = this.realisticAtmosphere.visible;
      node.material.lightPosition = this.realisticLightingPosition;
    } // eslint-disable-next-line no-unused-vars

  }, {
    key: "preUpdate",
    value: function preUpdate(context) {
      var cameraPosition = context.view.camera.camera3D.position;

      if (this.fog.enable) {
        v.setFromMatrixPosition(context.view.tileLayer.object3d.matrixWorld);
        var len = v.distanceTo(cameraPosition); // Compute fog distance, this function makes it possible to have a shorter distance
        // when the camera approaches the ground

        this.fog.distance = mfogDistance * Math.pow((len - _Ellipsoid.ellipsoidSizes.x * 0.99) * 0.25 / _Ellipsoid.ellipsoidSizes.x, 1.5);
      } else {
        this.fog.distance = 10e10;
      }

      var renderer = context.view.mainLoop.gfxEngine.renderer; // get altitude camera

      coordCam.crs = context.view.referenceCrs;
      coordCam.setFromVector3(cameraPosition).as('EPSG:4326', coordGeoCam);
      var altitude = coordGeoCam.altitude; // If the camera altitude is below limitAlti,
      // we interpolate between the sky color and the space color

      if (altitude < limitAlti) {
        colorSky.copy(spaceColor).lerp(skyBaseColor, (limitAlti - altitude) / limitAlti);
        renderer.setClearColor(colorSky, renderer.getClearAlpha());
      } else {
        renderer.setClearColor(spaceColor, renderer.getClearAlpha());
      }
    } // default to non-realistic lightning

  }, {
    key: "_initRealisticLighning",
    value: function _initRealisticLighning() {
      var atmosphere = this.realisticAtmosphereInitParams;
      var uniformsAtmosphere = {
        v3LightPosition: {
          value: LIGHTING_POSITION.clone().normalize()
        },
        v3InvWavelength: {
          value: new THREE.Vector3(1 / Math.pow(atmosphere.wavelength[0], 4), 1 / Math.pow(atmosphere.wavelength[1], 4), 1 / Math.pow(atmosphere.wavelength[2], 4))
        },
        fCameraHeight: {
          value: 0.0
        },
        fCameraHeight2: {
          value: 0.0
        },
        fInnerRadius: {
          value: atmosphere.innerRadius
        },
        fInnerRadius2: {
          value: atmosphere.innerRadius * atmosphere.innerRadius
        },
        fOuterRadius: {
          value: atmosphere.outerRadius
        },
        fOuterRadius2: {
          value: atmosphere.outerRadius * atmosphere.outerRadius
        },
        fKrESun: {
          value: atmosphere.Kr * atmosphere.ESun
        },
        fKmESun: {
          value: atmosphere.Km * atmosphere.ESun
        },
        fKr4PI: {
          value: atmosphere.Kr * 4.0 * Math.PI
        },
        fKm4PI: {
          value: atmosphere.Km * 4.0 * Math.PI
        },
        fScale: {
          value: 1 / (atmosphere.outerRadius - atmosphere.innerRadius)
        },
        fScaleDepth: {
          value: atmosphere.scaleDepth
        },
        fScaleOverScaleDepth: {
          value: 1 / (atmosphere.outerRadius - atmosphere.innerRadius) / atmosphere.scaleDepth
        },
        g: {
          value: atmosphere.g
        },
        g2: {
          value: atmosphere.g * atmosphere.g
        },
        nSamples: {
          value: 3
        },
        fSamples: {
          value: 3.0
        },
        tDisplacement: {
          value: new THREE.Texture()
        },
        tSkyboxDiffuse: {
          value: new THREE.Texture()
        },
        fNightScale: {
          value: 1.0
        }
      };
      var geometryAtmosphereIn = new THREE.SphereGeometry(atmosphere.innerRadius, 50, 50);
      var materialAtmosphereIn = new THREE.ShaderMaterial({
        uniforms: uniformsAtmosphere,
        vertexShader: groundVS,
        fragmentShader: groundFS,
        blending: THREE.AdditiveBlending,
        transparent: true,
        depthTest: false,
        depthWrite: false
      });
      var ground = new THREE.Mesh(geometryAtmosphereIn, materialAtmosphereIn);
      var geometryAtmosphereOut = new THREE.SphereGeometry(atmosphere.outerRadius, 196, 196);
      var materialAtmosphereOut = new THREE.ShaderMaterial({
        uniforms: uniformsAtmosphere,
        vertexShader: skyVS,
        fragmentShader: skyFS,
        transparent: true,
        side: THREE.BackSide
      });
      var sky = new THREE.Mesh(geometryAtmosphereOut, materialAtmosphereOut);
      var skyDome = new _SkyShader["default"]();
      skyDome.frustumCulled = false;
      ground.layers.mask = this.object3d.layers.mask;
      sky.layers.mask = this.object3d.layers.mask;
      skyDome.layers.mask = this.object3d.layers.mask;
      this.realisticAtmosphere.add(ground);
      this.realisticAtmosphere.add(sky);
      this.realisticAtmosphere.add(skyDome);
      var effectController = {
        turbidity: 10,
        reileigh: 2,
        mieCoefficient: 0.005,
        mieDirectionalG: 0.8,
        luminance: 1,
        inclination: 0.49,
        // elevation / inclination
        azimuth: 0.25,
        // Facing front,
        sun: !true
      };
      skyDome.material.uniforms.turbidity.value = effectController.turbidity;
      skyDome.material.uniforms.reileigh.value = effectController.reileigh;
      skyDome.material.uniforms.luminance.value = effectController.luminance;
      skyDome.material.uniforms.mieCoefficient.value = effectController.mieCoefficient;
      skyDome.material.uniforms.mieDirectionalG.value = effectController.mieDirectionalG;
      skyDome.material.uniforms.up.value = new THREE.Vector3(); // no more necessary, estimate normal from cam..
    }
  }, {
    key: "setRealisticOn",
    value: function setRealisticOn(bool) {
      var _this2 = this;

      if (bool) {
        if (!this.realisticAtmosphere.children.length) {
          this._initRealisticLighning();
        }

        this.realisticLightingPosition = _CoordStars["default"].getSunPositionInScene(new Date().getTime(), 48.85, 2.35).normalize();
        this.realisticAtmosphere.children.forEach(function (obj) {
          return obj.material.uniforms.v3LightPosition.value.copy(_this2.realisticLightingPosition);
        });
      }

      this.basicAtmosphere.visible = !bool;
      this.realisticAtmosphere.visible = bool;
    }
  }]);
  return Atmosphere;
}(_GeometryLayer2["default"]);

var _default = Atmosphere;
exports["default"] = _default;