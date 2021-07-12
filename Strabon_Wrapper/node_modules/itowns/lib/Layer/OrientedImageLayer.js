"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _GeometryLayer2 = _interopRequireDefault(require("./GeometryLayer"));

var _OrientedImageMaterial = _interopRequireDefault(require("../Renderer/OrientedImageMaterial"));

var _GeoJsonParser = _interopRequireDefault(require("../Parser/GeoJsonParser"));

var _CameraCalibrationParser = _interopRequireDefault(require("../Parser/CameraCalibrationParser"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _OrientationUtils = _interopRequireDefault(require("../Utils/OrientationUtils"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var coord = new _Coordinates["default"]('EPSG:4978', 0, 0, 0);

var commandCancellation = function (cmd) {
  return cmd.requester.id !== cmd.layer.currentPano.id;
};

function updatePano(context, camera, layer) {
  var newPano = layer.mostNearPano(camera.position); // detection of oriented image change

  var currentId = layer.currentPano ? layer.currentPano.id : undefined;

  if (newPano && currentId != newPano.id) {
    layer.currentPano = newPano; // callback to indicate current pano has changed

    layer.onPanoChanged({
      previousPanoPosition: layer.getPreviousPano() ? layer.getPreviousPano().position : undefined,
      currentPanoPosition: layer.getCurrentPano().position,
      nextPanoPosition: layer.getNextPano().position
    }); // prepare informations about the needed textures

    var panoCameras = newPano.geometries[0].properties.idSensors;
    var imagesInfo = layer.cameras.map(function (cam) {
      return {
        cameraId: cam.name,
        panoId: newPano.id,
        as: function as() {}
      };
    }).filter(function (info) {
      return !panoCameras || panoCameras.includes(info.cameraId);
    });
    var command = {
      layer: layer,
      // put informations about image URL as extent to be used by generic DataSourceProvider, OrientedImageSource will use that.
      extentsSource: imagesInfo,
      view: context.view,
      threejsLayer: layer.threejsLayer,
      requester: newPano,
      earlyDropFunction: commandCancellation
    }; // async call to scheduler to get textures

    context.scheduler.execute(command).then(function (textures) {
      if (newPano.id === layer.currentPano.id) {
        layer.material.setTextures(textures, newPano, layer.getCamerasNameFromFeature(newPano));
        layer.material.updateUniforms(context.camera.camera3D);
        context.view.notifyChange(layer, true);
      }
    }, function () {});
  }
}

function updateBackground(layer) {
  if (layer.background && layer.currentPano) {
    layer.background.position.copy(layer.currentPano.position);
    layer.background.updateMatrixWorld();
    layer.background.material = layer.material || layer.background.material;
  }
}

function createBackground(radius) {
  if (!radius || radius <= 0) {
    return undefined;
  }

  var geometry = new THREE.SphereGeometry(radius, 32, 32);
  var material = new THREE.MeshPhongMaterial({
    color: 0x7777ff,
    side: THREE.DoubleSide,
    transparent: true,
    opacity: 0.5,
    wireframe: true
  });
  var sphere = new THREE.Mesh(geometry, material);
  sphere.visible = true;
  sphere.name = 'OrientedImageBackground';
  return sphere;
}
/**
 * @classdesc OrientedImageLayer loads oriented images, and project these textures on the scene.
 * It is design to create an immersive view. </br>
 * It loads a set of panoramic position and orientation,
 * a set of camera calibration file (it's the same set of camera for each panoramic),
 * and a set of texture (each image for each camera for each panoramic), all organised in an {@link OrientedImageSource}. </br>
 * It creates an {@link OrientedImageMaterial} used to do projective texture mapping on the scene.
 * @extends GeometryLayer
 */


var OrientedImageLayer = /*#__PURE__*/function (_GeometryLayer) {
  (0, _inherits2["default"])(OrientedImageLayer, _GeometryLayer);

  var _super = _createSuper(OrientedImageLayer);

  /**
   * @constructor
   * @param { string } id - The id of the layer, a unique name.
   * @param { Object } config - configuration of the layer
   * @param { number } config.backgroundDistance - Radius in meter of the sphere used as a background
   * @param { function } config.onPanoChanged - callback fired when current panoramic changes
   * @param { string } config.crs - crs projection of the view
   * @param { string } config.orientation - Json object, using GeoJSon format to represent points,
   * it's a set of panoramic position and orientation.
   * @param { string } config.calibrations - Json object, representing a set of camera. see [CameraCalibrationParser]{@link module:CameraCalibrationParser}
   * @param { OrientedImageSource } config.source - Source used to build url of texture for each oriented image,
   * a tecture is need for each camera, for each panoramic.
   */
  function OrientedImageLayer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, OrientedImageLayer);

    /* istanbul ignore next */
    if (config.projection) {
      console.warn('OrientedImageLayer projection parameter is deprecated, use crs instead.');
      config.crs = config.crs || config.projection;
    }

    _this = _super.call(this, id, new THREE.Group(), config);
    _this.background = config.background || createBackground(config.backgroundDistance);
    _this.isOrientedImageLayer = true;

    if (_this.background) {
      _this.object3d.add(_this.background);
    } // currentPano is the current point, means it's the closest from the camera


    _this.currentPano = undefined; // store a callback to fire event when current panoramic change

    _this.onPanoChanged = config.onPanoChanged || function () {}; // function to get cameras name from panoramic feature


    _this.getCamerasNameFromFeature = config.getCamerasNameFromFeature || function () {};

    var resolve = _this.addInitializationStep();

    _this.mergeFeatures = false;
    _this.filteringExtent = false;
    var options = {
      out: (0, _assertThisInitialized2["default"])(_this)
    }; // panos is an array of feature point, representing many panoramics.
    // for each point, there is a position and a quaternion attribute.

    _this.source.whenReady.then(function (metadata) {
      return _GeoJsonParser["default"].parse(config.orientation || metadata.orientation, options).then(function (orientation) {
        _this.panos = orientation.features; // the crs input is parsed in geojson parser
        // and returned in options.in

        var crsIn = options["in"].crs;
        var crsOut = config.crs;

        var crs2crs = _OrientationUtils["default"].quaternionFromCRSToCRS(crsIn, crsOut);

        var quat = new THREE.Quaternion(); // add position and quaternion attributes from point feature

        var i = 0;

        var _iterator = _createForOfIteratorHelper(_this.panos),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var pano = _step.value;
            // set position
            coord.crs = pano.crs;
            coord.setFromArray(pano.vertices).applyMatrix4(orientation.matrix);
            pano.position = coord.toVector3(); // set quaternion

            crs2crs(coord, quat);
            pano.quaternion = _OrientationUtils["default"].quaternionFromAttitude(pano.geometries[0].properties).premultiply(quat);
            pano.id = pano.geometries[0].properties.id;
            pano.index = i++;
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }).then(function () {
        // array of cameras, represent the projective texture configuration for each panoramic.
        _CameraCalibrationParser["default"].parse(config.calibration || metadata.calibration, config).then(function (cameras) {
          _this.cameras = cameras; // create the material

          _this.material = new _OrientedImageMaterial["default"](_this.cameras, config);
          resolve();
        });
      });
    });

    return _this;
  } // eslint-disable-next-line


  (0, _createClass2["default"])(OrientedImageLayer, [{
    key: "update",
    value: function update() {}
  }, {
    key: "boostLight",
    get: function get() {
      return this.material.uniforms.boostLight.value;
    },
    set: function set(value) {
      this.material.uniforms.boostLight.value = value;
    }
  }, {
    key: "preUpdate",
    value: function preUpdate(context) {
      updatePano(context, context.camera.camera3D, this);
      this.material.updateUniforms(context.camera.camera3D);
      updateBackground(this);
    }
  }, {
    key: "getNextPano",
    value: function getNextPano() {
      var index = (this.currentPano.index + 1) % this.panos.length;
      return this.panos[index];
    }
  }, {
    key: "getCurrentPano",
    value: function getCurrentPano() {
      return this.currentPano;
    }
  }, {
    key: "getPreviousPano",
    value: function getPreviousPano() {
      var index = (this.currentPano.index - 1) % this.panos.length;
      return this.panos[index];
    }
    /**
     * Delete background, but doesn't delete OrientedImageLayer.material. For the moment, this material visibility is set to false.
     * You need to replace OrientedImageLayer.material applied on each object, if you want to continue displaying them.
     * This issue (see #1018 {@link https://github.com/iTowns/itowns/issues/1018}) will be fixed when OrientedImageLayer will be a ColorLayer.
     */

  }, {
    key: "delete",
    value: function _delete() {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(OrientedImageLayer.prototype), "delete", this).call(this);
      this.material.visible = false;
      console.warn('You need to replace OrientedImageLayer.material applied on each object. This issue will be fixed when OrientedImageLayer will be a ColorLayer. the material visibility is set to false. To follow issue see https://github.com/iTowns/itowns/issues/1018');
    }
  }, {
    key: "mostNearPano",
    value: function mostNearPano(position) {
      var minDistance = Infinity;
      var nearPano;

      var _iterator2 = _createForOfIteratorHelper(this.panos),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var pano = _step2.value;
          var distance = position.distanceTo(pano.position);

          if (distance < minDistance) {
            minDistance = distance;
            nearPano = pano;
          }
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      return nearPano;
    }
  }]);
  return OrientedImageLayer;
}(_GeometryLayer2["default"]);

var _default = OrientedImageLayer;
exports["default"] = _default;