"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.enableDracoLoader = enableDracoLoader;
exports["default"] = exports.legacyGLTFLoader = exports.glTFLoader = void 0;

var _typeof2 = _interopRequireDefault(require("@babel/runtime/helpers/typeof"));

var THREE = _interopRequireWildcard(require("three"));

var _Capabilities = _interopRequireDefault(require("../Core/System/Capabilities"));

var _GLTFLoader = require("../ThreeExtended/loaders/GLTFLoader");

var _DRACOLoader = require("../ThreeExtended/loaders/DRACOLoader");

var _LegacyGLTFLoader = _interopRequireDefault(require("./deprecated/LegacyGLTFLoader"));

var _ShaderUtils = _interopRequireDefault(require("../Renderer/Shader/ShaderUtils"));

var _Utf8Decoder = _interopRequireDefault(require("../Utils/Utf8Decoder"));

var _C3DTBatchTable = _interopRequireDefault(require("../Core/3DTiles/C3DTBatchTable"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var matrixChangeUpVectorZtoY = new THREE.Matrix4().makeRotationX(Math.PI / 2); // For gltf rotation

var matrixChangeUpVectorZtoX = new THREE.Matrix4().makeRotationZ(-Math.PI / 2);
var glTFLoader = new _GLTFLoader.GLTFLoader();
exports.glTFLoader = glTFLoader;
var legacyGLTFLoader = new _LegacyGLTFLoader["default"]();
exports.legacyGLTFLoader = legacyGLTFLoader;

function filterUnsupportedSemantics(obj) {
  // see GLTFLoader GLTFShader.prototype.update function
  var supported = ['MODELVIEW', 'MODELVIEWINVERSETRANSPOSE', 'PROJECTION', 'JOINTMATRIX'];

  if (obj.gltfShader) {
    var names = []; // eslint-disable-next-line guard-for-in

    for (var name in obj.gltfShader.boundUniforms) {
      names.push(name);
    }

    for (var _i = 0, _names = names; _i < _names.length; _i++) {
      var _name = _names[_i];
      var semantic = obj.gltfShader.boundUniforms[_name].semantic;

      if (!supported.includes(semantic)) {
        delete obj.gltfShader.boundUniforms[_name];
      }
    }
  }
}
/**
 * @module B3dmParser
 */

/**
 * Enable Draco decoding for gltf.
 * @param {string} path to draco library folder.
 * This library is mandatory to load b3dm with Draco compression.
 * @param {object} config optional configuration for Draco compression.
 *
 * The Draco library files are in folder itowns/examples/libs/draco/.
 * You are obliged to indicate this path when you want enable the Draco Decoding.
 *
 * For more information on Draco, read file in /itowns/examples/libs/draco/README.md.
 *
 * @example <caption>Enable draco decoder</caption>
 * // if you copied the folder from /itowns/examples/libs/draco/ to your root project,
 * // You could set path with './'.
 * itowns.enableDracoLoader('./');
 */


function enableDracoLoader(path, config) {
  if (!path) {
    throw new Error('Path to draco folder is mandatory');
  }

  var dracoLoader = new _DRACOLoader.DRACOLoader();
  dracoLoader.setDecoderPath(path);

  if (config) {
    dracoLoader.setDecoderConfig(config);
  }

  glTFLoader.setDRACOLoader(dracoLoader);
}

var _default = {
  /** Parse b3dm buffer and extract THREE.Scene and batch table
   * @param {ArrayBuffer} buffer - the b3dm buffer.
   * @param {Object} options - additional properties.
   * @param {string=} [options.gltfUpAxis='Y'] - embedded glTF model up axis.
   * @param {string} options.urlBase - the base url of the b3dm file (used to fetch textures for the embedded glTF model).
   * @param {boolean=} [options.doNotPatchMaterial='false'] - disable patching material with logarithmic depth buffer support.
   * @param {float} [options.opacity=1.0] - the b3dm opacity.
   * @param {boolean|Material=} [options.overrideMaterials='false'] - override b3dm's embedded glTF materials. If overrideMaterials is a three.js material, it will be the material used to override.
   * @return {Promise} - a promise that resolves with an object containig a THREE.Scene (gltf) and a batch table (batchTable).
   *
   */
  parse: function parse(buffer, options) {
    var gltfUpAxis = options.gltfUpAxis;
    var urlBase = options.urlBase;

    if (!buffer) {
      throw new Error('No array buffer provided.');
    }

    var view = new DataView(buffer, 4); // starts after magic

    var byteOffset = 0;
    var b3dmHeader = {}; // Magic type is unsigned char [4]

    var magicNumberByteLength = 4;
    b3dmHeader.magic = _Utf8Decoder["default"].decode(new Uint8Array(buffer, 0, magicNumberByteLength));

    if (b3dmHeader.magic) {
      // Version, byteLength, batchTableJSONByteLength, batchTableBinaryByteLength and batchTable types are uint32
      b3dmHeader.version = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      b3dmHeader.byteLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      b3dmHeader.FTJSONLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      b3dmHeader.FTBinaryLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      b3dmHeader.BTJSONLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      b3dmHeader.BTBinaryLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      var headerByteLength = byteOffset + magicNumberByteLength;
      var promises = [];
      var FTJSON = {};
      var FT_RTC = new THREE.Vector3();

      if (b3dmHeader.FTJSONLength > 0) {
        var sizeBegin = headerByteLength;
        var jsonBuffer = buffer.slice(sizeBegin, b3dmHeader.FTJSONLength + sizeBegin);

        var content = _Utf8Decoder["default"].decode(new Uint8Array(jsonBuffer));

        FTJSON = JSON.parse(content);

        if (FTJSON.RTC_CENTER) {
          FT_RTC.fromArray(FTJSON.RTC_CENTER);
        } else {
          FT_RTC.set(0, 0, 0);
        }
      }

      if (b3dmHeader.FTBinaryLength > 0) {
        console.warn('3D Tiles feature table binary not supported yet.');
      } // Parse batch table


      if (b3dmHeader.BTJSONLength > 0) {
        // sizeBegin is an index to the beginning of the batch table
        var _sizeBegin = headerByteLength + b3dmHeader.FTJSONLength + b3dmHeader.FTBinaryLength;

        var BTBuffer = buffer.slice(_sizeBegin, b3dmHeader.BTJSONLength + _sizeBegin);
        promises.push(new _C3DTBatchTable["default"](BTBuffer, b3dmHeader.BTBinaryLength, FTJSON.BATCH_LENGTH, options.registeredExtensions));
      } else {
        promises.push(Promise.resolve({}));
      }

      var posGltf = headerByteLength + b3dmHeader.FTJSONLength + b3dmHeader.FTBinaryLength + b3dmHeader.BTJSONLength + b3dmHeader.BTBinaryLength;
      var gltfBuffer = buffer.slice(posGltf);
      var headerView = new DataView(gltfBuffer, 0, 20);
      promises.push(new Promise(function (resolve
      /* , reject */
      ) {
        var onload = function (gltf) {
          var _iterator = _createForOfIteratorHelper(gltf.scenes),
              _step;

          try {
            for (_iterator.s(); !(_step = _iterator.n()).done;) {
              var scene = _step.value;
              scene.traverse(filterUnsupportedSemantics);
            } // Rotation managed

          } catch (err) {
            _iterator.e(err);
          } finally {
            _iterator.f();
          }

          if (gltfUpAxis === undefined || gltfUpAxis === 'Y') {
            gltf.scene.applyMatrix4(matrixChangeUpVectorZtoY);
          } else if (gltfUpAxis === 'X') {
            gltf.scene.applyMatrix4(matrixChangeUpVectorZtoX);
          } // Apply relative center from Feature table.


          gltf.scene.position.copy(FT_RTC); // Apply relative center from gltf json.

          var contentArray = new Uint8Array(gltfBuffer, 20, headerView.getUint32(12, true));

          var content = _Utf8Decoder["default"].decode(new Uint8Array(contentArray));

          var json = JSON.parse(content);

          if (json.extensions && json.extensions.CESIUM_RTC) {
            gltf.scene.position.fromArray(json.extensions.CESIUM_RTC.center);
            gltf.scene.updateMatrixWorld(true);
          }

          gltf.scene.traverse(function (mesh) {
            mesh.frustumCulled = false;

            if (mesh.material) {
              if (options.overrideMaterials) {
                if (Array.isArray(mesh.material)) {
                  var _iterator2 = _createForOfIteratorHelper(mesh.material),
                      _step2;

                  try {
                    for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
                      var material = _step2.value;
                      material.dispose();
                    }
                  } catch (err) {
                    _iterator2.e(err);
                  } finally {
                    _iterator2.f();
                  }
                } else {
                  mesh.material.dispose();
                }

                if ((0, _typeof2["default"])(options.overrideMaterials) === 'object' && options.overrideMaterials.isMaterial) {
                  mesh.material = options.overrideMaterials;
                } else {
                  mesh.material.depthWrite = true;
                }
              } else if (_Capabilities["default"].isLogDepthBufferSupported() && mesh.material.isRawShaderMaterial && !options.doNotPatchMaterial) {
                _ShaderUtils["default"].patchMaterialForLogDepthSupport(mesh.material);

                console.warn('b3dm shader has been patched to add log depth buffer support');
              }

              mesh.material.transparent = options.opacity < 1.0;
              mesh.material.opacity = options.opacity;
            }
          });
          resolve(gltf);
        };

        var version = headerView.getUint32(4, true);

        if (version === 1) {
          legacyGLTFLoader.parse(gltfBuffer, urlBase, onload);
        } else {
          glTFLoader.parse(gltfBuffer, urlBase, onload);
        }
      }));
      return Promise.all(promises).then(function (values) {
        return {
          gltf: values[1],
          batchTable: values[0]
        };
      });
    } else {
      throw new Error('Invalid b3dm file.');
    }
  }
};
exports["default"] = _default;