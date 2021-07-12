"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.COLOR_LAYERS_ORDER_CHANGED = void 0;

var _Layer = require("../Layer/Layer");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function updateLayersOrdering(geometryLayer, imageryLayers) {
  var sequence = _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers);

  var cO = function (object) {
    if (object.material && object.material.setSequence) {
      object.material.setSequence(sequence);
    }
  };

  var _iterator = _createForOfIteratorHelper(geometryLayer.level0Nodes),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var node = _step.value;
      node.traverse(cO);
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
}

var COLOR_LAYERS_ORDER_CHANGED = 'layers-order-changed';
/**
 * Utilitary to organize {@link ColorLayer} in a {@link View}.
 *
 * @module ColorLayersOrdering
 */

exports.COLOR_LAYERS_ORDER_CHANGED = COLOR_LAYERS_ORDER_CHANGED;
var _default = {
  /**
   * Moves up in the layer list. This function has no effect if the layer is
   * moved to its current index.
   *
   * @param {View} view - The view in which the layer is moved up.
   * @param {string} layerId - The ID of the layer to move.
   *
   * @example
   * itowns.ColorLayersOrdering.moveLayerUp(viewer, 'idLayerToUp');
   */
  moveLayerUp: function moveLayerUp(view, layerId) {
    var imageryLayers = view.getLayers(function (l) {
      return l.isColorLayer;
    });
    var layer = view.getLayerById(layerId);

    if (layer) {
      var previousSequence = _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers);

      _Layer.ImageryLayers.moveLayerUp(layer, imageryLayers);

      updateLayersOrdering(view.tileLayer, imageryLayers);
      view.dispatchEvent({
        type: COLOR_LAYERS_ORDER_CHANGED,
        previous: {
          sequence: previousSequence
        },
        "new": {
          sequence: _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers)
        }
      });
      view.notifyChange(view.tileLayer);
    } else {
      throw new Error("".concat(layerId, " isn't color layer"));
    }
  },

  /**
   * Moves down in the layer list. This function has no effect if the layer is
   * moved to its current index.
   *
   * @param {View} view - The view in which the layer is moved down.
   * @param {string} layerId - The ID of the layer to move.
   *
   * @example
   * itowns.ColorLayersOrdering.moveLayerDown(viewer, 'idLayerToDown');
   */
  moveLayerDown: function moveLayerDown(view, layerId) {
    var imageryLayers = view.getLayers(function (l) {
      return l.isColorLayer;
    });
    var layer = view.getLayerById(layerId);

    if (layer) {
      var previousSequence = _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers);

      _Layer.ImageryLayers.moveLayerDown(layer, imageryLayers);

      updateLayersOrdering(view.tileLayer, imageryLayers);
      view.dispatchEvent({
        type: COLOR_LAYERS_ORDER_CHANGED,
        previous: {
          sequence: previousSequence
        },
        "new": {
          sequence: _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers)
        }
      });
      view.notifyChange(view.tileLayer);
    } else {
      throw new Error("".concat(layerId, " isn't color layer"));
    }
  },

  /**
   * Moves a specific layer to a specific index in the layer list. This
   * function has no effect if the layer is moved to its current index.
   *
   * @param {View} view - The view in which the layer is moved.
   * @param {string} layerId - The ID of the layer to move.
   * @param {number} index - The index to move the layer to.
   *
   * @example
   * itowns.ColorLayersOrdering.moveLayerToIndex(viewer, 'idLayerToChangeIndex', 2);
   */
  moveLayerToIndex: function moveLayerToIndex(view, layerId, index) {
    var imageryLayers = view.getLayers(function (l) {
      return l.isColorLayer;
    });
    var layer = view.getLayerById(layerId);

    if (layer) {
      var previousSequence = _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers);

      _Layer.ImageryLayers.moveLayerToIndex(layer, index, imageryLayers);

      updateLayersOrdering(view.tileLayer, imageryLayers);
      view.dispatchEvent({
        type: COLOR_LAYERS_ORDER_CHANGED,
        previous: {
          sequence: previousSequence
        },
        "new": {
          sequence: _Layer.ImageryLayers.getColorLayersIdOrderedBySequence(imageryLayers)
        }
      });
      view.notifyChange(view.tileLayer);
    } else {
      throw new Error("".concat(layerId, " isn't color layer"));
    }
  }
};
exports["default"] = _default;