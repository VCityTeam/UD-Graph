"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.VIEW_EVENTS = void 0;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _Camera = _interopRequireDefault(require("../Renderer/Camera"));

var _MainLoop = _interopRequireWildcard(require("./MainLoop"));

var _Capabilities = _interopRequireDefault(require("./System/Capabilities"));

var _ColorLayersOrdering = require("../Renderer/ColorLayersOrdering");

var _c3DEngine = _interopRequireDefault(require("../Renderer/c3DEngine"));

var _RenderMode = _interopRequireDefault(require("../Renderer/RenderMode"));

var _Crs = _interopRequireDefault(require("./Geographic/Crs"));

var _Coordinates = _interopRequireDefault(require("./Geographic/Coordinates"));

var _FeaturesUtils = _interopRequireDefault(require("../Utils/FeaturesUtils"));

var _LayeredMaterial = require("../Renderer/LayeredMaterial");

var _Scheduler = _interopRequireDefault(require("./Scheduler/Scheduler"));

var _Picking = _interopRequireDefault(require("./Picking"));

var _LabelLayer = _interopRequireDefault(require("../Layer/LabelLayer"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var VIEW_EVENTS = {
  /**
   * Fires when all the layers of the view are considered initialized.
   * Initialized in this context means: all layers are ready to be
   * displayed (no pending network access, no visual improvement to be
   * expected, ...).
   * If you add new layers, the event will be fired again when all
   * layers are ready.
   * @event View#layers-initialized
   * @property type {string} layers-initialized
   */
  LAYERS_INITIALIZED: 'layers-initialized',
  LAYER_REMOVED: 'layer-removed',
  LAYER_ADDED: 'layer-added',
  INITIALIZED: 'initialized',
  COLOR_LAYERS_ORDER_CHANGED: _ColorLayersOrdering.COLOR_LAYERS_ORDER_CHANGED
};
exports.VIEW_EVENTS = VIEW_EVENTS;

var _syncGeometryLayerVisibility = function (layer, view) {
  if (layer.object3d) {
    layer.object3d.visible = layer.visible;
  }

  if (layer.threejsLayer) {
    if (layer.visible) {
      view.camera.camera3D.layers.enable(layer.threejsLayer);
    } else {
      view.camera.camera3D.layers.disable(layer.threejsLayer);
    }
  }
};

function _preprocessLayer(view, layer, parentLayer) {
  var source = layer.source;

  if (parentLayer && !layer.extent) {
    layer.extent = parentLayer.extent;

    if (source && !source.extent) {
      source.extent = parentLayer.extent;
    }
  }

  if (layer.isGeometryLayer) {
    if (parentLayer) {
      // layer.threejsLayer *must* be assigned before preprocessing,
      // because TileProvider.preprocessDataLayer function uses it.
      layer.threejsLayer = view.mainLoop.gfxEngine.getUniqueThreejsLayer();
    }

    layer.defineLayerProperty('visible', true, function () {
      return _syncGeometryLayerVisibility(layer, view);
    });

    _syncGeometryLayerVisibility(layer, view); // Find crs projection layer, this is projection destination


    layer.crs = view.referenceCrs;
  } else if (!layer.crs) {
    if (parentLayer && parentLayer.tileMatrixSets && parentLayer.tileMatrixSets.includes(_Crs["default"].formatToTms(source.crs))) {
      layer.crs = source.crs;
    } else {
      layer.crs = parentLayer && parentLayer.extent.crs;
    }
  }

  if (layer.isLabelLayer) {
    view.mainLoop.gfxEngine.label2dRenderer.registerLayer(layer);
  } else if (layer.labelEnabled || layer.addLabelLayer) {
    if (layer.labelEnabled) {
      // eslint-disable-next-line no-console
      console.info('layer.labelEnabled is deprecated use addLabelLayer, instead of');
    } // Because the features are shared between layer and labelLayer.


    layer.buildExtent = true;
    var labelLayer = new _LabelLayer["default"]("".concat(layer.id, "-label"), {
      source: source,
      style: layer.style,
      zoom: layer.zoom,
      crs: source.crs,
      visible: layer.visible
    });
    layer.addEventListener('visible-property-changed', function () {
      labelLayer.visible = layer.visible;
    });

    var removeLabelLayer = function (e) {
      if (e.layerId === layer.id) {
        view.removeLayer(labelLayer.id);
      }

      view.removeEventListener(VIEW_EVENTS.LAYER_REMOVED, removeLabelLayer);
    };

    view.addEventListener(VIEW_EVENTS.LAYER_REMOVED, removeLabelLayer);
    layer.whenReady = layer.whenReady.then(function () {
      view.addLayer(labelLayer);
      return layer;
    });
  }

  return layer;
}

var _eventCoords = new THREE.Vector2();

var matrix = new THREE.Matrix4();
var screen = new THREE.Vector2();
var ray = new THREE.Ray();
var direction = new THREE.Vector3();
var positionVector = new THREE.Vector3();
var coordinates = new _Coordinates["default"]('EPSG:4326');
var viewers = []; // Size of the camera frustrum, in meters

var screenMeters;

var View = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(View, _THREE$EventDispatche);

  var _super = _createSuper(View);

  /**
   * Constructs an Itowns View instance
   *
   * @example <caption><b>Create a view with a custom Three.js camera.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * var customCamera = itowns.THREE.PerspectiveCamera();
   * var view = itowns.View('EPSG:4326', viewerDiv, { camera: { cameraThree: customCamera } });
   *
   * @example <caption><b>Create a view with an orthographic camera, and grant it with Three.js custom controls.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * var view = itowns.View('EPSG:4326', viewerDiv, { camera: { type: itowns.CAMERA_TYPE.ORTHOGRAPHIC } });
   * var customControls = itowns.THREE.OrbitControls(view.camera.camera3D, viewerDiv);
   *
   * @example <caption><b>Enable WebGl 1.0 instead of WebGl 2.0.</b></caption>
   * var viewerDiv = document.getElementById('viewerDiv');
   * const extent = new Extent('EPSG:3946', 1837816.94334, 1847692.32501, 5170036.4587, 5178412.82698);
   * var view = new itowns.View('EPSG:4326', viewerDiv, {  renderer: { isWebGL2: false } });
   *
   * @param {string} crs - The default CRS of Three.js coordinates. Should be a cartesian CRS.
   * @param {HTMLElement} viewerDiv - Where to instanciate the Three.js scene in the DOM
   * @param {Object=} options - Optional properties.
   * @param {object} [options.camera] - Options for the camera associated to the view. See {@link Camera} options.
   * @param {?MainLoop} options.mainLoop - {@link MainLoop} instance to use, otherwise a default one will be constructed
   * @param {?(WebGLRenderer|object)} options.renderer - {@link WebGLRenderer} instance to use, otherwise
   * a default one will be constructed. In this case, if options.renderer is an object, it will be used to
   * configure the renderer (see {@link c3DEngine}.  If not present, a new &lt;canvas> will be created and
   * added to viewerDiv (mutually exclusive with mainLoop)
   * @param {boolean} [options.renderer.isWebGL2=true] - enable webgl 2.0 for THREE.js.
   * @param {?Scene} [options.scene3D] - [THREE.Scene](https://threejs.org/docs/#api/en/scenes/Scene) instance to use, otherwise a default one will be constructed
   * @param {?Color} options.diffuse - [THREE.Color](https://threejs.org/docs/?q=color#api/en/math/Color) Diffuse color terrain material.
   * This color is applied to terrain if there isn't color layer on terrain extent (by example on pole).
   *
   * @constructor
   */
  function View(crs, viewerDiv) {
    var _this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    (0, _classCallCheck2["default"])(this, View);

    if (!viewerDiv) {
      throw new Error('Invalid viewerDiv parameter (must non be null/undefined)');
    }

    _this = _super.call(this);
    _this.domElement = viewerDiv;
    _this.referenceCrs = crs;
    coordinates.crs = crs;
    var engine; // options.renderer can be 2 separate things:
    //   - an actual renderer (in this case we don't use viewerDiv)
    //   - options for the renderer to be created

    if (options.renderer && options.renderer.domElement) {
      engine = new _c3DEngine["default"](options.renderer);
    } else {
      engine = new _c3DEngine["default"](viewerDiv, options.renderer);
    }

    _this.mainLoop = options.mainLoop || new _MainLoop["default"](new _Scheduler["default"](), engine);
    _this.scene = options.scene3D || new THREE.Scene();

    if (!options.scene3D) {
      _this.scene.autoUpdate = false;
    }

    _this.camera = new _Camera["default"](_this.referenceCrs, _this.mainLoop.gfxEngine.getWindowSize().x, _this.mainLoop.gfxEngine.getWindowSize().y, options.camera);
    _this._frameRequesters = {};
    _this._layers = [];
    window.addEventListener('resize', function () {
      return _this.resize();
    }, false);
    _this._changeSources = new Set();
    _this._delayedFrameRequesterRemoval = [];

    _this._allLayersAreReadyCallback = function () {
      // all layers must be ready
      var allReady = _this.getLayers().every(function (layer) {
        return layer.ready;
      });

      if (allReady && _this.mainLoop.scheduler.commandsWaitingExecutionCount() == 0 && _this.mainLoop.renderingState == _MainLoop.RENDERING_PAUSED) {
        _this.dispatchEvent({
          type: VIEW_EVENTS.LAYERS_INITIALIZED
        });

        _this.removeFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.UPDATE_END, _this._allLayersAreReadyCallback);
      }
    };

    _this.camera.resize(_this.domElement.clientWidth, _this.domElement.clientHeight);

    var fn = function () {
      _this.removeEventListener(VIEW_EVENTS.LAYERS_INITIALIZED, fn);

      _this.dispatchEvent({
        type: VIEW_EVENTS.INITIALIZED
      });
    };

    _this.addEventListener(VIEW_EVENTS.LAYERS_INITIALIZED, fn);

    _this._fullSizeDepthBuffer = new Uint8Array(4 * _this.camera.width * _this.camera.height);
    _this._pixelDepthBuffer = new Uint8Array(4); // Indicates that view's domElement can be focused (the negative value indicates that domElement can't be
    // focused sequentially using tab key). Focus is needed to capture some key events.

    _this.domElement.tabIndex = -1; // Set focus on view's domElement.

    _this.domElement.focus(); // push all viewer to keep source.cache


    viewers.push((0, _assertThisInitialized2["default"])(_this));
    return _this;
  }
  /**
   * Dispose viewer before delete it.
   *
   * Method dispose all viewer objects
   * - remove control
   * - remove all layers
   * - remove all frame requester
   * - remove all events
   */


  (0, _createClass2["default"])(View, [{
    key: "dispose",
    value: function dispose() {
      var id = viewers.indexOf(this);

      if (id == -1) {
        console.warn('View already disposed');
        return;
      } // controls dispose


      if (this.controls && this.controls.dispose) {
        this.controls.dispose();
      } // remove alls frameRequester


      this.removeAllFrameRequesters(); // remove alls events

      this.removeAllEvents(); // remove alls layers

      var layers = this.getLayers(function (l) {
        return !l.isTiledGeometryLayer && !l.isAtmosphere;
      });

      var _iterator = _createForOfIteratorHelper(layers),
          _step;

      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var layer = _step.value;
          this.removeLayer(layer.id);
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }

      var atmospheres = this.getLayers(function (l) {
        return l.isAtmosphere;
      });

      var _iterator2 = _createForOfIteratorHelper(atmospheres),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var atmosphere = _step2.value;
          this.removeLayer(atmosphere.id);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      var tileLayers = this.getLayers(function (l) {
        return l.isTiledGeometryLayer;
      });

      var _iterator3 = _createForOfIteratorHelper(tileLayers),
          _step3;

      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var tileLayer = _step3.value;
          this.removeLayer(tileLayer.id);
        }
      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }

      viewers.splice(id, 1);
    }
    /**
     * Add layer in viewer.
     * The layer id must be unique.
     *
     * The `layer.whenReady` is a promise that resolves when
     * the layer is done. This promise is also returned by
     * `addLayer` allowing to chain call.
     *
     * @param {LayerOptions|Layer|GeometryLayer} layer The layer to add in view.
     * @param {Layer=} parentLayer it's the layer to which the layer will be attached.
     * @return {Promise} a promise resolved with the new layer object when it is fully initialized or rejected if any error occurred.
     */

  }, {
    key: "addLayer",
    value: function addLayer(layer, parentLayer) {
      var _this2 = this;

      if (!layer || !layer.isLayer) {
        return Promise.reject(new Error('Add Layer type object'));
      }

      var duplicate = this.getLayerById(layer.id);

      if (duplicate) {
        return layer._reject(new Error("Invalid id '".concat(layer.id, "': id already used")));
      }

      layer = _preprocessLayer(this, layer, parentLayer);

      if (parentLayer) {
        if (layer.isColorLayer) {
          var layerColors = this.getLayers(function (l) {
            return l.isColorLayer;
          });
          layer.sequence = layerColors.length;
          var sumColorLayers = parentLayer.countColorLayersTextures.apply(parentLayer, (0, _toConsumableArray2["default"])(layerColors).concat([layer]));

          if (sumColorLayers <= (0, _LayeredMaterial.getMaxColorSamplerUnitsCount)()) {
            parentLayer.attach(layer);
          } else {
            return layer._reject(new Error("Cant add color layer ".concat(layer.id, ": the maximum layer is reached")));
          }
        } else if (layer.isElevationLayer && layer.source.format == 'image/x-bil;bits=32') {
          layer.source.networkOptions.isWebGL2 = this.mainLoop.gfxEngine.renderer.capabilities.isWebGL2;
          parentLayer.attach(layer);
        } else {
          parentLayer.attach(layer);
        }
      } else {
        if (typeof layer.update !== 'function') {
          return layer._reject(new Error('Cant add GeometryLayer: missing a update function'));
        }

        if (typeof layer.preUpdate !== 'function') {
          return layer._reject(new Error('Cant add GeometryLayer: missing a preUpdate function'));
        }

        this._layers.push(layer);
      }

      if (layer.object3d && !layer.object3d.parent && layer.object3d !== this.scene) {
        this.scene.add(layer.object3d);
      }

      Promise.all(layer._promises).then(function () {
        layer._resolve();

        _this2.notifyChange(parentLayer || layer, false);

        if (!_this2._frameRequesters[_MainLoop.MAIN_LOOP_EVENTS.UPDATE_END] || !_this2._frameRequesters[_MainLoop.MAIN_LOOP_EVENTS.UPDATE_END].includes(_this2._allLayersAreReadyCallback)) {
          _this2.addFrameRequester(_MainLoop.MAIN_LOOP_EVENTS.UPDATE_END, _this2._allLayersAreReadyCallback);
        }

        _this2.dispatchEvent({
          type: VIEW_EVENTS.LAYER_ADDED,
          layerId: layer.id
        });
      }, layer._reject);
      return layer.whenReady;
    }
    /**
     * Removes a specific imagery layer from the current layer list. This removes layers inserted with attach().
     * @example
     * view.removeLayer('layerId');
     * @param      {string}   layerId      The identifier
     * @return     {boolean}
     */

  }, {
    key: "removeLayer",
    value: function removeLayer(layerId) {
      var layer = this.getLayerById(layerId);

      if (layer) {
        var parentLayer = layer.parent; // Remove and dispose all nodes

        layer["delete"](); // Detach layer if it's attached

        if (parentLayer && !parentLayer.detach(layer)) {
          throw new Error("Error to detach ".concat(layerId, " from ").concat(parentLayer.id));
        } else if (parentLayer == undefined) {
          // Remove layer from viewer
          this._layers.splice(this._layers.findIndex(function (l) {
            return l.id == layerId;
          }), 1);
        }

        if (layer.isColorLayer) {
          // Update color layers sequence
          var imageryLayers = this.getLayers(function (l) {
            return l.isColorLayer;
          });

          var _iterator4 = _createForOfIteratorHelper(imageryLayers),
              _step4;

          try {
            for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
              var color = _step4.value;

              if (color.sequence > layer.sequence) {
                color.sequence--;
              }
            }
          } catch (err) {
            _iterator4.e(err);
          } finally {
            _iterator4.f();
          }
        } // Remove unused cache in all viewers
        // count of times the source is used in all viewer


        var sharedSourceCount = 0;

        var _iterator5 = _createForOfIteratorHelper(viewers),
            _step5;

        try {
          for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
            var view = _step5.value;
            // add count of times the source is used in other layers
            sharedSourceCount += view.getLayers(function (l) {
              return l.source.uid == layer.source.uid && l.crs == layer.crs;
            }).length;
          } // if sharedSourceCount equals to 0 so remove unused cache for this CRS

        } catch (err) {
          _iterator5.e(err);
        } finally {
          _iterator5.f();
        }

        layer.source.onLayerRemoved({
          unusedCrs: sharedSourceCount == 0 ? layer.crs : undefined
        });
        this.notifyChange(this.camera);
        this.dispatchEvent({
          type: VIEW_EVENTS.LAYER_REMOVED,
          layerId: layerId
        });
        return true;
      } else {
        throw new Error("".concat(layerId, " doesn't exist"));
      }
    }
    /**
     * Notifies the scene it needs to be updated due to changes exterior to the
     * scene itself (e.g. camera movement).
     * non-interactive events (e.g: texture loaded)
     * @param {*} changeSource
     * @param {boolean} needsRedraw - indicates if notified change requires a full scene redraw.
     */

  }, {
    key: "notifyChange",
    value: function notifyChange() {
      var changeSource = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : undefined;
      var needsRedraw = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;

      if (changeSource) {
        this._changeSources.add(changeSource);

        if (changeSource.isTileMesh || changeSource.isCamera) {
          this._fullSizeDepthBuffer.needsUpdate = true;
        }
      }

      this.mainLoop.scheduleViewUpdate(this, needsRedraw);
    }
    /**
     * Get all layers, with an optionnal filter applied.
     * The filter method will be called with 2 args:
     *   - 1st: current layer
     *   - 2nd: (optional) the geometry layer to which the current layer is attached
     * @example
     * // get all layers
     * view.getLayers();
     * // get all color layers
     * view.getLayers(layer => layer.isColorLayer);
     * // get all elevation layers
     * view.getLayers(layer => layer.isElevationLayer);
     * // get all geometry layers
     * view.getLayers(layer => layer.isGeometryLayer);
     * // get one layer with id
     * view.getLayers(layer => layer.id === 'itt');
     * @param {function(Layer):boolean} filter
     * @returns {Array<Layer>}
     */

  }, {
    key: "getLayers",
    value: function getLayers(filter) {
      var result = [];

      var _iterator6 = _createForOfIteratorHelper(this._layers),
          _step6;

      try {
        for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
          var layer = _step6.value;

          if (!filter || filter(layer)) {
            result.push(layer);
          }

          if (layer.attachedLayers) {
            var _iterator7 = _createForOfIteratorHelper(layer.attachedLayers),
                _step7;

            try {
              for (_iterator7.s(); !(_step7 = _iterator7.n()).done;) {
                var attached = _step7.value;

                if (!filter || filter(attached, layer)) {
                  result.push(attached);
                }
              }
            } catch (err) {
              _iterator7.e(err);
            } finally {
              _iterator7.f();
            }
          }
        }
      } catch (err) {
        _iterator6.e(err);
      } finally {
        _iterator6.f();
      }

      return result;
    }
    /**
     * Gets the layer by identifier.
     *
     * @param {String}  layerId  The layer identifier
     * @return {Layer}  The layer by identifier.
     */

  }, {
    key: "getLayerById",
    value: function getLayerById(layerId) {
      return this.getLayers(function (l) {
        return l.id === layerId;
      })[0];
    }
    /**
     * @name FrameRequester
     * @function
     *
     * @description
     * Method that will be called each time the `MainLoop` updates. This function
     * will be given as parameter the delta (in ms) between this update and the
     * previous one, and whether or not we just started to render again. This update
     * is considered as the "next" update if `view.notifyChange` was called during a
     * precedent update. If `view.notifyChange` has been called by something else
     * (other micro/macrotask, UI events etc...), then this update is considered as
     * being the "first". It can also receive optional arguments, depending on the
     * attach point of this function. Currently only `BEFORE_LAYER_UPDATE /
     * AFTER_LAYER_UPDATE` attach points provide an additional argument: the layer
     * being updated.
     * <br><br>
     *
     * This means that if a `frameRequester` function wants to animate something, it
     * should keep on calling `view.notifyChange` until its task is done.
     * <br><br>
     *
     * Implementors of `frameRequester` should keep in mind that this function will
     * be potentially called at each frame, thus care should be given about
     * performance.
     * <br><br>
     *
     * Typical frameRequesters are controls, module wanting to animate moves or UI
     * elements etc... Basically anything that would want to call
     * requestAnimationFrame.
     *
     * @param {number} dt
     * @param {boolean} updateLoopRestarted
     * @param {...*} args
     */

    /**
     * Add a frame requester to this view.
     *
     * FrameRequesters can activate the MainLoop update by calling view.notifyChange.
     *
     * @param {String} when - decide when the frameRequester should be called during
     * the update cycle. Can be any of {@link MAIN_LOOP_EVENTS}.
     * @param {FrameRequester} frameRequester - this function will be called at each
     * MainLoop update with the time delta between last update, or 0 if the MainLoop
     * has just been relaunched.
     */

  }, {
    key: "addFrameRequester",
    value: function addFrameRequester(when, frameRequester) {
      if (typeof frameRequester !== 'function') {
        throw new Error('frameRequester must be a function');
      }

      if (!this._frameRequesters[when]) {
        this._frameRequesters[when] = [frameRequester];
      } else {
        this._frameRequesters[when].push(frameRequester);
      }
    }
    /**
     * Remove a frameRequester.
     * The effective removal will happen either later; at worst it'll be at
     * the beginning of the next frame.
     *
     * @param {String} when - attach point of this requester. Can be any of
     * {@link MAIN_LOOP_EVENTS}.
     * @param {FrameRequester} frameRequester
     */

  }, {
    key: "removeFrameRequester",
    value: function removeFrameRequester(when, frameRequester) {
      if (this._frameRequesters[when].includes(frameRequester)) {
        this._delayedFrameRequesterRemoval.push({
          when: when,
          frameRequester: frameRequester
        });
      } else {
        console.error('Invalid call to removeFrameRequester: frameRequester isn\'t registered');
      }
    }
    /**
     * Removes all frame requesters.
     */

  }, {
    key: "removeAllFrameRequesters",
    value: function removeAllFrameRequesters() {
      for (var when in this._frameRequesters) {
        if (Object.prototype.hasOwnProperty.call(this._frameRequesters, when)) {
          var frameRequesters = this._frameRequesters[when];

          var _iterator8 = _createForOfIteratorHelper(frameRequesters),
              _step8;

          try {
            for (_iterator8.s(); !(_step8 = _iterator8.n()).done;) {
              var frameRequester = _step8.value;
              this.removeFrameRequester(when, frameRequester);
            }
          } catch (err) {
            _iterator8.e(err);
          } finally {
            _iterator8.f();
          }
        }
      }

      this._executeFrameRequestersRemovals();
    }
    /**
     * Removes all viewer events.
     */

  }, {
    key: "removeAllEvents",
    value: function removeAllEvents() {
      if (this._listeners === undefined) {
        return;
      }

      for (var type in this._listeners) {
        if (Object.prototype.hasOwnProperty.call(this._listeners, type)) {
          delete this._listeners[type];
        }
      }

      this._listeners = undefined;
    }
  }, {
    key: "_executeFrameRequestersRemovals",
    value: function _executeFrameRequestersRemovals() {
      var _iterator9 = _createForOfIteratorHelper(this._delayedFrameRequesterRemoval),
          _step9;

      try {
        for (_iterator9.s(); !(_step9 = _iterator9.n()).done;) {
          var toDelete = _step9.value;

          var index = this._frameRequesters[toDelete.when].indexOf(toDelete.frameRequester);

          if (index >= 0) {
            this._frameRequesters[toDelete.when].splice(index, 1);
          } else {
            console.warn('FrameReq has already been removed');
          }
        }
      } catch (err) {
        _iterator9.e(err);
      } finally {
        _iterator9.f();
      }

      this._delayedFrameRequesterRemoval.length = 0;
    }
    /**
     * Execute a frameRequester.
     *
     * @param {String} when - attach point of this (these) requester(s). Can be any
     * of {@link MAIN_LOOP_EVENTS}.
     * @param {Number} dt - delta between this update and the previous one
     * @param {boolean} updateLoopRestarted
     * @param {...*} args - optional arguments
     */

  }, {
    key: "execFrameRequesters",
    value: function execFrameRequesters(when, dt, updateLoopRestarted) {
      if (!this._frameRequesters[when]) {
        return;
      }

      if (this._delayedFrameRequesterRemoval.length > 0) {
        this._executeFrameRequestersRemovals();
      }

      for (var _len = arguments.length, args = new Array(_len > 3 ? _len - 3 : 0), _key = 3; _key < _len; _key++) {
        args[_key - 3] = arguments[_key];
      }

      var _iterator10 = _createForOfIteratorHelper(this._frameRequesters[when]),
          _step10;

      try {
        for (_iterator10.s(); !(_step10 = _iterator10.n()).done;) {
          var frameRequester = _step10.value;

          if (frameRequester.update) {
            frameRequester.update(dt, updateLoopRestarted, args);
          } else {
            frameRequester(dt, updateLoopRestarted, args);
          }
        }
      } catch (err) {
        _iterator10.e(err);
      } finally {
        _iterator10.f();
      }
    }
    /**
     * Extract view coordinates from a mouse-event / touch-event
     * @param {event} event - event can be a MouseEvent or a TouchEvent
     * @param {THREE.Vector2} target - the target to set the view coords in
     * @param {number} [touchIdx=0] - finger index when using a TouchEvent
     * @return {THREE.Vector2} - view coordinates (in pixels, 0-0 = top-left of the View)
     */

  }, {
    key: "eventToViewCoords",
    value: function eventToViewCoords(event) {
      var target = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : _eventCoords;
      var touchIdx = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;
      var br = this.domElement.getBoundingClientRect();

      if (event.touches === undefined || !event.touches.length) {
        var targetBoundingRect = event.target.getBoundingClientRect();
        return target.set(targetBoundingRect.x + event.offsetX - br.x, targetBoundingRect.y + event.offsetY - br.y);
      } else {
        return target.set(event.touches[touchIdx].clientX - br.x, event.touches[touchIdx].clientY - br.y);
      }
    }
    /**
     * Extract normalized coordinates (NDC) from a mouse-event / touch-event
     * @param {event} event - event can be a MouseEvent or a TouchEvent
     * @param {number} touchIdx - finger index when using a TouchEvent (default: 0)
     * @return {THREE.Vector2} - NDC coordinates (x and y are [-1, 1])
     */

  }, {
    key: "eventToNormalizedCoords",
    value: function eventToNormalizedCoords(event) {
      var touchIdx = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
      return this.viewToNormalizedCoords(this.eventToViewCoords(event, _eventCoords, touchIdx));
    }
    /**
     * Convert view coordinates to normalized coordinates (NDC)
     * @param {THREE.Vector2} viewCoords (in pixels, 0-0 = top-left of the View)
     * @param {THREE.Vector2} target
     * @return {THREE.Vector2} - NDC coordinates (x and y are [-1, 1])
     */

  }, {
    key: "viewToNormalizedCoords",
    value: function viewToNormalizedCoords(viewCoords) {
      var target = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : _eventCoords;
      target.x = 2 * (viewCoords.x / this.camera.width) - 1;
      target.y = -2 * (viewCoords.y / this.camera.height) + 1;
      return target;
    }
    /**
     * Convert NDC coordinates to view coordinates
     * @param {THREE.Vector2} ndcCoords
     * @return {THREE.Vector2} - view coordinates (in pixels, 0-0 = top-left of the View)
     */

  }, {
    key: "normalizedToViewCoords",
    value: function normalizedToViewCoords(ndcCoords) {
      _eventCoords.x = (ndcCoords.x + 1) * 0.5 * this.camera.width;
      _eventCoords.y = (ndcCoords.y - 1) * -0.5 * this.camera.height;
      return _eventCoords;
    }
    /**
     * Searches for objects in {@link GeometryLayer} and specified
     * `THREE.Object3D`, under the mouse or at a specified coordinates, in this
     * view.
     *
     * @param {Object} mouseOrEvt - Mouse position in window coordinates (from
     * the top left corner of the window) or `MouseEvent` or `TouchEvent`.
     * @param {number} [radius=0] - The picking will happen in a circle centered
     * on mouseOrEvt. This is the radius of this circle, in pixels.
     * @param {...GeometryLayer|string|Object3D} [where] - Where to look for
     * objects. It can be anything of {@link GeometryLayer}, IDs of layers, or
     * `THREE.Object3D`. If no location is specified, it will query on all
     * {@link GeometryLayer} present in this `View`.
     *
     * @return {Object[]} - An array of objects. Each element contains at least
     * an object property which is the `THREE.Object3D` under the cursor. Then
     * depending on the queried layer/source, there may be additionnal
     * properties (coming from `THREE.Raycaster` for instance).
     *
     * @example
     * view.pickObjectsAt({ x, y })
     * view.pickObjectsAt({ x, y }, 1, 'wfsBuilding')
     * view.pickObjectsAt({ x, y }, 3, 'wfsBuilding', myLayer)
     */

  }, {
    key: "pickObjectsAt",
    value: function pickObjectsAt(mouseOrEvt) {
      var _this3 = this;

      var radius = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;

      for (var _len2 = arguments.length, where = new Array(_len2 > 2 ? _len2 - 2 : 0), _key2 = 2; _key2 < _len2; _key2++) {
        where[_key2 - 2] = arguments[_key2];
      }

      var sources = [];
      where = where.length == 0 ? this.getLayers(function (l) {
        return l.isGeometryLayer;
      }) : where;
      where.forEach(function (l) {
        if (typeof l === 'string') {
          l = _this3.getLayerById(l);
        }

        if (l && (l.isGeometryLayer || l.isObject3D)) {
          sources.push(l);
        }
      });

      if (sources.length == 0) {
        return [];
      }

      var results = [];
      var mouse = mouseOrEvt instanceof Event ? this.eventToViewCoords(mouseOrEvt) : mouseOrEvt;

      for (var _i = 0, _sources = sources; _i < _sources.length; _i++) {
        var source = _sources[_i];

        if (source.isGeometryLayer) {
          if (!source.ready) {
            console.warn('view.pickObjectAt : layer is not ready : ', source);
            continue;
          }

          source.pickObjectsAt(this, mouse, radius, results);
        } else {
          _Picking["default"].pickObjectsAt(this, mouse, radius, source, results);
        }
      }

      return results;
    }
    /**
     * Return the current zoom scale at the central point of the view. This
     * function compute the scale of a map.
     *
     * @param {number} pitch - Screen pitch, in millimeters ; 0.28 by default
     *
     * @return {number} The zoom scale.
     */

  }, {
    key: "getScale",
    value: function getScale() {
      var pitch = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0.28;
      return this.getScaleFromDistance(pitch, this.getDistanceFromCamera());
    }
  }, {
    key: "getScaleFromDistance",
    value: function getScaleFromDistance() {
      var pitch = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0.28;
      var distance = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
      pitch /= 1000;
      var fov = THREE.MathUtils.degToRad(this.camera.camera3D.fov);
      var unit = this.camera.height / (2 * distance * Math.tan(fov * 0.5));
      return pitch * unit;
    }
    /**
     * Given a screen coordinates, get the distance between the projected
     * coordinates and the camera associated to this view.
     *
     * @param {THREE.Vector2} [screenCoord] - The screen coordinate to get the
     * distance at. By default this is the middle of the screen.
     *
     * @return {number} The distance in meters.
     */

  }, {
    key: "getDistanceFromCamera",
    value: function getDistanceFromCamera(screenCoord) {
      this.getPickingPositionFromDepth(screenCoord, positionVector);
      return this.camera.camera3D.position.distanceTo(positionVector);
    }
    /**
     * Get, for a specific screen coordinate, the projected distance on the
     * surface of the main layer of the view.
     *
     * @param {number} [pixels=1] - The size, in pixels, to get in meters.
     * @param {THREE.Vector2} [screenCoord] - The screen coordinate to get the
     * projected distance at. By default, this is the middle of the screen.
     *
     * @return {number} The projected distance in meters.
     */

  }, {
    key: "getPixelsToMeters",
    value: function getPixelsToMeters() {
      var pixels = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var screenCoord = arguments.length > 1 ? arguments[1] : undefined;

      if (this.camera.camera3D.isOrthographicCamera) {
        screenMeters = (this.camera.camera3D.right - this.camera.camera3D.left) / this.camera.camera3D.zoom;
        return pixels * screenMeters / this.camera.width;
      }

      return this.getPixelsToMetersFromDistance(pixels, this.getDistanceFromCamera(screenCoord));
    }
  }, {
    key: "getPixelsToMetersFromDistance",
    value: function getPixelsToMetersFromDistance() {
      var pixels = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var distance = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
      return pixels * distance / this.camera._preSSE;
    }
    /**
     * Get, for a specific screen coordinate, the size in pixels of a projected
     * distance on the surface of the main layer of the view.
     *
     * @param {number} [meters=1] - The size, in meters, to get in pixels.
     * @param {THREE.Vector2} [screenCoord] - The screen coordinate to get the
     * projected distance at. By default, this is the middle of the screen.
     *
     * @return {number} The projected distance in pixels.
     */

  }, {
    key: "getMetersToPixels",
    value: function getMetersToPixels() {
      var meters = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var screenCoord = arguments.length > 1 ? arguments[1] : undefined;

      if (this.camera.camera3D.isOrthographicCamera) {
        screenMeters = (this.camera.camera3D.right - this.camera.camera3D.left) / this.camera.camera3D.zoom;
        return meters * this.camera.width / screenMeters;
      }

      return this.getMetersToPixelsFromDistance(meters, this.getDistanceFromCamera(screenCoord));
    }
  }, {
    key: "getMetersToPixelsFromDistance",
    value: function getMetersToPixelsFromDistance() {
      var meters = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1;
      var distance = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
      return this.camera._preSSE * meters / distance;
    }
    /**
     * Searches for {@link Feature} in {@link ColorLayer}, under the mouse of at
     * a specified coordinates, in this view.
     *
     * @param {Object} mouseOrEvt - Mouse position in window coordinates (from
     * the top left corner of the window) or `MouseEvent` or `TouchEvent`.
     * @param {number} [radius=3] - The picking will happen in a circle centered
     * on mouseOrEvt. This is the radius of this circle, in pixels.
     * @param {...ColorLayer|GeometryLayer|string} [where] - The layers to look
     * into. If not specified, all {@link ColorLayer} and {@link GeometryLayer}
     * layers of this view will be looked in.
     *
     * @return {Object} - An object, with a property per layer. For example,
     * looking for features on layers `wfsBuilding` and `wfsRoads` will give an
     * object like `{ wfsBuilding: [...], wfsRoads: [] }`. Each property is made
     * of an array, that can be empty or filled with found features.
     *
     * @example
     * view.pickFeaturesAt({ x, y });
     * view.pickFeaturesAt({ x, y }, 1, 'wfsBuilding');
     * view.pickFeaturesAt({ x, y }, 3, 'wfsBuilding', myLayer);
     */

  }, {
    key: "pickFeaturesAt",
    value: function pickFeaturesAt(mouseOrEvt) {
      var _this4 = this;

      var radius = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 3;

      for (var _len3 = arguments.length, where = new Array(_len3 > 2 ? _len3 - 2 : 0), _key3 = 2; _key3 < _len3; _key3++) {
        where[_key3 - 2] = arguments[_key3];
      }

      if (Array.isArray(where[0])) {
        console.warn('Deprecated: the ...where argument of View#pickFeaturesAt should not be an array anymore, but a list: use the spread operator if needed.');
        where = where[0];
      }

      var layers = [];
      var result = {};
      where = where.length == 0 ? this.getLayers(function (l) {
        return l.isColorLayer || l.isGeometryLayer;
      }) : where;
      where.forEach(function (l) {
        if (typeof l === 'string') {
          l = _this4.getLayerById(l);
        }

        if (l && l.isLayer) {
          result[l.id] = [];

          if (l.isColorLayer) {
            layers.push(l.id);
          }
        }
      }); // Get the mouse coordinates to the correct system

      var mouse = mouseOrEvt instanceof Event ? this.eventToViewCoords(mouseOrEvt, _eventCoords) : mouseOrEvt;
      var objects = this.pickObjectsAt.apply(this, [mouse, radius].concat((0, _toConsumableArray2["default"])(where)));

      if (objects.length > 0) {
        objects.forEach(function (o) {
          return result[o.layer.id].push(o);
        });
      }

      if (layers.length == 0) {
        return result;
      }

      this.getPickingPositionFromDepth(mouse, positionVector);
      var distance = this.camera.camera3D.position.distanceTo(positionVector);
      coordinates.setFromVector3(positionVector); // Get the correct precision; the position variable will be set in this
      // function.

      var precision;
      var precisions = {
        M: this.getPixelsToMetersFromDistance(radius, distance),
        D: 0.001 * radius
      };

      if (this.isPlanarView) {
        precisions.D = precisions.M;
      } else if (this.getPixelsToDegrees) {
        precisions.D = this.getMetersToDegrees(precisions.M);
      } // Get the tile corresponding to where the cursor is


      var tiles = _Picking["default"].pickTilesAt(this, mouse, radius, this.tileLayer);

      var _iterator11 = _createForOfIteratorHelper(tiles),
          _step11;

      try {
        for (_iterator11.s(); !(_step11 = _iterator11.n()).done;) {
          var tile = _step11.value;

          if (!tile.object.material) {
            continue;
          }

          var _iterator12 = _createForOfIteratorHelper(tile.object.material.getLayers(layers)),
              _step12;

          try {
            for (_iterator12.s(); !(_step12 = _iterator12.n()).done;) {
              var materialLayer = _step12.value;

              var _iterator13 = _createForOfIteratorHelper(materialLayer.textures),
                  _step13;

              try {
                for (_iterator13.s(); !(_step13 = _iterator13.n()).done;) {
                  var texture = _step13.value;

                  if (!texture.features) {
                    continue;
                  }

                  precision = _Crs["default"].isMetricUnit(texture.features.crs) ? precisions.M : precisions.D;
                  result[materialLayer.id] = result[materialLayer.id].concat(_FeaturesUtils["default"].filterFeaturesUnderCoordinate(coordinates, texture.features, precision));
                }
              } catch (err) {
                _iterator13.e(err);
              } finally {
                _iterator13.f();
              }
            }
          } catch (err) {
            _iterator12.e(err);
          } finally {
            _iterator12.f();
          }
        }
      } catch (err) {
        _iterator11.e(err);
      } finally {
        _iterator11.f();
      }

      return result;
    }
  }, {
    key: "readDepthBuffer",
    value: function readDepthBuffer(x, y, width, height, buffer) {
      var g = this.mainLoop.gfxEngine;
      var currentWireframe = this.tileLayer.wireframe;
      var currentOpacity = this.tileLayer.opacity;
      var currentVisibility = this.tileLayer.visible;

      if (currentWireframe) {
        this.tileLayer.wireframe = false;
      }

      if (currentOpacity < 1.0) {
        this.tileLayer.opacity = 1.0;
      }

      if (!currentVisibility) {
        this.tileLayer.visible = true;
      }

      var restore = this.tileLayer.level0Nodes.map(function (n) {
        return _RenderMode["default"].push(n, _RenderMode["default"].MODES.DEPTH);
      });
      buffer = g.renderViewToBuffer({
        camera: this.camera,
        scene: this.tileLayer.object3d
      }, {
        x: x,
        y: y,
        width: width,
        height: height,
        buffer: buffer
      });
      restore.forEach(function (r) {
        return r();
      });

      if (this.tileLayer.wireframe !== currentWireframe) {
        this.tileLayer.wireframe = currentWireframe;
      }

      if (this.tileLayer.opacity !== currentOpacity) {
        this.tileLayer.opacity = currentOpacity;
      }

      if (this.tileLayer.visible !== currentVisibility) {
        this.tileLayer.visible = currentVisibility;
      }

      return buffer;
    }
    /**
     * Returns the world position (view's crs: referenceCrs) under view coordinates.
     * This position is computed with depth buffer.
     *
     * @param      {THREE.Vector2}  mouse  position in view coordinates (in pixel), if it's null so it's view's center.
     * @param      {THREE.Vector3}  [target=THREE.Vector3()] target. the result will be copied into this Vector3. If not present a new one will be created.
     * @return     {THREE.Vector3}  the world position in view's crs: referenceCrs.
     */

  }, {
    key: "getPickingPositionFromDepth",
    value: function getPickingPositionFromDepth(mouse) {
      var target = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : new THREE.Vector3();

      if (!this.tileLayer || this.tileLayer.level0Nodes.length == 0 || !this.tileLayer.level0Nodes[0]) {
        target = undefined;
        return;
      }

      var l = this.mainLoop;

      var viewPaused = l.scheduler.commandsWaitingExecutionCount() == 0 && l.renderingState == _MainLoop.RENDERING_PAUSED;

      var g = l.gfxEngine;
      var dim = g.getWindowSize();
      var camera = this.camera.camera3D;
      mouse = mouse || dim.clone().multiplyScalar(0.5);
      mouse.x = Math.floor(mouse.x);
      mouse.y = Math.floor(mouse.y); // Prepare state

      var prev = camera.layers.mask;
      camera.layers.mask = 1 << this.tileLayer.threejsLayer; // Render/Read to buffer

      var buffer;

      if (viewPaused) {
        if (this._fullSizeDepthBuffer.needsUpdate) {
          this.readDepthBuffer(0, 0, dim.x, dim.y, this._fullSizeDepthBuffer);
          this._fullSizeDepthBuffer.needsUpdate = false;
        }

        var id = ((dim.y - mouse.y - 1) * dim.x + mouse.x) * 4;
        buffer = this._fullSizeDepthBuffer.slice(id, id + 4);
      } else {
        buffer = this.readDepthBuffer(mouse.x, mouse.y, 1, 1, this._pixelDepthBuffer);
      }

      screen.x = mouse.x / dim.x * 2 - 1;
      screen.y = -(mouse.y / dim.y) * 2 + 1;

      if (_Capabilities["default"].isLogDepthBufferSupported() && camera.type == 'PerspectiveCamera') {
        // TODO: solve this part with gl_FragCoord_Z and unproject
        // Origin
        ray.origin.copy(camera.position); // Direction

        ray.direction.set(screen.x, screen.y, 0.5); // Unproject

        matrix.multiplyMatrices(camera.matrixWorld, matrix.copy(camera.projectionMatrix).invert());
        ray.direction.applyMatrix4(matrix);
        ray.direction.sub(ray.origin);
        direction.set(0, 0, 1.0);
        direction.applyMatrix4(matrix);
        direction.sub(ray.origin);
        var angle = direction.angleTo(ray.direction);
        var orthoZ = g.depthBufferRGBAValueToOrthoZ(buffer, camera);
        var length = orthoZ / Math.cos(angle);
        target.addVectors(camera.position, ray.direction.setLength(length));
      } else {
        var gl_FragCoord_Z = g.depthBufferRGBAValueToOrthoZ(buffer, camera);
        target.set(screen.x, screen.y, gl_FragCoord_Z);
        target.unproject(camera);
      }

      camera.layers.mask = prev;

      if (target.length() > 10000000) {
        return undefined;
      }

      return target;
    }
    /**
     * Resize the viewer.
     *
     * @param {number} [width=viewerDiv.clientWidth] - The width to resize the
     * viewer with. By default it is the `clientWidth` of the `viewerDiv`.
     * @param {number} [height=viewerDiv.clientHeight] - The height to resize
     * the viewer with. By default it is the `clientHeight` of the `viewerDiv`.
     */

  }, {
    key: "resize",
    value: function resize(width, height) {
      if (width == undefined) {
        width = this.domElement.clientWidth;
      }

      if (height == undefined) {
        height = this.domElement.clientHeight;
      }

      this._fullSizeDepthBuffer = new Uint8Array(4 * width * height);
      this.mainLoop.gfxEngine.onWindowResize(width, height);
      this.camera.resize(width, height);
      this.notifyChange(this.camera.camera3D);
    }
  }]);
  return View;
}(THREE.EventDispatcher);

var _default = View;
exports["default"] = _default;