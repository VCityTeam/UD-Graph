"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getLookAtFromMath = getLookAtFromMath;
exports.getRig = getRig;
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _tween = _interopRequireDefault(require("@tweenjs/tween.js"));

var _DEMUtils = _interopRequireDefault(require("./DEMUtils"));

var _MainLoop = require("../Core/MainLoop");

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _Ellipsoid = _interopRequireDefault(require("../Core/Math/Ellipsoid"));

var _OBB = _interopRequireDefault(require("../Renderer/OBB"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

THREE.Object3D.DefaultUp.set(0, 0, 1);
var targetPosition = new THREE.Vector3();
var targetCoord = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);
var ellipsoid = new _Ellipsoid["default"]();
var rigs = [];
var obb = new _OBB["default"]();
var size = new THREE.Vector3();

var deferred = function () {
  var resolve;
  var reject;
  return {
    promise: new Promise(function (re, rej) {
      resolve = re;
      reject = rej;
    }),
    resolve: resolve,
    reject: reject
  };
}; // Wrap angle in degrees to [-180 180]


function wrapTo180(angle) {
  return angle - Math.floor((angle + 180.0) / 360) * 360;
}

function tileLayer(view) {
  return view.getLayers(function (l) {
    return l.isTiledGeometryLayer;
  })[0];
}

function getLookAtFromMath(view, camera) {
  var direction = new THREE.Vector3(0, 0, 0.5);
  direction.unproject(camera);
  direction.sub(camera.position).normalize();

  if (view.referenceCrs == 'EPSG:4978') {
    // Intersect Ellispoid
    return ellipsoid.intersection({
      direction: direction,
      origin: camera.position
    });
  } else {
    // Intersect plane
    var distance = camera.position.z / direction.z;
    return direction.multiplyScalar(distance).add(camera.position);
  }
}

function proxyProperty(view, camera, rig, key) {
  rig.proxy.position[key] = camera.position[key];
  Object.defineProperty(camera.position, key, {
    get: function get() {
      return rig.proxy.position[key];
    },
    set: function set(newValue) {
      rig.removeProxy(view, camera);
      camera.position[key] = newValue;
    }
  });
} // the rig is used to manipulate the camera
// It consists of a tree of 3D objects, each element is assigned a task
//
//                      Transformation
//
// rig                  position on Coordinate  (for the globe is rotation)
// |
// └── sealevel         position on altitude zero
//     |
//     └── target       position on DEM, and rotation (pitch and heading)
//         |
//         └── camera   distance to target
//
// When all transformations are calculated,
// this.camera's transformation is applied to view.camera.camera


var CameraRig = /*#__PURE__*/function (_THREE$Object3D) {
  (0, _inherits2["default"])(CameraRig, _THREE$Object3D);

  var _super = _createSuper(CameraRig);

  function CameraRig() {
    var _this;

    (0, _classCallCheck2["default"])(this, CameraRig);
    _this = _super.call(this); // seaLevel is on rig's z axis, it's at altitude zero

    _this.seaLevel = new THREE.Object3D(); // target is on seaLevel's z axis and target.position.z is the DEM altitude

    _this.target = new THREE.Object3D();
    _this.target.rotation.order = 'ZXY'; // camera look at target

    _this.camera = new THREE.Camera();

    _this.add(_this.seaLevel);

    _this.seaLevel.add(_this.target);

    _this.target.add(_this.camera); // sea level's geograohic coordinate


    _this.coord = new _Coordinates["default"]('EPSG:4978', 0, 0); // sea level's worldPoistion

    _this.targetWorldPosition = new THREE.Vector3();

    _this.removeAll = function () {};

    _this._onChangeCallback = null;
    return _this;
  } // apply rig.camera's transformation to camera


  (0, _createClass2["default"])(CameraRig, [{
    key: "applyTransformToCamera",
    value: function applyTransformToCamera(view, camera) {
      var _this2 = this;

      if (this.proxy) {
        camera.quaternion._onChange(this._onChangeCallback);

        this.camera.matrixWorld.decompose(this.proxy.position, camera.quaternion, camera.scale);

        camera.quaternion._onChange(function () {
          return _this2.removeProxy(view, camera);
        });
      } else {
        this.camera.matrixWorld.decompose(camera.position, camera.quaternion, camera.scale);
      }
    }
  }, {
    key: "setProxy",
    value: function setProxy(view, camera) {
      var _this3 = this;

      if (!this.proxy && view && camera) {
        this.proxy = {
          position: new THREE.Vector3()
        };
        Object.keys(camera.position).forEach(function (key) {
          return proxyProperty(view, camera, _this3, key);
        });
        this._onChangeCallback = camera.quaternion._onChangeCallback;

        camera.quaternion._onChange(function () {
          return _this3.removeProxy(view, camera);
        });
      }
    }
  }, {
    key: "removeProxy",
    value: function removeProxy(view, camera) {
      var _this4 = this;

      this.stop(view);

      if (this.proxy && view && camera) {
        Object.keys(camera.position).forEach(function (key) {
          return Object.defineProperty(camera.position, key, {
            value: _this4.proxy.position[key],
            writable: true
          });
        });

        camera.quaternion._onChange(this._onChangeCallback);

        this.proxy = null;
      }
    }
  }, {
    key: "setTargetFromCoordinate",
    value: function setTargetFromCoordinate(view, coord) {
      // clamp altitude to seaLevel
      coord.as(tileLayer(view).extent.crs, this.coord);
      var altitude = Math.max(0, this.coord.z);
      this.coord.z = altitude; // adjust target's position with clamped altitude

      this.coord.as(view.referenceCrs).toVector3(targetPosition);

      if (view.referenceCrs == 'EPSG:4978') {
        // ellipsoid geocentric projection
        this.lookAt(targetPosition);
        this.seaLevel.position.set(0, 0, targetPosition.length() - altitude);
      } else {
        // planar projection
        this.position.set(targetPosition.x, targetPosition.y, 0);
        this.seaLevel.position.set(0, 0, 0);
      } // place camera's target


      this.target.position.set(0, 0, altitude);
    } // set rig's objects transformation from camera's position and target's position

  }, {
    key: "setFromPositions",
    value: function setFromPositions(view, cameraPosition) {
      this.setTargetFromCoordinate(view, new _Coordinates["default"](view.referenceCrs, targetPosition));
      this.target.rotation.set(0, 0, 0);
      this.updateMatrixWorld(true);
      this.camera.position.copy(cameraPosition);
      this.target.worldToLocal(this.camera.position);
      var range = this.camera.position.length();
      this.target.rotation.x = Math.asin(this.camera.position.z / range);
      var cosPlanXY = THREE.MathUtils.clamp(this.camera.position.y / (Math.cos(this.target.rotation.x) * range), -1, 1);
      this.target.rotation.z = Math.sign(-this.camera.position.x || 1) * Math.acos(cosPlanXY);
      this.camera.position.set(0, range, 0);
    } // set from target's coordinate, rotation and range between target and camera

  }, {
    key: "applyParams",
    value: function applyParams(view, params) {
      if (params.coord) {
        this.setTargetFromCoordinate(view, params.coord);
      }

      if (params.tilt != undefined) {
        this.target.rotation.x = THREE.MathUtils.degToRad(params.tilt);
      }

      if (params.heading != undefined) {
        this.target.rotation.z = THREE.MathUtils.degToRad(-wrapTo180(params.heading + 180));
      }

      if (params.range) {
        this.camera.position.set(0, params.range, 0);
      }

      this.camera.rotation.set(-Math.PI * 0.5, 0, Math.PI);
      this.updateMatrixWorld(true);
      this.targetWorldPosition.setFromMatrixPosition(this.seaLevel.matrixWorld);
    }
  }, {
    key: "getParams",
    value: function getParams() {
      return {
        coord: this.coord.clone(),
        tilt: this.tilt,
        heading: this.heading,
        range: this.range,
        targetWorldPosition: this.targetWorldPosition
      };
    }
  }, {
    key: "setfromCamera",
    value: function setfromCamera(view, camera, pickedPosition) {
      camera.updateMatrixWorld(true);

      if (pickedPosition == undefined) {
        pickedPosition = view.getPickingPositionFromDepth() || getLookAtFromMath(view, camera);
      }

      var range = pickedPosition && !isNaN(pickedPosition.x) ? camera.position.distanceTo(pickedPosition) : 100;
      camera.localToWorld(targetPosition.set(0, 0, -range));
      this.setFromPositions(view, camera.position);
    }
  }, {
    key: "copyObject3D",
    value: function copyObject3D(rig) {
      this.copy(rig, false);
      this.seaLevel.copy(rig.seaLevel, false);
      this.target.copy(rig.target, false);
      this.camera.copy(rig.camera);
      return this;
    }
  }, {
    key: "animateCameraToLookAtTarget",
    value: function animateCameraToLookAtTarget(view, camera, params) {
      var _this5 = this;

      params.easing = params.easing || _tween["default"].Easing.Quartic.InOut;
      this.setfromCamera(view, camera);
      var tweenGroup = new _tween["default"].Group();
      this.start = (this.start || new CameraRig()).copyObject3D(this);
      this.end = (this.end || new CameraRig()).copyObject3D(this);
      var time = params.time || 2500;
      var factor = {
        t: 0
      };
      var animations = [];
      var def = deferred();
      this.addPlaceTargetOnGround(view, camera, params.coord, factor);
      this.end.applyParams(view, params); // compute the angle along z-axis between the starting position and the end position

      var difference = this.end.target.rotation.z - this.start.target.rotation.z; // if that angle is superior to 180°, recompute the rotation as the complementary angle.

      if (Math.abs(difference) > Math.PI) {
        this.end.target.rotation.z = this.start.target.rotation.z + difference - Math.sign(difference) * 2 * Math.PI;
      }

      animations.push(new _tween["default"].Tween(factor, tweenGroup).to({
        t: 1
      }, time).easing(params.easing).onUpdate(function (d) {
        // rotate to coord destination in geocentric projection
        if (view.referenceCrs == 'EPSG:4978') {
          _this5.quaternion.slerpQuaternions(_this5.start.quaternion, _this5.end.quaternion, d.t);
        } // camera rotation


        _this5.camera.quaternion.slerpQuaternions(_this5.start.camera.quaternion, _this5.end.camera.quaternion, d.t); // camera's target rotation


        _this5.target.rotation.set(0, 0, 0);

        _this5.target.rotateZ(THREE.MathUtils.lerp(_this5.start.target.rotation.z, _this5.end.target.rotation.z, d.t));

        _this5.target.rotateX(THREE.MathUtils.lerp(_this5.start.target.rotation.x, _this5.end.target.rotation.x, d.t));
      })); // translate to coordinate destination in planar projection

      if (view.referenceCrs != 'EPSG:4978') {
        animations.push(new _tween["default"].Tween(this.position, tweenGroup).to(this.end.position, time).easing(params.easing));
      } // translate to altitude zero


      animations.push(new _tween["default"].Tween(this.seaLevel.position, tweenGroup).to(this.end.seaLevel.position, time).easing(params.easing)); // translate camera position

      animations.push(new _tween["default"].Tween(this.camera.position, tweenGroup).to(this.end.camera.position, time).easing(params.easing)); // update animations, transformation and view

      this.animationFrameRequester = function () {
        tweenGroup.update();

        _this5.updateMatrixWorld(true);

        _this5.applyTransformToCamera(view, camera);

        _this5.targetWorldPosition.setFromMatrixPosition(_this5.seaLevel.matrixWorld);

        if (params.callback) {
          params.callback(_this5);
        }

        targetCoord.crs = view.referenceCrs;
        targetCoord.setFromVector3(_this5.targetWorldPosition).as(tileLayer(view).extent.crs, _this5.coord);
        view.notifyChange(camera);
      };

      this.removeAll = function (o) {
        this.removeAll = function () {};

        tweenGroup.removeAll();

        if (this.animationFrameRequester) {
          view.removeFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.BEFORE_RENDER, this.animationFrameRequester);
        }

        def.resolve(o !== undefined);
        this.animationFrameRequester = null;
      }; // Waiting last animation complete,
      // we assume that the animation that completes last is the one that was started last


      animations[animations.length - 1].onComplete(this.removeAll);
      animations.forEach(function (anim) {
        return anim.start();
      });
      view.addFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.BEFORE_RENDER, this.animationFrameRequester);
      view.notifyChange(camera);
      return def;
    }
  }, {
    key: "stop",
    value: function stop(view) {
      this.removePlaceTargetOnGround(view);
      this.removeAll();
    } // update target position to coordinate's altitude

  }, {
    key: "addPlaceTargetOnGround",
    value: function addPlaceTargetOnGround(view, camera, coord) {
      var _this6 = this;

      var options = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {
        t: 1.0
      };
      this.removePlaceTargetOnGround(view);

      if (view && camera) {
        var startAltitude = this.target.position.z;

        this.placeTargetOnGround = function () {
          var altitude = Math.max(0, _DEMUtils["default"].getElevationValueAt(tileLayer(view), coord || _this6.coord, _DEMUtils["default"].PRECISE_READ_Z) || 0);
          _this6.target.position.z = startAltitude * (1.0 - options.t) + altitude * options.t;

          _this6.target.updateMatrixWorld(true);

          _this6.applyTransformToCamera(view, camera);
        };

        this.placeTargetOnGround();
        view.addFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.BEFORE_RENDER, this.placeTargetOnGround);
      }
    }
  }, {
    key: "removePlaceTargetOnGround",
    value: function removePlaceTargetOnGround(view) {
      if (view && this.placeTargetOnGround) {
        view.removeFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.BEFORE_RENDER, this.placeTargetOnGround);
        this.placeTargetOnGround = null;
      }
    }
  }, {
    key: "tilt",
    get: function get() {
      return THREE.MathUtils.radToDeg(this.target.rotation.x);
    }
  }, {
    key: "heading",
    get: function get() {
      return -wrapTo180(THREE.MathUtils.radToDeg(this.target.rotation.z) + 180);
    }
  }, {
    key: "range",
    get: function get() {
      return this.camera.position.y;
    }
  }]);
  return CameraRig;
}(THREE.Object3D);

