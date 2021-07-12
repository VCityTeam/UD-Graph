"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.MAIN_LOOP_EVENTS = exports.RENDERING_SCHEDULED = exports.RENDERING_PAUSED = void 0;

var _three = require("three");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var RENDERING_PAUSED = 0;
exports.RENDERING_PAUSED = RENDERING_PAUSED;
var RENDERING_SCHEDULED = 1;
/**
 * MainLoop's update events list that are fired using
 * {@link View#execFrameRequesters}.
 *
 * @property UPDATE_START {string} fired at the start of the update
 * @property BEFORE_CAMERA_UPDATE {string} fired before the camera update
 * @property AFTER_CAMERA_UPDATE {string} fired after the camera update
 * @property BEFORE_LAYER_UPDATE {string} fired before the layer update
 * @property AFTER_LAYER_UPDATE {string} fired after the layer update
 * @property BEFORE_RENDER {string} fired before the render
 * @property AFTER_RENDER {string} fired after the render
 * @property UPDATE_END {string} fired at the end of the update
 */

exports.RENDERING_SCHEDULED = RENDERING_SCHEDULED;
var MAIN_LOOP_EVENTS = {
  UPDATE_START: 'update_start',
  BEFORE_CAMERA_UPDATE: 'before_camera_update',
  AFTER_CAMERA_UPDATE: 'after_camera_update',
  BEFORE_LAYER_UPDATE: 'before_layer_update',
  AFTER_LAYER_UPDATE: 'after_layer_update',
  BEFORE_RENDER: 'before_render',
  AFTER_RENDER: 'after_render',
  UPDATE_END: 'update_end'
};
exports.MAIN_LOOP_EVENTS = MAIN_LOOP_EVENTS;

function MainLoop(scheduler, engine) {
  this.renderingState = RENDERING_PAUSED;
  this.needsRedraw = false;
  this.scheduler = scheduler;
  this.gfxEngine = engine; // TODO: remove me

  this._updateLoopRestarted = true;
}

MainLoop.prototype = Object.create(_three.EventDispatcher.prototype);
MainLoop.prototype.constructor = MainLoop;

MainLoop.prototype.scheduleViewUpdate = function (view, forceRedraw) {
  var _this = this;

  this.needsRedraw |= forceRedraw;

  if (this.renderingState !== RENDERING_SCHEDULED) {
    this.renderingState = RENDERING_SCHEDULED;
    requestAnimationFrame(function (timestamp) {
      _this._step(view, timestamp);
    });
  }
};

