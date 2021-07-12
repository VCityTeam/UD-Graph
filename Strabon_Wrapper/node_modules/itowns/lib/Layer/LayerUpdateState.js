"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var UPDATE_STATE = {
  IDLE: 0,
  PENDING: 1,
  ERROR: 2,
  DEFINITIVE_ERROR: 3,
  FINISHED: 4
};
var PAUSE_BETWEEN_ERRORS = [1.0, 3.0, 7.0, 60.0];
/**
 * LayerUpdateState is the update state of a layer, for a given object (e.g tile).
 * It stores information to allow smart update decisions, and especially network
 * error handling.
 * @constructor
 */

var LayerUpdateState = /*#__PURE__*/function () {
  function LayerUpdateState() {
    (0, _classCallCheck2["default"])(this, LayerUpdateState);
    this.state = UPDATE_STATE.IDLE;
    this.lastErrorTimestamp = 0;
    this.errorCount = 0; // lowestLevelError is lowest level with error.
    //
    // if lowestLevelError is Infinity, so there has been no error.
    //
    // if lowestLevelError isn't Infinity, so the strategy is to find the
    // highest level between the current level and lowestLevelError.
    // the dichotomy method is used to find it.

    this.failureParams = {
      lowestLevelError: Infinity
    };
  }

  (0, _createClass2["default"])(LayerUpdateState, [{
    key: "canTryUpdate",
    value: function canTryUpdate() {
      var timestamp = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : Date.now();

      switch (this.state) {
        case UPDATE_STATE.IDLE:
          {
            return true;
          }

        case UPDATE_STATE.DEFINITIVE_ERROR:
        case UPDATE_STATE.PENDING:
        case UPDATE_STATE.FINISHED:
          {
            return false;
          }

        case UPDATE_STATE.ERROR:
        default:
          {
            var errorDuration = this.secondsUntilNextTry() * 1000;
            return errorDuration <= timestamp - this.lastErrorTimestamp;
          }
      }
    }
  }, {
    key: "secondsUntilNextTry",
    value: function secondsUntilNextTry() {
      if (this.state !== UPDATE_STATE.ERROR) {
        return 0;
      }

      var idx = Math.max(0, Math.min(this.errorCount, PAUSE_BETWEEN_ERRORS.length) - 1);
      return PAUSE_BETWEEN_ERRORS[idx];
    }
  }, {
    key: "newTry",
    value: function newTry() {
      this.state = UPDATE_STATE.PENDING;
    }
  }, {
    key: "success",
    value: function success() {
      this.lastErrorTimestamp = 0;
      this.state = UPDATE_STATE.IDLE;
    }
  }, {
    key: "noMoreUpdatePossible",
    value: function noMoreUpdatePossible() {
      this.state = UPDATE_STATE.FINISHED;
    }
  }, {
    key: "noData",
    value: function noData(failureParams) {
      this.state = UPDATE_STATE.IDLE;
      this.failureParams.lowestLevelError = Math.min(failureParams.targetLevel, this.failureParams.lowestLevelError);
    }
  }, {
    key: "failure",
    value: function failure(timestamp, definitive, failureParams) {
      if (failureParams && failureParams.targetLevel != undefined) {
        this.failureParams.lowestLevelError = Math.min(failureParams.targetLevel, this.failureParams.lowestLevelError);
      }

      this.lastErrorTimestamp = timestamp;
      this.state = definitive ? UPDATE_STATE.DEFINITIVE_ERROR : UPDATE_STATE.ERROR;
      this.errorCount++;
    }
  }, {
    key: "inError",
    value: function inError() {
      return this.state == UPDATE_STATE.DEFINITIVE_ERROR || this.state == UPDATE_STATE.ERROR;
    }
  }]);
  return LayerUpdateState;
}();

var _default = LayerUpdateState;
exports["default"] = _default;