function getRig(camera) {
  rigs[camera.uuid] = rigs[camera.uuid] || new CameraRig(camera);
  return rigs[camera.uuid];
}
/**
 * @module CameraUtils
 */


var _default = {
  /**
   * @typedef {Object} CameraTransformOptions
   * @property {Coordinate} [coord=currentCoordinate] Camera look at geographic coordinate
   * @property {Number} [tilt=currentTilt] camera's tilt, in degree
   * @property {Number} [heading=currentHeading] camera's heading, in degree
   * @property {Number} [range=currentRange] camera distance to target coordinate, in meter
   * @property {Number} [time=2500] duration of the animation, in ms
   * @property {boolean} [proxy=true] use proxy to handling camera's transformation. if proxy == true, other camera's transformation stops rig's transformation
   * @property {Number} [easing=TWEEN.Easing.Quartic.InOut] in and out easing animation
   * @property {function} [callback] callback call each animation's frame (params are current cameraTransform and worldTargetPosition)
   * @property {boolean} [stopPlaceOnGroundAtEnd=defaultStopPlaceOnGroundAtEnd] stop place target on the ground at animation ending
   */

  /**
   * Default value for option to stop place target
   * on the ground at animation ending.
   * Default value is false.
   */
  defaultStopPlaceOnGroundAtEnd: false,
  Easing: _tween["default"].Easing,

  /**
   * Stop camera's animation
   *
   * @param      {View}  view    The camera view
   * @param      {Camera}  camera  The camera to stop animation
   */
  stop: function stop(view, camera) {
    getRig(camera).stop(view);
  },

  /**
   * Gets the current parameters transform camera looking at target.
   *
   * @param      {View}  view    The camera view
   * @param      {Camera}  camera  The camera to get transform
   * @param      {THREE.Vector3} [target] - The optional target
   * @return     {CameraUtils~CameraTransformOptions}  The transform camera looking at target
   */
  getTransformCameraLookingAtTarget: function getTransformCameraLookingAtTarget(view, camera, target) {
    var rig = getRig(camera);
    rig.setfromCamera(view, camera, target);
    return rig.getParams();
  },

  /**
   * Apply transform to camera
   *
   * @param      {View}  view    The camera view
   * @param      {Camera}  camera  The camera to transform
   * @param      {CameraUtils~CameraTransformOptions|Extent}  params  The parameters
   * @return     {Promise} promise with resolve final CameraUtils~CameraTransformOptions
   */
  transformCameraToLookAtTarget: function transformCameraToLookAtTarget(view, camera) {
    var params = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};

    if (params.isExtent) {
      params = this.getCameraTransformOptionsFromExtent(view, camera, params);
    }

    params.proxy = params.proxy === undefined || params.proxy;
    var rig = getRig(camera);
    rig.stop(view);
    rig.setfromCamera(view, camera);

    if (params.proxy) {
      rig.setProxy(view, camera);
    }

    rig.applyParams(view, params);
    rig.addPlaceTargetOnGround(view, camera, params.coord);
    rig.applyTransformToCamera(view, camera);
    view.notifyChange(camera);
    return Promise.resolve(rig.getParams());
  },

  /**
   * Compute the CameraTransformOptions that allow a given camera to display a given extent in its entirety.
   *
   * @param   {View}    view    The camera view
   * @param   {Camera}  camera  The camera to get the CameraTransformOptions from
   * @param   {Extent}  extent  The extent the camera must display
   *
   * @return  {CameraUtils~CameraTransformOptions}   The CameraTransformOptions allowing camera to display the extent.
   */
  getCameraTransformOptionsFromExtent: function getCameraTransformOptionsFromExtent(view, camera, extent) {
    var cameraTransformOptions = {
      coord: new _Coordinates["default"](extent.crs, 0, 0, 0),
      heading: 0,
      tilt: view.isPlanarView ? 90 : 89.9
    };
    var dimensions;

    if (view.isGlobeView) {
      extent = extent.as('EPSG:4326'); // compute extent's bounding box dimensions

      obb.setFromExtent(extent); // /!\ WARNING x and y are inverted, see issue #XXXX

      obb.box3D.getSize(size);
      dimensions = {
        x: size.y,
        y: size.x
      };
    } else {
      extent = extent.as(view.referenceCrs);
      dimensions = extent.dimensions();
    }

    extent.center(cameraTransformOptions.coord);

    if (camera.isOrthographicCamera) {
      // setup camera zoom
      if (dimensions.x / dimensions.y > camera.aspect) {
        camera.zoom = (camera.right - camera.left) / dimensions.x;
      } else {
        camera.zoom = (camera.top - camera.bottom) / dimensions.y;
      }

      camera.updateProjectionMatrix(); // setup camera placement

      cameraTransformOptions.range = 1000;
    } else if (camera.isPerspectiveCamera) {
      // setup range for camera placement
      var verticalFOV = THREE.Math.degToRad(camera.fov);

      if (dimensions.x / dimensions.y > camera.aspect) {
        var focal = view.domElement.clientHeight * 0.5 / Math.tan(verticalFOV * 0.5);
        var horizontalFOV = 2 * Math.atan(view.domElement.clientWidth * 0.5 / focal);
        cameraTransformOptions.range = dimensions.x / (2 * Math.tan(horizontalFOV * 0.5));
      } else {
        cameraTransformOptions.range = dimensions.y / (2 * Math.tan(verticalFOV * 0.5));
      }
    }

    return cameraTransformOptions;
  },

  /**
   * Apply transform to camera with animation
   *
   * @param      {View}  view    The camera view
   * @param      {Camera}  camera  The camera to animate
   * @param      {CameraUtils~CameraTransformOptions}  params  The parameters
   * @return     {Promise} promise with resolve final CameraUtils~CameraTransformOptions
   */
  animateCameraToLookAtTarget: function animateCameraToLookAtTarget(view, camera) {
    var _this7 = this;

    var params = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    params.proxy = params.proxy === undefined || params.proxy;
    var rig = getRig(camera);
    rig.stop(view);

    if (params.proxy) {
      rig.setProxy(view, camera);
    }

    return rig.animateCameraToLookAtTarget(view, camera, params).promise.then(function (finished) {
      var params = rig.getParams();
      var stopPlaceOnGround = params.stopPlaceOnGroundAtEnd === undefined ? _this7.defaultStopPlaceOnGroundAtEnd : params.stopPlaceOnGroundAtEnd;

      if (stopPlaceOnGround) {
        rig.stop(view);
      }

      params.finished = finished;
      return params;
    });
  },

  /**
   * chain animation transform to camera
   *
   * @param      {View}  view    The camera view
   * @param      {Camera}  camera  The camera to animate
   * @param      {CameraUtils~CameraTransformOptions[]}  params  array parameters, each parameters transforms are apply to camera, in serial
   * @return     {Promise} promise with resolve final CameraUtils~CameraTransformOptions
   */
  sequenceAnimationsToLookAtTarget: function sequenceAnimationsToLookAtTarget(view, camera) {
    var _this8 = this;

    var params = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : [{}];
    // convert each param to a function
    var funcs = params.map(function (param) {
      return function () {
        return _this8.animateCameraToLookAtTarget(view, camera, param);
      };
    }); // execute Promises in serial

    return function promiseSerial(funcs) {
      return funcs.reduce(function (promise, func) {
        return promise.then(function (result) {
          var finished = result.length ? result[result.length - 1].finished : true;

          if (finished) {
            return func().then(Array.prototype.concat.bind(result));
          } else {
            return Promise.resolve([{
              finished: false
            }]);
          }
        });
      }, Promise.resolve([]));
    }(funcs);
  },

  /**
   * Gets the difference camera transformation
   *
   * @param      {CameraUtils~CameraTransformOptions}  first  param to compare with the second
   * @param      {CameraUtils~CameraTransformOptions}  second param to compare with the first
   * @return     {object} The difference parameters
   */
  getDiffParams: function getDiffParams(first, second) {
    if (!first || !second) {
      return;
    }

    var diff;

    if (Math.abs(first.range - second.range) / first.range > 0.001) {
      diff = diff || {};
      diff.range = {
        previous: first.range,
        "new": second.range
      };
    }

    if (Math.abs(first.tilt - second.tilt) > 0.1) {
      diff = diff || {};
      diff.tilt = {
        previous: first.tilt,
        "new": second.tilt
      };
    }

    if (Math.abs(first.heading - second.heading) > 0.1) {
      diff = diff || {};
      diff.heading = {
        previous: first.heading,
        "new": second.heading
      };
    }

    if (Math.abs(first.coord.x - second.coord.x) > 0.000001 || Math.abs(first.coord.y - second.coord.y) > 0.000001) {
      diff = diff || {};
      diff.coord = {
        previous: first.coord,
        "new": second.coord
      };
    }

    return diff;
  }
};
exports["default"] = _default;