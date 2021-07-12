"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

var THREE = _interopRequireWildcard(require("three"));

var _LayerUpdateState = _interopRequireDefault(require("../Layer/LayerUpdateState"));

var _ObjectRemovalHelper = _interopRequireDefault(require("./ObjectRemovalHelper"));

var _handlerNodeError = _interopRequireDefault(require("./handlerNodeError"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var coord = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);

function assignLayer(object, layer) {
  if (object) {
    object.layer = layer;

    if (object.material) {
      object.material.transparent = layer.opacity < 1.0;
      object.material.opacity = layer.opacity;
      object.material.wireframe = layer.wireframe;
    }

    object.layers.set(layer.threejsLayer);

    var _iterator = _createForOfIteratorHelper(object.children),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var c = _step.value;
        assignLayer(c, layer);
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    return object;
  }
}

var _default = {
  update: function update(context, layer, node) {
    if (!node.parent && node.children.length) {
      // if node has been removed dispose three.js resource
      _ObjectRemovalHelper["default"].removeChildrenAndCleanupRecursively(layer, node);

      return;
    }

    if (!node.visible) {
      return;
    }

    if (node.layerUpdateState[layer.id] === undefined) {
      node.layerUpdateState[layer.id] = new _LayerUpdateState["default"]();
    } else if (!node.layerUpdateState[layer.id].canTryUpdate()) {
      return;
    }

    var features = node.children.filter(function (n) {
      return n.layer == layer;
    });

    if (features.length > 0) {
      return features;
    }

    var extentsDestination = node.getExtentsByProjection(layer.source.crs) || [node.extent];
    var zoomDest = extentsDestination[0].zoom; // check if it's tile level is equal to display level layer.

    if (zoomDest != layer.zoom.min || // check if there's data in extent tile.
    !this.source.extentInsideLimit(node.extent, zoomDest) || // In FileSource case, check if the feature center is in extent tile.
    layer.source.isFileSource && !node.extent.isPointInside(layer.source.extent.center(coord))) {
      // if not, there's not data to add at this tile.
      node.layerUpdateState[layer.id].noMoreUpdatePossible();
      return;
    }

    node.layerUpdateState[layer.id].newTry();
    var command = {
      layer: layer,
      extentsSource: extentsDestination,
      view: context.view,
      threejsLayer: layer.threejsLayer,
      requester: node
    };
    return context.scheduler.execute(command).then(function (result) {
      // if request return empty json, WFSProvider.getFeatures return undefined
      result = result[0];

      if (result) {
        assignLayer(result, layer); // call onMeshCreated callback if needed

        if (layer.onMeshCreated) {
          layer.onMeshCreated(result);
        }

        node.layerUpdateState[layer.id].success();

        if (!node.parent) {
          _ObjectRemovalHelper["default"].removeChildrenAndCleanupRecursively(layer, result);

          return;
        } // remove old group layer


        node.remove.apply(node, (0, _toConsumableArray2["default"])(node.children.filter(function (c) {
          return c.layer && c.layer.id == layer.id;
        })));
        var group = new THREE.Group();
        group.layer = layer;
        group.matrixWorld.copy(node.matrixWorld).invert();
        group.matrixWorld.decompose(group.position, group.quaternion, group.scale);
        node.add(group.add(result));
        group.updateMatrixWorld(true);
      } else {
        node.layerUpdateState[layer.id].failure(1, true);
      }
    }, function (err) {
      return (0, _handlerNodeError["default"])(err, node, layer, node.level, context.view);
    });
  }
};
exports["default"] = _default;