"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.ImageryLayers = exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _assertThisInitialized2 = _interopRequireDefault(require("@babel/runtime/helpers/assertThisInitialized"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _LayerUpdateStrategy = require("./LayerUpdateStrategy");

var _InfoLayer = _interopRequireDefault(require("./InfoLayer"));

var _Source = _interopRequireDefault(require("../Source/Source"));

var _Cache = _interopRequireDefault(require("../Core/Scheduler/Cache"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @property {boolean} isLayer - Used to checkout whether this layer is a Layer.
 * Default is true. You should not change this, as it is used internally for
 * optimisation.
 * @property {boolean} ready - This property is false when the layer isn't added.
 * It's true when the layer is added and all initializations are done.
 * @property {Source} source - This source determines the datas to be displayed with the layer.
 * The layer determines how this data are displayed.
 * By example:
 * * For ColorLayer/ElevationLayer, the source datas are rasterised (if it's necessary).
 * * For GeometryLayer, the source datas are converted to meshes (not possible for the raster data sources).
 * @property {Promise} whenReady - this promise is resolved when the layer is added and all initializations are done.
 * This promise is resolved with this layer.
 * This promise is returned by [View#addLayer]{@link View}.
 * @property {boolean} [addLabelLayer=false] - Used to tell if this layer has
 * labels to display from its data. For example, it needs to be set to `true`
 * for a layer with vector tiles. If it's `true` a new `LabelLayer` is added and attached to this `Layer`.
 * @property {object} [zoom] - This property is used only the layer is attached to [TiledGeometryLayer]{@link TiledGeometryLayer}.
 * By example,
 * The layer checks the tile zoom level to determine if the layer is visible in this tile.
 *
 * ![tiled geometry](/docs/static/images/wfszoommaxmin.jpeg)
 * _In `GlobeView`, **red lines** represents the **WGS84 grid** and **orange lines** the Pseudo-mercator grid_
 * _In this example [WFS to 3D objects](http://www.itowns-project.org/itowns/examples/index.html#source_stream_wfs_3d), the building layer zoom min is 14._
 * _In the lower part of the picture, the zoom tiles 14 have buildings, while in the upper part of the picture, the level 13 tiles have no buildings._
 *
 * @property {number} [zoom.max=Infinity] - this is the maximum zoom beyond which it'll be hidden.
 * @property {number} [zoom.min=0] - this is the minimum zoom from which it'll be visible.
 *
 */
var Layer = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(Layer, _THREE$EventDispatche);

  var _super = _createSuper(Layer);

  /**
   * Don't use directly constructor to instance a new Layer. Instead, use
   * another available type of Layer, implement a new one inheriting from this
   * one or use [View#addLayer]{@link View}.
   *
   * @constructor
   * @protected
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Object} config - configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name.
   * @param {Source|boolean} config.source - instantiated Source specifies data source to display.
   * if config.source is a boolean, it can only be false. if config.source is false,
   * the layer doesn't need Source (like debug Layer or procedural layer).
   * @param {number} [config.cacheLifeTime=Infinity] - set life time value in cache.
   * This value is used for [Cache]{@link Cache} expiration mechanism.
   *
   * @example
   * // Add and create a new Layer
   * const newLayer = new Layer('id', options);
   * view.addLayer(newLayer);
   *
   * // Change layer's visibility
   * const layerToChange = view.getLayerById('idLayerToChange');
   * layerToChange.visible = false;
   * view.notifyChange(); // update viewer
   *
   * // Change layer's opacity
   * const layerToChange = view.getLayerById('idLayerToChange');
   * layerToChange.opacity = 0.5;
   * view.notifyChange(); // update viewer
   *
   * // Listen properties
   * const layerToListen = view.getLayerById('idLayerToListen');
   * layerToListen.addEventListener('visible-property-changed', (event) => console.log(event));
   * layerToListen.addEventListener('opacity-property-changed', (event) => console.log(event));
   */
  function Layer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, Layer);

    /* istanbul ignore next */
    if (config.projection) {
      console.warn('Layer projection parameter is deprecated, use crs instead.');
      config.crs = config.crs || config.projection;
    }

    if (config.source === undefined || config.source === true) {
      throw new Error("Layer ".concat(id, " needs Source"));
    }

    _this = _super.call(this);
    _this.isLayer = true;
    Object.assign((0, _assertThisInitialized2["default"])(_this), config);
    Object.defineProperty((0, _assertThisInitialized2["default"])(_this), 'id', {
      value: id,
      writable: false
    }); // Default properties

    _this.options = config.options || {};

    if (!_this.updateStrategy) {
      _this.updateStrategy = {
        type: _LayerUpdateStrategy.STRATEGY_MIN_NETWORK_TRAFFIC,
        options: {}
      };
    }

    _this.defineLayerProperty('frozen', false);

    if (config.zoom) {
      _this.zoom = {
        max: config.zoom.max,
        min: config.zoom.min || 0
      };

      if (_this.zoom.max == undefined) {
        _this.zoom.max = Infinity;
      }
    } else {
      _this.zoom = {
        max: Infinity,
        min: 0
      };
    }

    _this.info = new _InfoLayer["default"]((0, _assertThisInitialized2["default"])(_this));
    _this.source = _this.source || new _Source["default"]({
      url: 'none'
    });
    _this.ready = false;
    _this._promises = [];
    _this.whenReady = new Promise(function (re, rj) {
      _this._resolve = re;
      _this._reject = rj;
    }).then(function () {
      _this.ready = true;

      _this.source.onLayerAdded({
        out: (0, _assertThisInitialized2["default"])(_this)
      });

      return (0, _assertThisInitialized2["default"])(_this);
    });

    _this._promises.push(_this.source.whenReady);

    _this.cache = new _Cache["default"](config.cacheLifeTime);
    _this.mergeFeatures = _this.mergeFeatures === undefined ? true : config.mergeFeatures; // TODO: verify but this.source.filter seems be always undefined.

    _this.filter = _this.filter || _this.source.filter;
    return _this;
  }

  (0, _createClass2["default"])(Layer, [{
    key: "addInitializationStep",
    value: function addInitializationStep() {
      // Possibility to add rejection handler, if it's necessary.
      var resolve;

      this._promises.push(new Promise(function (re) {
        resolve = re;
      }));

      return resolve;
    }
    /**
     * Defines a property for this layer, with a default value and a callback
     * executed when the property changes.
     * <br><br>
     * When changing the property, it also emits an event, named following this
     * convention: `${propertyName}-property-changed`, with `${propertyName}`
     * being replaced by the name of the property.  For example, if the added
     * property name is `frozen`, it will emit a `frozen-property-changed`.
     * <br><br>
     * @example <caption>The emitted event has some properties assigned to it</caption>
     * event = {
     *     new: {
     *         ${propertyName}: * // the new value of the property
     *     },
     *     previous: {
     *         ${propertyName}: * // the previous value of the property
     *     },
     *     target: Layer // the layer it has been dispatched from
     *     type: string // the name of the emitted event
     * }
     *
     * @param {string} propertyName - The name of the property, also used in
     * the emitted event name.
     * @param {*} defaultValue - The default set value.
     * @param {function} [onChange] - The function executed when the property is
     * changed. Parameters are the layer the property is defined on, and the
     * name of the property.
     */

  }, {
    key: "defineLayerProperty",
    value: function defineLayerProperty(propertyName, defaultValue, onChange) {
      var _this2 = this;

      var existing = Object.getOwnPropertyDescriptor(this, propertyName);

      if (!existing || !existing.set) {
        var property = this[propertyName] == undefined ? defaultValue : this[propertyName];
        Object.defineProperty(this, propertyName, {
          get: function get() {
            return property;
          },
          set: function set(newValue) {
            if (property !== newValue) {
              var event = {
                type: "".concat(propertyName, "-property-changed"),
                previous: {},
                "new": {}
              };
              event.previous[propertyName] = property;
              event["new"][propertyName] = newValue;
              property = newValue;

              if (onChange) {
                onChange(_this2, propertyName);
              }

              _this2.dispatchEvent(event);
            }
          }
        });
      }
    } // Placeholder
    // eslint-disable-next-line

  }, {
    key: "convert",
    value: function convert(data) {
      return data;
    }
  }, {
    key: "getData",
    value: function getData(from, to) {
      var _this3 = this;

      var key = this.source.requestToKey(this.source.isVectorSource ? to : from);
      var data = this.cache.getByArray(key);

      if (!data) {
        data = this.source.loadData(from, this).then(function (feat) {
          return _this3.convert(feat, to);
        }, function (err) {
          throw err;
        });
        this.cache.setByArray(data, key);
      }

      return data;
    }
    /**
     * Determines whether the specified feature is valid data.
     *
     * @param      {Feature}  feature  The feature
     * @returns {Feature} the feature is returned if it's valided
     */
    // eslint-disable-next-line

  }, {
    key: "isValidData",
    value: function isValidData() {}
    /**
     * Remove and dispose all objects from layer.
     */
    // eslint-disable-next-line

  }, {
    key: "delete",
    value: function _delete() {
      console.warn('Function delete doesn\'t exist for this layer');
    }
  }]);
  return Layer;
}(THREE.EventDispatcher);

var _default = Layer;
exports["default"] = _default;
var ImageryLayers = {
  // move this to new index
  // After the modification :
  //      * the minimum sequence will always be 0
  //      * the maximum sequence will always be layers.lenght - 1
  // the ordering of all layers (Except that specified) doesn't change
  moveLayerToIndex: function (layer, newIndex, imageryLayers) {
    newIndex = Math.min(newIndex, imageryLayers.length - 1);
    newIndex = Math.max(newIndex, 0);
    var oldIndex = layer.sequence;

    var _iterator = _createForOfIteratorHelper(imageryLayers),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var imagery = _step.value;

        if (imagery.id === layer.id) {
          // change index of specified layer
          imagery.sequence = newIndex;
        } else if (imagery.sequence > oldIndex && imagery.sequence <= newIndex) {
          // down all layers between the old index and new index (to compensate the deletion of the old index)
          imagery.sequence--;
        } else if (imagery.sequence >= newIndex && imagery.sequence < oldIndex) {
          // up all layers between the new index and old index (to compensate the insertion of the new index)
          imagery.sequence++;
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  },
  moveLayerDown: function (layer, imageryLayers) {
    if (layer.sequence > 0) {
      this.moveLayerToIndex(layer, layer.sequence - 1, imageryLayers);
    }
  },
  moveLayerUp: function (layer, imageryLayers) {
    var m = imageryLayers.length - 1;

    if (layer.sequence < m) {
      this.moveLayerToIndex(layer, layer.sequence + 1, imageryLayers);
    }
  },
  getColorLayersIdOrderedBySequence: function (imageryLayers) {
    var copy = Array.from(imageryLayers);
    copy.sort(function (a, b) {
      return a.sequence - b.sequence;
    });
    return copy.map(function (l) {
      return l.id;
    });
  }
};
exports.ImageryLayers = ImageryLayers;