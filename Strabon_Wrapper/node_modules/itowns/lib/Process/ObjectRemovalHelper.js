"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var _default = {
  /**
   * Cleanup obj to release three.js allocated resources
   * @param {Object3D} obj object to release
   */
  cleanup: function cleanup(obj) {
    obj.layer = null;

    if (typeof obj.dispose === 'function') {
      obj.dispose();
    } else {
      if (obj.geometry) {
        obj.geometry.dispose(); // the Object Removal Helper causes inconsistencies
        // when it assigns null to a geometry present in the Cache.
        // Actually, the cache can provide a mesh whose geometry is null.
        // see https://github.com/iTowns/itowns/issues/869
        // obj.geometry = null;
      }

      if (obj.material) {
        if (Array.isArray(obj.material)) {
          var _iterator = _createForOfIteratorHelper(obj.material),
              _step;

          try {
            for (_iterator.s(); !(_step = _iterator.n()).done;) {
              var material = _step.value;
              material.dispose();
            }
          } catch (err) {
            _iterator.e(err);
          } finally {
            _iterator.f();
          }
        } else {
          obj.material.dispose();
        } // obj.material = null;

      }
    }
  },

  /**
   * Remove obj's children belonging to a layer.
   * Neither obj nor its children will be disposed!
   * @param {Layer} layer The layer that objects must belong to. Other object are ignored
   * @param {Object3D} obj The Object3D we want to clean
   * @return {Array} an array of removed Object3D from obj (not including the recursive removals)
   */
  removeChildren: function removeChildren(layer, obj) {
    var toRemove = obj.children.filter(function (c) {
      return (c.layer && c.layer.id) === layer.id;
    });
    obj.remove.apply(obj, (0, _toConsumableArray2["default"])(toRemove));
    return toRemove;
  },

  /**
   * Remove obj's children belonging to a layer and cleanup objexts.
   * obj will be disposed but its children **won't**!
   * @param {Layer} layer The layer that objects must belong to. Other object are ignored
   * @param {Object3D} obj The Object3D we want to clean
   * @return {Array} an array of removed Object3D from obj (not including the recursive removals)
   */
  removeChildrenAndCleanup: function removeChildrenAndCleanup(layer, obj) {
    var toRemove = obj.children.filter(function (c) {
      return (c.layer && c.layer.id) === layer.id;
    });
    obj.remove.apply(obj, (0, _toConsumableArray2["default"])(toRemove));

    if (obj.layer === layer) {
      this.cleanup(obj);
    }

    return toRemove;
  },

  /**
   * Recursively remove obj's children belonging to a layer.
   * All removed obj will have their geometry/material disposed.
   * @param {Layer} layer The layer that objects must belong to. Other object are ignored
   * @param {Object3D} obj The Object3D we want to clean
   * @return {Array} an array of removed Object3D from obj (not including the recursive removals)
   */
  removeChildrenAndCleanupRecursively: function removeChildrenAndCleanupRecursively(layer, obj) {
    var toRemove = obj.children.filter(function (c) {
      return (c.layer && c.layer.id) === layer.id;
    });

    var _iterator2 = _createForOfIteratorHelper(toRemove),
        _step2;

    try {
      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        var c = _step2.value;
        this.removeChildrenAndCleanupRecursively(layer, c);
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }

    obj.remove.apply(obj, (0, _toConsumableArray2["default"])(toRemove));

    if (obj.layer && obj.layer.id === layer.id) {
      this.cleanup(obj);
    }

    return toRemove;
  }
};
exports["default"] = _default;