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

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _MainLoop = require("../Core/MainLoop");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var MOVEMENTS = {
  38: {
    method: 'translateZ',
    sign: -1
  },
  // FORWARD: up key
  40: {
    method: 'translateZ',
    sign: 1
  },
  // BACKWARD: down key
  37: {
    method: 'translateX',
    sign: -1
  },
  // STRAFE_LEFT: left key
  39: {
    method: 'translateX',
    sign: 1
  },
  // STRAFE_RIGHT: right key
  33: {
    method: 'rotateZ',
    sign: 1,
    noSpeed: true
  },
  // UP: PageUp key
  34: {
    method: 'rotateZ',
    sign: -1,
    noSpeed: true
  },
  // DOWN: PageDown key
  wheelup: {
    method: 'translateZ',
    sign: 1,
    oneshot: true
  },
  // WHEEL up
  wheeldown: {
    method: 'translateZ',
    sign: -1,
    oneshot: true
  } // WHEEL down

};

function onDocumentMouseDown(event) {
  event.preventDefault();
  this._isMouseDown = true;
  var coords = this.view.eventToViewCoords(event);
  this._onMouseDownMouseX = coords.x;
  this._onMouseDownMouseY = coords.y;
}

function onTouchStart(event) {
  event.preventDefault();
  this._isMouseDown = true;
  this._onMouseDownMouseX = event.touches[0].pageX;
  this._onMouseDownMouseY = event.touches[0].pageY;
}

function onPointerMove(event) {
  if (this._isMouseDown === true) {
    var coords = this.view.eventToViewCoords(event); // in rigor we have tan(theta) = tan(cameraFOV) * deltaH / H
    // (where deltaH is the vertical amount we moved, and H the renderer height)
    // we loosely approximate tan(x) by x

    var pxToAngleRatio = THREE.MathUtils.degToRad(this._camera3D.fov) / this.view.mainLoop.gfxEngine.height;

    this._camera3D.rotateY((coords.x - this._onMouseDownMouseX) * pxToAngleRatio);

    this._camera3D.rotateX((coords.y - this._onMouseDownMouseY) * pxToAngleRatio);

    this._onMouseDownMouseX = coords.x;
    this._onMouseDownMouseY = coords.y;
    this.view.notifyChange(this._camera3D, false);
  }
}

function onDocumentMouseUp() {
  this._isMouseDown = false;
}

function onKeyUp(e) {
  var move = MOVEMENTS[e.keyCode];

  if (move) {
    this.moves["delete"](move);
    e.preventDefault();
  }
}

function onKeyDown(e) {
  var move = MOVEMENTS[e.keyCode];

  if (move) {
    this.moves.add(move);
    this.view.notifyChange(this._camera3D, false);
    e.preventDefault();
  }
}

function onDocumentMouseWheel(event) {
  var delta = 0;

  if (event.wheelDelta !== undefined) {
    delta = event.wheelDelta; // Firefox
  } else if (event.detail !== undefined) {
    delta = -event.detail;
  }

  if (delta < 0) {
    this.moves.add(MOVEMENTS.wheelup);
  } else {
    this.moves.add(MOVEMENTS.wheeldown);
  }

  this.view.notifyChange(this._camera3D, false);
}
/**
 * First-Person controls (at least a possible declination of it).
 *
 * Bindings:
 * - up + down keys: forward/backward
 * - left + right keys: strafing movements
 * - PageUp + PageDown: roll movement
 * - mouse click+drag: pitch and yaw movements (as looking at a panorama, not as in FPS games for instance)
 */


var FlyControls = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(FlyControls, _THREE$EventDispatche);

  var _super = _createSuper(FlyControls);

  /**
   * @Constructor
   * @param {View} view
   * @param {object} options
   * @param {boolean} options.focusOnClick - whether or not to focus the renderer domElement on click
   * @param {boolean} options.focusOnMouseOver - whether or not to focus when the mouse is over the domElement
   */
  function FlyControls(view) {
    var _this;

    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, FlyControls);
    _this = _super.call(this);
    _this.view = view;
    _this.options = options;
    _this._camera3D = view.camera.camera3D;
    _this.moves = new Set();
    _this.moveSpeed = 10; // backward or forward move speed in m/s

    _this._onMouseDownMouseX = 0;
    _this._onMouseDownMouseY = 0;
    _this._isMouseDown = false;
    view.domElement.addEventListener('mousedown', onDocumentMouseDown.bind((0, _assertThisInitialized2["default"])(_this)), false);
    view.domElement.addEventListener('touchstart', onTouchStart.bind((0, _assertThisInitialized2["default"])(_this)), false);
    var bindedPM = onPointerMove.bind((0, _assertThisInitialized2["default"])(_this));
    view.domElement.addEventListener('mousemove', bindedPM, false);
    view.domElement.addEventListener('touchmove', bindedPM, false);
    view.domElement.addEventListener('mouseup', onDocumentMouseUp.bind((0, _assertThisInitialized2["default"])(_this)), false);
    view.domElement.addEventListener('touchend', onDocumentMouseUp.bind((0, _assertThisInitialized2["default"])(_this)), false);
    view.domElement.addEventListener('mousewheel', onDocumentMouseWheel.bind((0, _assertThisInitialized2["default"])(_this)), false);
    view.domElement.addEventListener('DOMMouseScroll', onDocumentMouseWheel.bind((0, _assertThisInitialized2["default"])(_this)), false); // firefox

    view.domElement.addEventListener('keyup', onKeyUp.bind((0, _assertThisInitialized2["default"])(_this)), true);
    view.domElement.addEventListener('keydown', onKeyDown.bind((0, _assertThisInitialized2["default"])(_this)), true);

    _this.view.addFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.AFTER_CAMERA_UPDATE, _this.update.bind((0, _assertThisInitialized2["default"])(_this))); // focus policy


    if (options.focusOnMouseOver) {
      view.domElement.addEventListener('mouseover', function () {
        return view.domElement.focus();
      });
    }

    if (options.focusOnClick) {
      view.domElement.addEventListener('click', function () {
        return view.domElement.focus();
      });
    }

    return _this;
  }

  (0, _createClass2["default"])(FlyControls, [{
    key: "isUserInteracting",
    value: function isUserInteracting() {
      return this.moves.size !== 0 || this._isMouseDown;
    }
  }, {
    key: "update",
    value: function update(dt, updateLoopRestarted) {
      // if we are in a keypressed state, then update position
      // dt will not be relevant when we just started rendering, we consider a 1-frame move in this case
      if (updateLoopRestarted) {
        dt = 16;
      }

      var _iterator = _createForOfIteratorHelper(this.moves),
          _step;

      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var _move = _step.value;

          this._camera3D[_move.method](_move.sign * (_move.noSpeed ? 1 : this.moveSpeed) * dt / 1000);
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }

      if (this.moves.size > 0 || this._isMouseDown) {
        this.view.notifyChange(this._camera3D);

        var _iterator2 = _createForOfIteratorHelper(this.moves),
            _step2;

        try {
          for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
            var move = _step2.value;

            if (move.oneshot) {
              this.moves["delete"](move);
            }
          }
        } catch (err) {
          _iterator2.e(err);
        } finally {
          _iterator2.f();
        }
      }
    }
  }]);
  return FlyControls;
}(THREE.EventDispatcher);

var _default = FlyControls;
exports["default"] = _default;