function updateElements(context, geometryLayer, elements) {
  if (!elements) {
    return;
  }

  var _iterator = _createForOfIteratorHelper(elements),
      _step2;

  try {
    for (_iterator.s(); !(_step2 = _iterator.n()).done;) {
      var element = _step2.value;
      // update element
      // TODO find a way to notify attachedLayers when geometryLayer deletes some elements
      // and then update Debug.js:addGeometryLayerDebugFeatures
      var newElementsToUpdate = geometryLayer.update(context, geometryLayer, element);
      var sub = geometryLayer.getObjectToUpdateForAttachedLayers(element);

      if (sub) {
        if (sub.element) {
          // update attached layers
          var _iterator2 = _createForOfIteratorHelper(geometryLayer.attachedLayers),
              _step3;

          try {
            for (_iterator2.s(); !(_step3 = _iterator2.n()).done;) {
              var attachedLayer = _step3.value;

              if (attachedLayer.ready) {
                attachedLayer.update(context, attachedLayer, sub.element, sub.parent);
                attachedLayer.cache.flush();
              }
            }
          } catch (err) {
            _iterator2.e(err);
          } finally {
            _iterator2.f();
          }
        } else if (sub.elements) {
          for (var i = 0; i < sub.elements.length; i++) {
            if (!sub.elements[i].isObject3D) {
              throw new Error("\n                            Invalid object for attached layer to update.\n                            Must be a THREE.Object and have a THREE.Material");
            } // update attached layers


            var _iterator3 = _createForOfIteratorHelper(geometryLayer.attachedLayers),
                _step4;

            try {
              for (_iterator3.s(); !(_step4 = _iterator3.n()).done;) {
                var _attachedLayer = _step4.value;

                if (_attachedLayer.ready) {
                  _attachedLayer.update(context, _attachedLayer, sub.elements[i], sub.parent);

                  _attachedLayer.cache.flush();
                }
              }
            } catch (err) {
              _iterator3.e(err);
            } finally {
              _iterator3.f();
            }
          }
        }
      }

      updateElements(context, geometryLayer, newElementsToUpdate);
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
}

function filterChangeSources(updateSources, geometryLayer) {
  var fullUpdate = false;
  var filtered = new Set();
  updateSources.forEach(function (src) {
    if (src === geometryLayer || src.isCamera) {
      geometryLayer.info.clear();
      fullUpdate = true;
    } else if (src.layer === geometryLayer) {
      filtered.add(src);
    }
  });
  return fullUpdate ? new Set([geometryLayer]) : filtered;
}

MainLoop.prototype._update = function (view, updateSources, dt) {
  var context = {
    camera: view.camera,
    engine: this.gfxEngine,
    scheduler: this.scheduler,
    view: view
  }; // replace layer with their parent where needed

  updateSources.forEach(function (src) {
    var layer = src.layer || src;

    if (layer.isLayer && layer.parent) {
      updateSources.add(layer.parent);
    }
  });

  var _iterator4 = _createForOfIteratorHelper(view.getLayers(function (x, y) {
    return !y;
  })),
      _step5;

  try {
    for (_iterator4.s(); !(_step5 = _iterator4.n()).done;) {
      var geometryLayer = _step5.value;
      context.geometryLayer = geometryLayer;

      if (geometryLayer.ready && geometryLayer.visible && !geometryLayer.frozen) {
        view.execFrameRequesters(MAIN_LOOP_EVENTS.BEFORE_LAYER_UPDATE, dt, this._updateLoopRestarted, geometryLayer); // Filter updateSources that are relevant for the geometryLayer

        var srcs = filterChangeSources(updateSources, geometryLayer);

        if (srcs.size > 0) {
          // pre update attached layer
          var _iterator5 = _createForOfIteratorHelper(geometryLayer.attachedLayers),
              _step6;

          try {
            for (_iterator5.s(); !(_step6 = _iterator5.n()).done;) {
              var attachedLayer = _step6.value;

              if (attachedLayer.ready && attachedLayer.preUpdate) {
                attachedLayer.preUpdate(context, srcs);
              }
            } // `preUpdate` returns an array of elements to update

          } catch (err) {
            _iterator5.e(err);
          } finally {
            _iterator5.f();
          }

          var elementsToUpdate = geometryLayer.preUpdate(context, srcs); // `update` is called in `updateElements`.

          updateElements(context, geometryLayer, elementsToUpdate); // `postUpdate` is called when this geom layer update process is finished

          geometryLayer.postUpdate(context, geometryLayer, updateSources);
        } // Clear the cache of expired resources


        geometryLayer.cache.flush();
        view.execFrameRequesters(MAIN_LOOP_EVENTS.AFTER_LAYER_UPDATE, dt, this._updateLoopRestarted, geometryLayer);
      }
    }
  } catch (err) {
    _iterator4.e(err);
  } finally {
    _iterator4.f();
  }
};

MainLoop.prototype._step = function (view, timestamp) {
  var dt = timestamp - this._lastTimestamp;

  view._executeFrameRequestersRemovals();

  view.execFrameRequesters(MAIN_LOOP_EVENTS.UPDATE_START, dt, this._updateLoopRestarted);
  var willRedraw = this.needsRedraw;
  this._lastTimestamp = timestamp; // Reset internal state before calling _update (so future calls to View.notifyChange()
  // can properly change it)

  this.needsRedraw = false;
  this.renderingState = RENDERING_PAUSED;
  var updateSources = new Set(view._changeSources);

  view._changeSources.clear(); // update camera


  var dim = this.gfxEngine.getWindowSize();
  view.execFrameRequesters(MAIN_LOOP_EVENTS.BEFORE_CAMERA_UPDATE, dt, this._updateLoopRestarted);
  view.camera.update(dim.x, dim.y);
  view.execFrameRequesters(MAIN_LOOP_EVENTS.AFTER_CAMERA_UPDATE, dt, this._updateLoopRestarted); // Disable camera's matrix auto update to make sure the camera's
  // world matrix is never updated mid-update.
  // Otherwise inconsistencies can appear because object visibility
  // testing and object drawing could be performed using different
  // camera matrixWorld.
  // Note: this is required at least because WEBGLRenderer calls
  // camera.updateMatrixWorld()

  var oldAutoUpdate = view.camera.camera3D.matrixAutoUpdate;
  view.camera.camera3D.matrixAutoUpdate = false; // update data-structure

  this._update(view, updateSources, dt);

  if (this.scheduler.commandsWaitingExecutionCount() == 0) {
    this.dispatchEvent({
      type: 'command-queue-empty'
    });
  } // Redraw *only* if needed.
  // (redraws only happen when this.needsRedraw is true, which in turn only happens when
  // view.notifyChange() is called with redraw=true)
  // As such there's no continuous update-loop, instead we use a ad-hoc update/render
  // mechanism.


  if (willRedraw) {
    this._renderView(view, dt);
  } // next time, we'll consider that we've just started the loop if we are still PAUSED now


  this._updateLoopRestarted = this.renderingState === RENDERING_PAUSED;
  view.camera.camera3D.matrixAutoUpdate = oldAutoUpdate;
  view.execFrameRequesters(MAIN_LOOP_EVENTS.UPDATE_END, dt, this._updateLoopRestarted);
};

MainLoop.prototype._renderView = function (view, dt) {
  view.execFrameRequesters(MAIN_LOOP_EVENTS.BEFORE_RENDER, dt, this._updateLoopRestarted);

  if (view.render) {
    view.render();
  } else {
    // use default rendering method
    this.gfxEngine.renderView(view);
  }

  view.execFrameRequesters(MAIN_LOOP_EVENTS.AFTER_RENDER, dt, this._updateLoopRestarted);
};

var _default = MainLoop;
exports["default"] = _default;