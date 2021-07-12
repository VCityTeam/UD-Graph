"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.CONTROL_EVENTS = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _AnimationPlayer = _interopRequireDefault(require("../Core/AnimationPlayer"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _Ellipsoid = require("../Core/Math/Ellipsoid");

var _CameraUtils = _interopRequireDefault(require("../Utils/CameraUtils"));

var _StateControl = _interopRequireDefault(require("./StateControl"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

// private members
var EPS = 0.000001; // Orbit

var rotateStart = new THREE.Vector2();
var rotateEnd = new THREE.Vector2();
var rotateDelta = new THREE.Vector2();
var spherical = new THREE.Spherical(1.0, 0.01, 0);
var sphericalDelta = new THREE.Spherical(1.0, 0, 0);
var orbitScale = 1.0; // Pan

var panStart = new THREE.Vector2();
var panEnd = new THREE.Vector2();
var panDelta = new THREE.Vector2();
var panOffset = new THREE.Vector3(); // Dolly

var dollyStart = new THREE.Vector2();
var dollyEnd = new THREE.Vector2();
var dollyDelta = new THREE.Vector2();
var dollyScale; // Globe move

var moveAroundGlobe = new THREE.Quaternion();
var cameraTarget = new THREE.Object3D();
cameraTarget.matrixWorldInverse = new THREE.Matrix4();
var xyz = new _Coordinates["default"]('EPSG:4978', 0, 0, 0);
var c = new _Coordinates["default"]('EPSG:4326', 0, 0, 0); // Position object on globe

function positionObject(newPosition, object) {
  xyz.setFromVector3(newPosition).as('EPSG:4326', c);
  object.position.copy(newPosition);
  object.lookAt(c.geodesicNormal.add(newPosition));
  object.rotateX(Math.PI * 0.5);
  object.updateMatrixWorld(true);
} // Save the last time of mouse move for damping


var lastTimeMouseMove = 0; // Animations and damping

var enableAnimation = true;
var dampingFactorDefault = 0.25;
var dampingMove = new THREE.Quaternion(0, 0, 0, 1);
var durationDampingMove = 120;
var durationDampingOrbital = 60; // Pan Move

var panVector = new THREE.Vector3(); // Save last transformation

var lastPosition = new THREE.Vector3();
var lastQuaternion = new THREE.Quaternion(); // Tangent sphere to ellipsoid

var pickSphere = new THREE.Sphere();
var pickingPoint = new THREE.Vector3(); // Sphere intersection

var intersection = new THREE.Vector3(); // Set to true to enable target helper

var enableTargetHelper = false;
var helpers = {};
// current downed key
var currentKey;
/**
 * Globe control pan event. Fires after camera pan
 * @event GlobeControls#pan-changed
 * @property target {GlobeControls} dispatched on controls
 * @property type {string} orientation-changed
 */

/**
 * Globe control orientation event. Fires when camera's orientation change
 * @event GlobeControls#orientation-changed
 * @property new {object}
 * @property new.tilt {number} the new value of the tilt of the camera
 * @property new.heading {number} the new value of the heading of the camera
 * @property previous {object}
 * @property previous.tilt {number} the previous value of the tilt of the camera
 * @property previous.heading {number} the previous value of the heading of the camera
 * @property target {GlobeControls} dispatched on controls
 * @property type {string} orientation-changed
 */

/**
 * Globe control range event. Fires when camera's range to target change
 * @event GlobeControls#range-changed
 * @property new {number} the new value of the range
 * @property previous {number} the previous value of the range
 * @property target {GlobeControls} dispatched on controls
 * @property type {string} range-changed
 */

/**
 * Globe control camera's target event. Fires when camera's target change
 * @event GlobeControls#camera-target-changed
 * @property new {object}
 * @property new {Coordinates} the new camera's target coordinates
 * @property previous {Coordinates} the previous camera's target coordinates
 * @property target {GlobeControls} dispatched on controls
 * @property type {string} camera-target-changed
 */

/**
 * globe controls events
 * @property PAN_CHANGED {string} Fires after camera pan
 * @property ORIENTATION_CHANGED {string} Fires when camera's orientation change
 * @property RANGE_CHANGED {string} Fires when camera's range to target change
 * @property CAMERA_TARGET_CHANGED {string} Fires when camera's target change
 */

var CONTROL_EVENTS = {
  PAN_CHANGED: 'pan-changed',
  ORIENTATION_CHANGED: 'orientation-changed',
  RANGE_CHANGED: 'range-changed',
  CAMERA_TARGET_CHANGED: 'camera-target-changed'
};
exports.CONTROL_EVENTS = CONTROL_EVENTS;
var quaterPano = new THREE.Quaternion();
var quaterAxis = new THREE.Quaternion();
var axisX = new THREE.Vector3(1, 0, 0);
var minDistanceZ = Infinity;
var lastNormalizedIntersection = new THREE.Vector3();
var normalizedIntersection = new THREE.Vector3();
var raycaster = new THREE.Raycaster();
var targetPosition = new THREE.Vector3();
var pickedPosition = new THREE.Vector3();
var sphereCamera = new THREE.Sphere();
var previous;
/**
 * GlobeControls is a camera controller
 *
 * @class      GlobeControls
 * @param      {GlobeView}  view the view where the control will be used
 * @param      {CameraTransformOptions|Extent} placement   the {@link CameraTransformOptions} to apply to view's camera
 * or the extent it must display at initialisation, see {@link CameraTransformOptions} in {@link CameraUtils}.
 * @param      {object}  options
 * @param      {number}  [options.zoomFactor=2] The factor the scale is multiplied by when dollying (zooming) in or
 * divided by when dollying out.
 * @param      {number}  options.rotateSpeed Speed camera rotation in orbit and panoramic mode
 * @param      {number}  options.minDistance Minimum distance between ground and camera
 * @param      {number}  options.maxDistance Maximum distance between ground and camera
 * @param      {bool}  options.handleCollision enable collision camera with ground
 * @property   {bool} enabled enable control
 * @property   {number} minDistance Minimum distance between ground and camera
 * @property   {number} maxDistance Maximum distance between ground and camera
 * @property   {number} zoomSpeed Speed zoom with mouse
 * @property   {number} rotateSpeed Speed camera rotation in orbit and panoramic mode
 * @property   {number} minDistanceCollision Minimum distance collision between ground and camera
 * @property   {bool} enableDamping enable camera damping, if it's disabled the camera immediately when the mouse button is released.
 * If it's enabled, the camera movement is decelerate.
 */

var GlobeControls = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(GlobeControls, _THREE$EventDispatche);

  var _super = _createSuper(GlobeControls);

  function GlobeControls(view, placement) {
    var _this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    (0, _classCallCheck2["default"])(this, GlobeControls);
    _this = _super.call(this);
    _this.player = new _AnimationPlayer["default"]();
    _this.view = view;
    _this.camera = view.camera.camera3D; // State control

    _this.states = new _StateControl["default"]();
    _this.state = _this.states.NONE; // Set to false to disable this control

    _this.enabled = true; // These options actually enables dollying in and out; left as "zoom" for
    // backwards compatibility

    if (options.zoomSpeed) {
      console.warn('Controls zoomSpeed parameter is deprecated. Use zoomInFactor and zoomOutFactor instead.');
      options.zoomFactor = options.zoomFactor || options.zoomSpeed;
    }

    _this.zoomFactor = options.zoomFactor || 1.25; // Limits to how far you can dolly in and out ( PerspectiveCamera only )

    _this.minDistance = options.minDistance || 250;
    _this.maxDistance = options.maxDistance || _Ellipsoid.ellipsoidSizes.x * 8.0; // Limits to how far you can zoom in and out ( OrthographicCamera only )

    _this.minZoom = 0;
    _this.maxZoom = Infinity; // Set to true to disable this control

    _this.rotateSpeed = options.rotateSpeed || 0.25; // Set to true to disable this control

    _this.keyPanSpeed = 7.0; // pixels moved per arrow key push
    // How far you can orbit vertically, upper and lower limits.
    // Range is 0 to Math.PI radians.
    // TODO Warning minPolarAngle = 0.01 -> it isn't possible to be perpendicular on Globe

    _this.minPolarAngle = THREE.MathUtils.degToRad(0.5); // radians

    _this.maxPolarAngle = THREE.MathUtils.degToRad(86); // radians
    // How far you can orbit horizontally, upper and lower limits.
    // If set, must be a sub-interval of the interval [ - Math.PI, Math.PI ].

    _this.minAzimuthAngle = -Infinity; // radians

    _this.maxAzimuthAngle = Infinity; // radians
    // Set collision options

    _this.handleCollision = typeof options.handleCollision !== 'undefined' ? options.handleCollision : true;
    _this.minDistanceCollision = 60; // Set to true to disable use of the keys

    _this.enableKeys = true; // Enable Damping

    _this.enableDamping = true;
    _this.dampingMoveFactor = options.dampingMoveFactor != undefined ? options.dampingMoveFactor : dampingFactorDefault;
    _this.startEvent = {
      type: 'start'
    };
    _this.endEvent = {
      type: 'end'
    }; // Update helper

    _this.updateHelper = enableTargetHelper ? function (position, helper) {
      positionObject(position, helper);
      view.notifyChange(_this.camera);
    } : function () {};
    _this._onEndingMove = null;
    _this._onMouseMove = _this.onMouseMove.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onMouseUp = _this.onMouseUp.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onMouseDown = _this.onMouseDown.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onMouseWheel = _this.onMouseWheel.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onContextMenuListener = _this.onContextMenuListener.bind((0, _assertThisInitialized2["default"])(_this));
    _this._ondblclick = _this.ondblclick.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onTouchStart = _this.onTouchStart.bind((0, _assertThisInitialized2["default"])(_this));
    _this._update = _this.update.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onTouchMove = _this.onTouchMove.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onKeyDown = _this.onKeyDown.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onKeyUp = _this.onKeyUp.bind((0, _assertThisInitialized2["default"])(_this));
    _this._onBlurListener = _this.onBlurListener.bind((0, _assertThisInitialized2["default"])(_this));

    _this.view.domElement.addEventListener('contextmenu', _this._onContextMenuListener, false);

    _this.view.domElement.addEventListener('mousedown', _this._onMouseDown, false);

    _this.view.domElement.addEventListener('mousewheel', _this._onMouseWheel, false);

    _this.view.domElement.addEventListener('dblclick', _this._ondblclick, false);

    _this.view.domElement.addEventListener('DOMMouseScroll', _this._onMouseWheel, false); // firefox


    _this.view.domElement.addEventListener('touchstart', _this._onTouchStart, false);

    _this.view.domElement.addEventListener('touchend', _this._onMouseUp, false);

    _this.view.domElement.addEventListener('touchmove', _this._onTouchMove, false); // refresh control for each animation's frame


    _this.player.addEventListener('animation-frame', _this._update); // TODO: Why windows


    window.addEventListener('keydown', _this._onKeyDown, false);
    window.addEventListener('keyup', _this._onKeyUp, false); // Reset key/mouse when window loose focus

    window.addEventListener('blur', _this._onBlurListener);
    view.scene.add(cameraTarget);

    if (enableTargetHelper) {
      cameraTarget.add(helpers.target);
      view.scene.add(helpers.picking);
      var layerTHREEjs = view.mainLoop.gfxEngine.getUniqueThreejsLayer();
      helpers.target.layers.set(layerTHREEjs);
      helpers.picking.layers.set(layerTHREEjs);

      _this.camera.layers.enable(layerTHREEjs);
    }

    if (placement.isExtent) {
      placement.center().as('EPSG:4978', xyz);
    } else {
      placement.coord.as('EPSG:4978', xyz);
      placement.tilt = placement.tilt || 89.5;
      placement.heading = placement.heading || 0;
    }

    positionObject(xyz, cameraTarget);

    _this.lookAtCoordinate(placement, false);

    return _this;
  }

  (0, _createClass2["default"])(GlobeControls, [{
    key: "dollyInScale",
    get: function get() {
      return this.zoomFactor;
    }
  }, {
    key: "dollyOutScale",
    get: function get() {
      return 1 / this.zoomFactor;
    }
  }, {
    key: "isPaused",
    get: function get() {
      return this.state == this.states.NONE;
    }
  }, {
    key: "onEndingMove",
    value: function onEndingMove(current) {
      if (this._onEndingMove) {
        this.player.removeEventListener('animation-stopped', this._onEndingMove);
        this._onEndingMove = null;
      }

      this.state = this.states.NONE;
      this.handlingEvent(current);
    }
  }, {
    key: "rotateLeft",
    value: function rotateLeft() {
      var angle = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
      sphericalDelta.theta -= angle;
    }
  }, {
    key: "rotateUp",
    value: function rotateUp() {
      var angle = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
      sphericalDelta.phi -= angle;
    } // pass in distance in world space to move left

  }, {
    key: "panLeft",
    value: function panLeft(distance) {
      var te = this.camera.matrix.elements; // get X column of matrix

      panOffset.fromArray(te);
      panOffset.multiplyScalar(-distance);
      panVector.add(panOffset);
    } // pass in distance in world space to move up

  }, {
    key: "panUp",
    value: function panUp(distance) {
      var te = this.camera.matrix.elements; // get Y column of matrix

      panOffset.fromArray(te, 4);
      panOffset.multiplyScalar(distance);
      panVector.add(panOffset);
    } // pass in x,y of change desired in pixel space,
    // right and down are positive

  }, {
    key: "mouseToPan",
    value: function mouseToPan(deltaX, deltaY) {
      var gfx = this.view.mainLoop.gfxEngine;
      this.state = this.states.PAN;

      if (this.camera.isPerspectiveCamera) {
        var targetDistance = this.camera.position.distanceTo(this.getCameraTargetPosition()); // half of the fov is center to top of screen

        targetDistance *= 2 * Math.tan(THREE.MathUtils.degToRad(this.camera.fov * 0.5)); // we actually don't use screenWidth, since perspective camera is fixed to screen height

        this.panLeft(deltaX * targetDistance / gfx.width * this.camera.aspect);
        this.panUp(deltaY * targetDistance / gfx.height);
      } else if (this.camera.isOrthographicCamera) {
        // orthographic
        this.panLeft(deltaX * (this.camera.right - this.camera.left) / gfx.width);
        this.panUp(deltaY * (this.camera.top - this.camera.bottom) / gfx.height);
      }
    }
  }, {
    key: "dolly",
    value: function dolly(delta) {
      if (delta === 0) {
        return;
      }

      dollyScale = delta > 0 ? this.dollyInScale : this.dollyOutScale;

      if (this.camera.isPerspectiveCamera) {
        orbitScale /= dollyScale;
      } else if (this.camera.isOrthographicCamera) {
        this.camera.zoom = THREE.MathUtils.clamp(this.camera.zoom * dollyScale, this.minZoom, this.maxZoom);
        this.camera.updateProjectionMatrix();
        this.view.notifyChange(this.camera);
      }
    }
  }, {
    key: "getMinDistanceCameraBoundingSphereObbsUp",
    value: function getMinDistanceCameraBoundingSphereObbsUp(tile) {
      if (tile.level > 10 && tile.children.length == 1 && tile.geometry) {
        var obb = tile.obb;
        sphereCamera.center.copy(this.camera.position);
        sphereCamera.radius = this.minDistanceCollision;

        if (obb.isSphereAboveXYBox(sphereCamera)) {
          minDistanceZ = Math.min(sphereCamera.center.z - obb.box3D.max.z, minDistanceZ);
        }
      }
    }
  }, {
    key: "update",
    value: function update() {
      // We compute distance between camera's bounding sphere and geometry's obb up face
      minDistanceZ = Infinity;

      if (this.handleCollision) {
        // We check distance to the ground/surface geometry
        // add minDistanceZ between camera's bounding and tiles's oriented bounding box (up face only)
        // Depending on the distance of the camera with obbs, we add a slowdown or constrain to the movement.
        // this constraint or deceleration is suitable for two types of movement MOVE_GLOBE and ORBIT.
        // This constraint or deceleration inversely proportional to the camera/obb distance
        if (this.view.tileLayer) {
          var _iterator = _createForOfIteratorHelper(this.view.tileLayer.level0Nodes),
              _step;

          try {
            for (_iterator.s(); !(_step = _iterator.n()).done;) {
              var tile = _step.value;
              tile.traverse(this.getMinDistanceCameraBoundingSphereObbsUp.bind(this));
            }
          } catch (err) {
            _iterator.e(err);
          } finally {
            _iterator.f();
          }
        }
      }

      switch (this.state) {
        // MOVE_GLOBE Rotate globe with mouse
        case this.states.MOVE_GLOBE:
          if (minDistanceZ < 0) {
            cameraTarget.translateY(-minDistanceZ);
            this.camera.position.setLength(this.camera.position.length() - minDistanceZ);
          } else if (minDistanceZ < this.minDistanceCollision) {
            var translate = this.minDistanceCollision * (1.0 - minDistanceZ / this.minDistanceCollision);
            cameraTarget.translateY(translate);
            this.camera.position.setLength(this.camera.position.length() + translate);
          }

          lastNormalizedIntersection.copy(normalizedIntersection).applyQuaternion(moveAroundGlobe);
          cameraTarget.position.applyQuaternion(moveAroundGlobe);
          this.camera.position.applyQuaternion(moveAroundGlobe);
          break;
        // PAN Move camera in projection plan

        case this.states.PAN:
          this.camera.position.add(panVector);
          cameraTarget.position.add(panVector);
          break;
        // PANORAMIC Move target camera

        case this.states.PANORAMIC:
          {
            this.camera.worldToLocal(cameraTarget.position);
            var normal = this.camera.position.clone().normalize().applyQuaternion(this.camera.quaternion.clone().invert());
            quaterPano.setFromAxisAngle(normal, sphericalDelta.theta).multiply(quaterAxis.setFromAxisAngle(axisX, sphericalDelta.phi));
            cameraTarget.position.applyQuaternion(quaterPano);
            this.camera.localToWorld(cameraTarget.position);
            break;
          }
        // ZOOM/ORBIT Move Camera around the target camera

        default:
          {
            // get camera position in local space of target
            this.camera.position.applyMatrix4(cameraTarget.matrixWorldInverse); // angle from z-axis around y-axis

            if (sphericalDelta.theta || sphericalDelta.phi) {
              spherical.setFromVector3(this.camera.position);
            } // far underground


            var dynamicRadius = spherical.radius * Math.sin(this.minPolarAngle);
            var slowdownLimit = dynamicRadius * 8;
            var contraryLimit = dynamicRadius * 2;
            var minContraintPhi = -0.01;

            if (this.handleCollision) {
              if (minDistanceZ < slowdownLimit && minDistanceZ > contraryLimit && sphericalDelta.phi > 0) {
                // slowdown zone : slowdown sphericalDelta.phi
                var slowdownZone = slowdownLimit - contraryLimit; // the deeper the camera is in this zone, the bigger the factor is

                var slowdownFactor = 1 - (slowdownZone - (minDistanceZ - contraryLimit)) / slowdownZone; // apply slowdown factor on tilt mouvement

                sphericalDelta.phi *= slowdownFactor * slowdownFactor;
              } else if (minDistanceZ < contraryLimit && minDistanceZ > -contraryLimit && sphericalDelta.phi > minContraintPhi) {
                // contraint zone : contraint sphericalDelta.phi
                // calculation of the angle of rotation which allows to leave this zone
                var contraryPhi = -Math.asin((contraryLimit - minDistanceZ) * 0.25 / spherical.radius); // clamp contraryPhi to make a less brutal exit

                contraryPhi = THREE.MathUtils.clamp(contraryPhi, minContraintPhi, 0); // the deeper the camera is in this zone, the bigger the factor is

                var contraryFactor = 1 - (contraryLimit - minDistanceZ) / (2 * contraryLimit);
                sphericalDelta.phi = THREE.MathUtils.lerp(sphericalDelta.phi, contraryPhi, contraryFactor);
                minDistanceZ -= Math.sin(sphericalDelta.phi) * spherical.radius;
              }
            }

            spherical.theta += sphericalDelta.theta;
            spherical.phi += sphericalDelta.phi; // restrict spherical.theta to be between desired limits

            spherical.theta = Math.max(this.minAzimuthAngle, Math.min(this.maxAzimuthAngle, spherical.theta)); // restrict spherical.phi to be between desired limits

            spherical.phi = Math.max(this.minPolarAngle, Math.min(this.maxPolarAngle, spherical.phi));
            spherical.radius = this.camera.position.length() * orbitScale; // restrict spherical.phi to be betwee EPS and PI-EPS

            spherical.makeSafe(); // restrict radius to be between desired limits

            spherical.radius = Math.max(this.minDistance, Math.min(this.maxDistance, spherical.radius));
            this.camera.position.setFromSpherical(spherical); // if camera is underground, so move up camera

            if (minDistanceZ < 0) {
              this.camera.position.y -= minDistanceZ;
              spherical.setFromVector3(this.camera.position);
              sphericalDelta.phi = 0;
            }

            cameraTarget.localToWorld(this.camera.position);
          }
      }

      this.camera.up.copy(cameraTarget.position).normalize();
      this.camera.lookAt(cameraTarget.position);

      if (!this.enableDamping) {
        sphericalDelta.theta = 0;
        sphericalDelta.phi = 0;
        moveAroundGlobe.set(0, 0, 0, 1);
      } else {
        sphericalDelta.theta *= 1 - dampingFactorDefault;
        sphericalDelta.phi *= 1 - dampingFactorDefault;
        moveAroundGlobe.slerp(dampingMove, this.dampingMoveFactor * 0.2);
      }

      orbitScale = 1;
      panVector.set(0, 0, 0); // update condition is:
      // min(camera displacement, camera rotation in radians)^2 > EPS
      // using small-angle approximation cos(x/2) = 1 - x^2 / 8

      if (lastPosition.distanceToSquared(this.camera.position) > EPS || 8 * (1 - lastQuaternion.dot(this.camera.quaternion)) > EPS) {
        this.view.notifyChange(this.camera);
        lastPosition.copy(this.camera.position);
        lastQuaternion.copy(this.camera.quaternion);
      } // Launch animationdamping if mouse stops these movements


      if (this.enableDamping && this.state === this.states.ORBIT && this.player.isStopped() && (sphericalDelta.theta > EPS || sphericalDelta.phi > EPS)) {
        this.player.playLater(durationDampingOrbital, 2);
      }
    }
  }, {
    key: "onMouseMove",
    value: function onMouseMove(event) {
      if (this.player.isPlaying()) {
        this.player.stop();
      }

      if (this.enabled === false) {
        return;
      }

      event.preventDefault();
      var coords = this.view.eventToViewCoords(event);

      switch (this.state) {
        case this.states.ORBIT:
        case this.states.PANORAMIC:
          {
            rotateEnd.copy(coords);
            rotateDelta.subVectors(rotateEnd, rotateStart);
            var gfx = this.view.mainLoop.gfxEngine;
            this.rotateLeft(2 * Math.PI * rotateDelta.x / gfx.width * this.rotateSpeed); // rotating up and down along whole screen attempts to go 360, but limited to 180

            this.rotateUp(2 * Math.PI * rotateDelta.y / gfx.height * this.rotateSpeed);
            rotateStart.copy(rotateEnd);
            break;
          }

        case this.states.DOLLY:
          dollyEnd.copy(coords);
          dollyDelta.subVectors(dollyEnd, dollyStart);
          this.dolly(-dollyDelta.y);
          dollyStart.copy(dollyEnd);
          break;

        case this.states.PAN:
          panEnd.copy(coords);
          panDelta.subVectors(panEnd, panStart);
          this.mouseToPan(panDelta.x, panDelta.y);
          panStart.copy(panEnd);
          break;

        case this.states.MOVE_GLOBE:
          {
            var normalized = this.view.viewToNormalizedCoords(coords);
            raycaster.setFromCamera(normalized, this.camera); // If there's intersection then move globe else we stop the move

            if (raycaster.ray.intersectSphere(pickSphere, intersection)) {
              normalizedIntersection.copy(intersection).normalize();
              moveAroundGlobe.setFromUnitVectors(normalizedIntersection, lastNormalizedIntersection);
              lastTimeMouseMove = Date.now();
            } else {
              this.onMouseUp();
            }

            break;
          }

        default:
      }

      if (this.state !== this.states.NONE) {
        this.update();
      }
    }
  }, {
    key: "updateTarget",
    value: function updateTarget() {
      // Update camera's target position
      this.view.getPickingPositionFromDepth(null, pickedPosition);
      var distance = !isNaN(pickedPosition.x) ? this.camera.position.distanceTo(pickedPosition) : 100;
      targetPosition.set(0, 0, -distance);
      this.camera.localToWorld(targetPosition); // set new camera target on globe

      positionObject(targetPosition, cameraTarget);
      cameraTarget.matrixWorldInverse.copy(cameraTarget.matrixWorld).invert();
      targetPosition.copy(this.camera.position);
      targetPosition.applyMatrix4(cameraTarget.matrixWorldInverse);
      spherical.setFromVector3(targetPosition);
    }
  }, {
    key: "handlingEvent",
    value: function handlingEvent(current) {
      current = current || _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera);

      var diff = _CameraUtils["default"].getDiffParams(previous, current);

      if (diff) {
        if (diff.range) {
          this.dispatchEvent({
            type: CONTROL_EVENTS.RANGE_CHANGED,
            previous: diff.range.previous,
            "new": diff.range["new"]
          });
        }

        if (diff.coord) {
          this.dispatchEvent({
            type: CONTROL_EVENTS.CAMERA_TARGET_CHANGED,
            previous: diff.coord.previous,
            "new": diff.coord["new"]
          });
        }

        if (diff.tilt || diff.heading) {
          var event = {
            type: CONTROL_EVENTS.ORIENTATION_CHANGED
          };

          if (diff.tilt) {
            event.previous = {
              tilt: diff.tilt.previous
            };
            event["new"] = {
              tilt: diff.tilt["new"]
            };
          }

          if (diff.heading) {
            event.previous = event.previous || {};
            event["new"] = event["new"] || {};
            event["new"].heading = diff.heading["new"];
            event.previous.heading = diff.heading.previous;
          }

          this.dispatchEvent(event);
        }
      }
    }
  }, {
    key: "onMouseDown",
    value: function onMouseDown(event) {
      _CameraUtils["default"].stop(this.view, this.camera);

      this.player.stop();
      this.onEndingMove();

      if (this.enabled === false) {
        return;
      }

      this.updateTarget();
      previous = _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera, pickedPosition);
      this.state = this.states.inputToState(event.button, currentKey);
      var coords = this.view.eventToViewCoords(event);

      switch (this.state) {
        case this.states.ORBIT:
        case this.states.PANORAMIC:
          rotateStart.copy(coords);
          break;

        case this.states.MOVE_GLOBE:
          {
            // update picking on sphere
            if (this.view.getPickingPositionFromDepth(coords, pickingPoint)) {
              pickSphere.radius = pickingPoint.length();
              lastNormalizedIntersection.copy(pickingPoint).normalize();
              this.updateHelper(pickingPoint, helpers.picking);
            } else {
              this.state = this.states.NONE;
            }

            break;
          }

        case this.states.DOLLY:
          dollyStart.copy(coords);
          break;

        case this.states.PAN:
          panStart.copy(coords);
          break;

        default:
      }

      if (this.state != this.states.NONE) {
        this.view.domElement.addEventListener('mousemove', this._onMouseMove, false);
        this.view.domElement.addEventListener('mouseup', this._onMouseUp, false);
        this.view.domElement.addEventListener('mouseleave', this._onMouseUp, false);
        this.dispatchEvent(this.startEvent);
      }
    }
  }, {
    key: "ondblclick",
    value: function ondblclick(event) {
      if (this.enabled === false || currentKey) {
        return;
      }

      this.player.stop();
      var point = this.view.getPickingPositionFromDepth(this.view.eventToViewCoords(event));
      var range = this.getRange(point);

      if (point && range > this.minDistance) {
        return this.lookAtCoordinate({
          coord: new _Coordinates["default"]('EPSG:4978', point),
          range: range * 0.6,
          time: 1500
        });
      }
    }
  }, {
    key: "onMouseUp",
    value: function onMouseUp() {
      var _this2 = this;

      if (this.enabled === false) {
        return;
      }

      this.view.domElement.removeEventListener('mousemove', this._onMouseMove, false);
      this.view.domElement.removeEventListener('mouseup', this._onMouseUp, false);
      this.view.domElement.removeEventListener('mouseleave', this._onMouseUp, false);
      this.dispatchEvent(this.endEvent);
      this.player.stop(); // Launch damping movement for :
      //      * this.states.ORBIT
      //      * this.states.MOVE_GLOBE

      if (this.enableDamping) {
        if (this.state === this.states.ORBIT && (sphericalDelta.theta > EPS || sphericalDelta.phi > EPS)) {
          this.player.play(durationDampingOrbital);

          this._onEndingMove = function () {
            return _this2.onEndingMove();
          };

          this.player.addEventListener('animation-stopped', this._onEndingMove);
        } else if (this.state === this.states.MOVE_GLOBE && Date.now() - lastTimeMouseMove < 50) {
          // animation since mouse up event occurs less than 50ms after the last mouse move
          this.player.play(durationDampingMove);

          this._onEndingMove = function () {
            return _this2.onEndingMove();
          };

          this.player.addEventListener('animation-stopped', this._onEndingMove);
        } else {
          this.onEndingMove();
        }
      } else {
        this.onEndingMove();
      }
    }
  }, {
    key: "onMouseWheel",
    value: function onMouseWheel(event) {
      this.player.stop();

      if (!this.enabled || !this.states.DOLLY.enable) {
        return;
      }

      _CameraUtils["default"].stop(this.view, this.camera);

      event.preventDefault();
      this.updateTarget();
      var delta = 0; // WebKit / Opera / Explorer 9

      if (event.wheelDelta !== undefined) {
        delta = event.wheelDelta; // Firefox
      } else if (event.detail !== undefined) {
        delta = -event.detail;
      }

      this.dolly(delta);
      var previousRange = this.getRange(pickedPosition);
      this.update();
      var newRange = this.getRange(pickedPosition);

      if (Math.abs(newRange - previousRange) / previousRange > 0.001) {
        this.dispatchEvent({
          type: CONTROL_EVENTS.RANGE_CHANGED,
          previous: previousRange,
          "new": newRange
        });
      }

      this.dispatchEvent(this.startEvent);
      this.dispatchEvent(this.endEvent);
    }
  }, {
    key: "onKeyUp",
    value: function onKeyUp() {
      if (this.enabled === false || this.enableKeys === false) {
        return;
      }

      currentKey = undefined;
    }
  }, {
    key: "onKeyDown",
    value: function onKeyDown(event) {
      this.player.stop();

      if (this.enabled === false || this.enableKeys === false) {
        return;
      }

      currentKey = event.keyCode;

      switch (event.keyCode) {
        case this.states.PAN.up:
          this.mouseToPan(0, this.keyPanSpeed);
          this.state = this.states.PAN;
          this.update();
          break;

        case this.states.PAN.bottom:
          this.mouseToPan(0, -this.keyPanSpeed);
          this.state = this.states.PAN;
          this.update();
          break;

        case this.states.PAN.left:
          this.mouseToPan(this.keyPanSpeed, 0);
          this.state = this.states.PAN;
          this.update();
          break;

        case this.states.PAN.right:
          this.mouseToPan(-this.keyPanSpeed, 0);
          this.state = this.states.PAN;
          this.update();
          break;

        default:
      }
    }
  }, {
    key: "onTouchStart",
    value: function onTouchStart(event) {
      // CameraUtils.stop(view);
      this.player.stop();

      if (this.enabled === false) {
        return;
      }

      this.state = this.states.touchToState(event.touches.length);
      this.updateTarget();

      if (this.state !== this.states.NONE) {
        switch (this.state) {
          case this.states.MOVE_GLOBE:
            {
              var coords = this.view.eventToViewCoords(event);

              if (this.view.getPickingPositionFromDepth(coords, pickingPoint)) {
                pickSphere.radius = pickingPoint.length();
                lastNormalizedIntersection.copy(pickingPoint).normalize();
                this.updateHelper(pickingPoint, helpers.picking);
              } else {
                this.state = this.states.NONE;
              }

              break;
            }

          case this.states.ORBIT:
          case this.states.DOLLY:
            {
              var x = event.touches[0].pageX;
              var y = event.touches[0].pageY;
              var dx = x - event.touches[1].pageX;
              var dy = y - event.touches[1].pageY;
              var distance = Math.sqrt(dx * dx + dy * dy);
              dollyStart.set(0, distance);
              rotateStart.set(x, y);
              break;
            }

          case this.states.PAN:
            panStart.set(event.touches[0].pageX, event.touches[0].pageY);
            break;

          default:
        }

        this.dispatchEvent(this.startEvent);
      }
    }
  }, {
    key: "onTouchMove",
    value: function onTouchMove(event) {
      if (this.player.isPlaying()) {
        this.player.stop();
      }

      if (this.enabled === false) {
        return;
      }

      event.preventDefault();
      event.stopPropagation();

      switch (event.touches.length) {
        case this.states.MOVE_GLOBE.finger:
          {
            var coords = this.view.eventToViewCoords(event);
            var normalized = this.view.viewToNormalizedCoords(coords);
            raycaster.setFromCamera(normalized, this.camera); // If there's intersection then move globe else we stop the move

            if (raycaster.ray.intersectSphere(pickSphere, intersection)) {
              normalizedIntersection.copy(intersection).normalize();
              moveAroundGlobe.setFromUnitVectors(normalizedIntersection, lastNormalizedIntersection);
              lastTimeMouseMove = Date.now();
            } else {
              this.onMouseUp.bind(this)();
            }

            break;
          }

        case this.states.ORBIT.finger:
        case this.states.DOLLY.finger:
          {
            var gfx = this.view.mainLoop.gfxEngine;
            rotateEnd.set(event.touches[0].pageX, event.touches[0].pageY);
            rotateDelta.subVectors(rotateEnd, rotateStart); // rotating across whole screen goes 360 degrees around

            this.rotateLeft(2 * Math.PI * rotateDelta.x / gfx.width * this.rotateSpeed); // rotating up and down along whole screen attempts to go 360, but limited to 180

            this.rotateUp(2 * Math.PI * rotateDelta.y / gfx.height * this.rotateSpeed);
            rotateStart.copy(rotateEnd);
            var dx = event.touches[0].pageX - event.touches[1].pageX;
            var dy = event.touches[0].pageY - event.touches[1].pageY;
            var distance = Math.sqrt(dx * dx + dy * dy);
            dollyEnd.set(0, distance);
            dollyDelta.subVectors(dollyEnd, dollyStart);
            this.dolly(dollyDelta.y);
            dollyStart.copy(dollyEnd);
            break;
          }

        case this.states.PAN.finger:
          panEnd.set(event.touches[0].pageX, event.touches[0].pageY);
          panDelta.subVectors(panEnd, panStart);
          this.mouseToPan(panDelta.x, panDelta.y);
          panStart.copy(panEnd);
          break;

        default:
          this.state = this.states.NONE;
      }

      if (this.state !== this.states.NONE) {
        this.update();
      }
    }
  }, {
    key: "onContextMenuListener",
    value: function onContextMenuListener(event) {
      event.preventDefault();
    }
  }, {
    key: "onBlurListener",
    value: function onBlurListener() {
      this.onKeyUp();
      this.onMouseUp();
    }
  }, {
    key: "dispose",
    value: function dispose() {
      this.view.domElement.removeEventListener('contextmenu', this._onContextMenuListener, false);
      this.view.domElement.removeEventListener('mousedown', this._onMouseDown, false);
      this.view.domElement.removeEventListener('mousemove', this._onMouseMove, false);
      this.view.domElement.removeEventListener('mousewheel', this._onMouseWheel, false);
      this.view.domElement.removeEventListener('DOMMouseScroll', this._onMouseWheel, false); // firefox

      this.view.domElement.removeEventListener('mouseup', this._onMouseUp, false);
      this.view.domElement.removeEventListener('mouseleave', this._onMouseUp, false);
      this.view.domElement.removeEventListener('dblclick', this._ondblclick, false);
      this.view.domElement.removeEventListener('touchstart', this._onTouchStart, false);
      this.view.domElement.removeEventListener('touchend', this._onMouseUp, false);
      this.view.domElement.removeEventListener('touchmove', this._onTouchMove, false);
      this.player.removeEventListener('animation-frame', this._onKeyUp);
      window.removeEventListener('keydown', this._onKeyDown, false);
      window.removeEventListener('keyup', this._onKeyUp, false);
      window.removeEventListener('blur', this._onBlurListener);
      this.dispatchEvent({
        type: 'dispose'
      });
    }
    /**
     * Changes the tilt of the current camera, in degrees.
     * @param {number}  tilt
     * @param {boolean} isAnimated
     * @return {Promise<void>}
     */

  }, {
    key: "setTilt",
    value: function setTilt(tilt, isAnimated) {
      return this.lookAtCoordinate({
        tilt: tilt
      }, isAnimated);
    }
    /**
     * Changes the heading of the current camera, in degrees.
     * @param {number} heading
     * @param {boolean} isAnimated
     * @return {Promise<void>}
     */

  }, {
    key: "setHeading",
    value: function setHeading(heading, isAnimated) {
      return this.lookAtCoordinate({
        heading: heading
      }, isAnimated);
    }
    /**
     * Sets the "range": the distance in meters between the camera and the current central point on the screen.
     * @param {number} range
     * @param {boolean} isAnimated
     * @return {Promise<void>}
     */

  }, {
    key: "setRange",
    value: function setRange(range, isAnimated) {
      return this.lookAtCoordinate({
        range: range
      }, isAnimated);
    }
    /**
     * Returns the {@linkcode Coordinates} of the globe point targeted by the camera in EPSG:4978 projection. See {@linkcode Coordinates} for conversion
     * @return {THREE.Vector3} position
     */

  }, {
    key: "getCameraTargetPosition",
    value: function getCameraTargetPosition() {
      return cameraTarget.position;
    }
    /**
     * Returns the "range": the distance in meters between the camera and the current central point on the screen.
     * @param {THREE.Vector3} [position] - The position to consider as picked on
     * the ground.
     * @return {number} number
     */

  }, {
    key: "getRange",
    value: function getRange(position) {
      return _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera, position).range;
    }
    /**
     * Returns the tilt of the current camera in degrees.
     * @param {THREE.Vector3} [position] - The position to consider as picked on
     * the ground.
     * @return {number} The angle of the rotation in degrees.
     */

  }, {
    key: "getTilt",
    value: function getTilt(position) {
      return _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera, position).tilt;
    }
    /**
     * Returns the heading of the current camera in degrees.
     * @param {THREE.Vector3} [position] - The position to consider as picked on
     * the ground.
     * @return {number} The angle of the rotation in degrees.
     */

  }, {
    key: "getHeading",
    value: function getHeading(position) {
      return _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera, position).heading;
    }
    /**
     * Displaces the central point to a specific amount of pixels from its current position.
     * The view flies to the desired coordinate, i.e.is not teleported instantly. Note : The results can be strange in some cases, if ever possible, when e.g.the camera looks horizontally or if the displaced center would not pick the ground once displaced.
     * @param      {vector}  pVector  The vector
     * @return {Promise}
     */

  }, {
    key: "pan",
    value: function pan(pVector) {
      this.mouseToPan(pVector.x, pVector.y);
      this.update();
      return Promise.resolve();
    }
    /**
     * Returns the orientation angles of the current camera, in degrees.
     * @return {Array<number>}
     */

  }, {
    key: "getCameraOrientation",
    value: function getCameraOrientation() {
      this.view.getPickingPositionFromDepth(null, pickedPosition);
      return [this.getTilt(pickedPosition), this.getHeading(pickedPosition)];
    }
    /**
     * Returns the camera location projected on the ground in lat,lon. See {@linkcode Coordinates} for conversion.
     * @return {Coordinates} position
     */

  }, {
    key: "getCameraCoordinate",
    value: function getCameraCoordinate() {
      return new _Coordinates["default"]('EPSG:4978', this.camera.position).as('EPSG:4326');
    }
    /**
     * Returns the {@linkcode Coordinates} of the central point on screen in lat,lon. See {@linkcode Coordinates} for conversion.
     * @return {Coordinates} coordinate
     */

  }, {
    key: "getLookAtCoordinate",
    value: function getLookAtCoordinate() {
      return _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera).coord;
    }
    /**
     * Sets the animation enabled.
     * @param      {boolean}  enable  enable
     */

  }, {
    key: "setAnimationEnabled",
    value: function setAnimationEnabled(enable) {
      enableAnimation = enable;
    }
    /**
     * Determines if animation enabled.
     * @return     {boolean}  True if animation enabled, False otherwise.
     */

  }, {
    key: "isAnimationEnabled",
    value: function isAnimationEnabled() {
      return enableAnimation;
    }
    /**
     * Returns the actual zoom. The zoom will always be between the [getMinZoom(), getMaxZoom()].
     * @return     {number}  The zoom .
     */

  }, {
    key: "getZoom",
    value: function getZoom() {
      return this.view.tileLayer.computeTileZoomFromDistanceCamera(this.getRange(), this.view.camera);
    }
    /**
     * Sets the current zoom, which is an index in the logical scales predefined for the application.
     * The higher the zoom, the closer to the ground.
     * The zoom is always in the [getMinZoom(), getMaxZoom()] range.
     * @param      {number}  zoom    The zoom
     * @param      {boolean}  isAnimated  Indicates if animated
     * @return     {Promise}
     */

  }, {
    key: "setZoom",
    value: function setZoom(zoom, isAnimated) {
      return this.lookAtCoordinate({
        zoom: zoom
      }, isAnimated);
    }
    /**
     * Return the current zoom scale at the central point of the view.
     * This function compute the scale of a map
     * @param      {number}  pitch   Screen pitch, in millimeters ; 0.28 by default
     * @return     {number}  The zoom scale.
     *
     * @deprecated Use View#getScale instead.
     */

  }, {
    key: "getScale",
    value: function getScale(pitch)
    /* istanbul ignore next */
    {
      console.warn('Deprecated, use View#getScale instead.');
      return this.view.getScale(pitch);
    }
    /**
     * To convert the projection in meters on the globe of a number of pixels of screen
     * @param      {number} pixels count pixels to project
     * @param      {number} pixelPitch Screen pixel pitch, in millimeters (default = 0.28 mm / standard pixel size of 0.28 millimeters as defined by the OGC)
     * @return     {number} projection in meters on globe
     *
     * @deprecated Use `View#getPixelsToMeters` instead.
     */

  }, {
    key: "pixelsToMeters",
    value: function pixelsToMeters(pixels)
    /* istanbul ignore next */
    {
      var pixelPitch = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0.28;
      console.warn('Deprecated use View#getPixelsToMeters instead.');
      var scaled = this.getScale(pixelPitch);
      return pixels * pixelPitch / scaled / 1000;
    }
    /**
     * To convert the projection a number of horizontal pixels of screen to longitude degree WGS84 on the globe
     * @param      {number} pixels count pixels to project
     * @param      {number} pixelPitch Screen pixel pitch, in millimeters (default = 0.28 mm / standard pixel size of 0.28 millimeters as defined by the OGC)
     * @return     {number} projection in degree on globe
     *
     * @deprecated Use `View#getPixelsToMeters` and `GlobeControls#metersToDegrees`
     * instead.
     */

  }, {
    key: "pixelsToDegrees",
    value: function pixelsToDegrees(pixels)
    /* istanbul ignore next */
    {
      var pixelPitch = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0.28;
      console.warn('Deprecated, use View#getPixelsToMeters and GlobeControls#getMetersToDegrees instead.');
      var chord = this.pixelsToMeters(pixels, pixelPitch);
      return THREE.MathUtils.radToDeg(2 * Math.asin(chord / (2 * _Ellipsoid.ellipsoidSizes.x)));
    }
    /**
     * Projection on screen in pixels of length in meter on globe
     * @param      {number}  value Length in meter on globe
     * @param      {number}  pixelPitch Screen pixel pitch, in millimeters (default = 0.28 mm / standard pixel size of 0.28 millimeters as defined by the OGC)
     * @return     {number}  projection in pixels on screen
     *
     * @deprecated Use `View#getMetersToPixels` instead.
     */

  }, {
    key: "metersToPixels",
    value: function metersToPixels(value)
    /* istanbul ignore next */
    {
      var pixelPitch = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0.28;
      console.warn('Deprecated, use View#getMetersToPixels instead.');
      var scaled = this.getScale(pixelPitch);
      pixelPitch /= 1000;
      return value * scaled / pixelPitch;
    }
    /**
     * Changes the zoom of the central point of screen so that screen acts as a map with a specified scale.
     *  The view flies to the desired zoom scale;
     * @param      {number}  scale  The scale
     * @param      {number}  pitch  The pitch
     * @param      {boolean}  isAnimated  Indicates if animated
     * @return     {Promise}
     */

  }, {
    key: "setScale",
    value: function setScale(scale, pitch, isAnimated) {
      return this.lookAtCoordinate({
        scale: scale,
        pitch: pitch
      }, isAnimated);
    }
    /**
     * Changes the center of the scene on screen to the specified in lat, lon. See {@linkcode Coordinates} for conversion.
     * This function allows to change the central position, the zoom, the range, the scale and the camera orientation at the same time.
     * The zoom has to be between the [getMinZoom(), getMaxZoom()].
     * Zoom parameter is ignored if range is set
     * The tilt's interval is between 4 and 89.5 degree
     *
     * @param      {CameraUtils~CameraTransformOptions|Extent}   params camera transformation to apply
     * @param      {number}   [params.zoom]   zoom
     * @param      {number}   [params.scale]   scale
     * @param      {boolean}  isAnimated  Indicates if animated
     * @return     {Promise}  A promise that resolves when transformation is complete
     */

  }, {
    key: "lookAtCoordinate",
    value: function lookAtCoordinate() {
      var _this3 = this;

      var params = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      var isAnimated = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : this.isAnimationEnabled();

      if (!params.isExtent) {
        if (params.zoom) {
          params.range = this.view.tileLayer.computeDistanceCameraFromTileZoom(params.zoom, this.view.camera);
        } else if (params.scale) {
          params.range = this.view.getScaleFromDistance(params.pitch, params.scale);

          if (params.range < this.minDistance || params.range > this.maxDistance) {
            // eslint-disable-next-line no-console
            console.warn("This scale ".concat(params.scale, " can not be reached"));
            params.range = THREE.MathUtils.clamp(params.range, this.minDistance, this.maxDistance);
          }
        }

        if (params.tilt !== undefined) {
          var minTilt = 90 - THREE.MathUtils.radToDeg(this.maxPolarAngle);
          var maxTilt = 90 - THREE.MathUtils.radToDeg(this.minPolarAngle);

          if (params.tilt < minTilt || params.tilt > maxTilt) {
            params.tilt = THREE.MathUtils.clamp(params.tilt, minTilt, maxTilt); // eslint-disable-next-line no-console

            console.warn('Tilt was clamped to ', params.tilt, " the interval is between ".concat(minTilt, " and ").concat(maxTilt, " degree"));
          }
        }
      }

      previous = _CameraUtils["default"].getTransformCameraLookingAtTarget(this.view, this.camera);

      if (isAnimated) {
        params.callback = function (r) {
          return cameraTarget.position.copy(r.targetWorldPosition);
        };

        this.dispatchEvent({
          type: 'animation-started'
        });
        return _CameraUtils["default"].animateCameraToLookAtTarget(this.view, this.camera, params).then(function (result) {
          _this3.dispatchEvent({
            type: 'animation-ended'
          });

          _this3.handlingEvent(result);

          return result;
        });
      } else {
        return _CameraUtils["default"].transformCameraToLookAtTarget(this.view, this.camera, params).then(function (result) {
          cameraTarget.position.copy(result.targetWorldPosition);

          _this3.handlingEvent(result);

          return result;
        });
      }
    }
    /**
     * Pick a position on the globe at the given position in lat,lon. See {@linkcode Coordinates} for conversion.
     * @param {Vector2} windowCoords - window coordinates
     * @param {number=} y - The y-position inside the Globe element.
     * @return {Coordinates} position
     */

  }, {
    key: "pickGeoPosition",
    value: function pickGeoPosition(windowCoords) {
      var pickedPosition = this.view.getPickingPositionFromDepth(windowCoords);

      if (!pickedPosition) {
        return;
      }

      return new _Coordinates["default"]('EPSG:4978', pickedPosition).as('EPSG:4326');
    }
  }]);
  return GlobeControls;
}(THREE.EventDispatcher);

var _default = GlobeControls;
exports["default"] = _default;