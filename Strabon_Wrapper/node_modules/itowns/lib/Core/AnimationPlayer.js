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

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var FRAMERATE = 60;
var FRAME_DURATION = 1000 / FRAMERATE; // player statut

var PLAYER_STATE = {
  // player is stopped
  STOP: 0,
  // player plays animation
  PLAY: 1,
  // player is at the end of an animation
  END: 2,
  // player is paused
  PAUSE: 3
}; // Private functions
// stop timer and re-init parameter

var resetTimer = function (player) {
  if (player.id) {
    clearInterval(player.id);
    player.id = undefined;
  }

  if (player.waitTimer) {
    clearInterval(player.waitTimer);
    player.waitTimer = undefined;
  }

  player.keyframe = 0;
}; // finish animation and re-init parameter


var finishAnimation = function (player) {
  resetTimer(player);

  if (player.isEnded()) {
    player.dispatchEvent({
      type: 'animation-ended'
    });
  }

  player.dispatchEvent({
    type: 'animation-stopped'
  });
  player.duration = 0;
};
/**
 * It can play, pause or stop Animation or AnimationExpression (See below).
 * AnimationPlayer is needed to use Animation or AnimationExpression
 * AnimationPlayer emits events :
 *       - for each animation's frame;
 *       - when Animation is stopped
 *       - when Animation is ending
 */


var AnimationPlayer = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(AnimationPlayer, _THREE$EventDispatche);

  var _super = _createSuper(AnimationPlayer);

  function AnimationPlayer() {
    var _this;

    (0, _classCallCheck2["default"])(this, AnimationPlayer);
    _this = _super.call(this);
    _this.id = null;
    _this.keyframe = 0;
    _this.duration = 0;
    _this.state = PLAYER_STATE.STOP;
    _this.waitTimer = null;
    return _this;
  }

  (0, _createClass2["default"])(AnimationPlayer, [{
    key: "isPlaying",
    value: function isPlaying() {
      return this.state === PLAYER_STATE.PLAY;
    }
  }, {
    key: "isStopped",
    value: function isStopped() {
      return this.state === PLAYER_STATE.STOP;
    }
  }, {
    key: "isEnded",
    value: function isEnded() {
      return this.state === PLAYER_STATE.END;
    } // Public functions

    /**
     * Play one animation.
     * If another animation is playing, it's stopped and the new animation is played.
     *
     * @param {number} duration - The duration to play
     */

  }, {
    key: "play",
    value: function play(duration) {
      this.duration = duration;
      this.dispatchEvent({
        type: 'animation-started'
      });
      this.state = PLAYER_STATE.PLAY;
      resetTimer(this);
      this.id = setInterval(this.frame.bind(this), FRAME_DURATION);
    }
    /**
     * Play an animation after a number of frames.
     *
     * @param      {number}  duration    The duration to play
     * @param      {number}  waitingFrame    The waiting time before start animation (time in frame)
     */

  }, {
    key: "playLater",
    value: function playLater(duration, waitingFrame) {
      var timew = Math.floor(FRAME_DURATION * waitingFrame);
      window.clearInterval(this.waitTimer);
      var self = this;
      this.waitTimer = window.setTimeout(function () {
        self.play(duration);
      }, timew);
    }
    /**
     * Stop the current animation.
     *
     */

  }, {
    key: "stop",
    value: function stop() {
      this.state = PLAYER_STATE.STOP;
      finishAnimation(this);
    }
    /**
     * Executed for each frame.
     *
     * @private
     */

  }, {
    key: "frame",
    value: function frame() {
      if (this.keyframe < this.duration) {
        this.keyframe++;
        this.dispatchEvent({
          type: 'animation-frame'
        });
      } else {
        this.state = PLAYER_STATE.END;
        finishAnimation(this);
      }
    }
  }]);
  return AnimationPlayer;
}(THREE.EventDispatcher);

var _default = AnimationPlayer;
exports["default"] = _default;