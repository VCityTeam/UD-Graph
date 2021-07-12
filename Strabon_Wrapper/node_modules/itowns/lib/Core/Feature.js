"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.FeatureCollection = exports["default"] = exports.FeatureGeometry = exports.FeatureBuildingOptions = exports.FEATURE_TYPES = void 0;

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var THREE = _interopRequireWildcard(require("three"));

var _Extent = _interopRequireDefault(require("./Geographic/Extent"));

var _Coordinates = _interopRequireDefault(require("./Geographic/Coordinates"));

var _Crs = _interopRequireDefault(require("./Geographic/Crs"));

var _Style = _interopRequireDefault(require("./Style"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

function defaultExtent(crs) {
  return new _Extent["default"](crs, Infinity, -Infinity, Infinity, -Infinity);
}

function _extendBuffer(feature, size) {
  feature.vertices.length += size * feature.size;

  if (feature.normals) {
    feature.normals.length = feature.vertices.length;
  }
}

var coordOut = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);
var defaultNormal = new THREE.Vector3(0, 0, 1);
var FEATURE_TYPES = {
  POINT: 0,
  LINE: 1,
  POLYGON: 2
};
exports.FEATURE_TYPES = FEATURE_TYPES;
var typeToStyleProperty = ['point', 'stroke', 'fill'];
/**
 * @property {string} crs - The CRS to convert the input coordinates to.
 * @property {Extent|boolean} [filteringExtent=undefined] - Optional filter to reject
 * features outside of extent. Extent filetring is file extent if filteringExtent is true.
 * @property {boolean} [buildExtent=false] - If true the geometry will
 * have an extent property containing the area covered by the geometry.
 * True if the layer does not inherit from {@link GeometryLayer}.
 * @property {string} forcedExtentCrs - force feature extent crs if buildExtent is true.
 * @property {function} [filter] - Filter function to remove features
 * @property {boolean} [mergeFeatures=true] - If true all geometries are merged by type and multi-type
 * @property {string} [structure='2d'] - data structure type : 2d or 3d.
 * If the structure is 3d, the feature have 3 dimensions by vertices positions and
 * a normal for each vertices.
 * @property {Style} style - The style to inherit when creating
 * style for all new features.
 *
*/

var FeatureBuildingOptions = function FeatureBuildingOptions() {
  (0, _classCallCheck2["default"])(this, FeatureBuildingOptions);
};
/**
 * @property {Extent} extent - The 2D extent containing all the points
 * composing the geometry.
 * @property {Object[]} indices - Contains the indices that define the geometry.
 * Objects stored in this array have two properties, an `offset` and a `count`.
 * The offset is related to the overall number of vertices in the Feature.
 *
 * @property {Object} properties - Properties of the geometry. It can be
 * anything specified in the GeoJSON under the `properties` property.
 */


exports.FeatureBuildingOptions = FeatureBuildingOptions;

var FeatureGeometry = /*#__PURE__*/function () {
  /**
   * @param {Feature} feature geometry
   */
  function FeatureGeometry(feature) {
    (0, _classCallCheck2["default"])(this, FeatureGeometry);
    this.indices = [];
    this.properties = {};
    this.size = feature.size;

    if (feature.extent) {
      this.extent = defaultExtent(feature.extent.crs);
      this._currentExtent = defaultExtent(feature.extent.crs);
    }

    this.altitude = {
      min: Infinity,
      max: -Infinity
    };
  }
  /**
   * Add a new marker to indicate the starting of sub geometry and extends the vertices buffer.
   * Then you have to push new the coordinates of sub geometry.
   * The sub geometry stored in indices, see constructor for more information.
   * @param {number} count - count of vertices
   * @param {Feature} feature - the feature containing the geometry
   */


  (0, _createClass2["default"])(FeatureGeometry, [{
    key: "startSubGeometry",
    value: function startSubGeometry(count, feature) {
      var last = this.indices.length - 1;
      var extent = this.extent ? defaultExtent(this.extent.crs) : undefined;
      var offset = last > -1 ? this.indices[last].offset + this.indices[last].count : feature.vertices.length / this.size;
      this.indices.push({
        offset: offset,
        count: count,
        extent: extent
      });
      this._currentExtent = extent;

      _extendBuffer(feature, count);
    }
    /**
     * After you have pushed new the coordinates of sub geometry without
     * `startSubGeometry`, this function close sub geometry. The sub geometry
     * stored in indices, see constructor for more information.
     * @param {number} count count of vertices
     * @param {Feature} feature - the feature containing the geometry
     */

  }, {
    key: "closeSubGeometry",
    value: function closeSubGeometry(count, feature) {
      var last = this.indices.length - 1;
      var offset = last > -1 ? this.indices[last].offset + this.indices[last].count : feature.vertices.length / this.size - count;
      this.indices.push({
        offset: offset,
        count: count,
        extent: this._currentExtent
      });

      if (this.extent) {
        this.extent.union(this._currentExtent);
        this._currentExtent = defaultExtent(this.extent.crs);
      }
    }
  }, {
    key: "getLastSubGeometry",
    value: function getLastSubGeometry() {
      var last = this.indices.length - 1;
      return this.indices[last];
    }
    /**
     * Push new coordinates in vertices buffer.
     * @param {Coordinates} coordIn The coordinates to push.
     * @param {Feature} feature - the feature containing the geometry
     */

  }, {
    key: "pushCoordinates",
    value: function pushCoordinates(coordIn, feature) {
      if (this.size == 3) {
        // set altitude from context
        var base_altitude = feature.style[typeToStyleProperty[feature.type]].base_altitude;
        coordIn.z = isNaN(base_altitude) ? base_altitude(this.properties, coordIn) : base_altitude;
      }

      coordIn.as(feature.crs, coordOut);
      feature.transformToLocalSystem(coordOut);

      if (feature.normals) {
        coordOut.geodesicNormal.toArray(feature.normals, feature._pos);
      }

      feature._pushValues(coordOut.x, coordOut.y, coordOut.z); // expand extent if present


      if (this._currentExtent) {
        this._currentExtent.expandByCoordinates(feature.useCrsOut ? coordOut : coordIn);
      }

      if (this.size == 3) {
        this.altitude.min = Math.min(this.altitude.min, coordIn.z);
        this.altitude.max = Math.max(this.altitude.max, coordIn.z);
      }
    }
    /**
     * Push new values coordinates in vertices buffer.
     * No geographical conversion is made or the normal doesn't stored.
     * No local transformation is made on coordinates.
     *
     * @param {Feature} feature - the feature containing the geometry
     * @param {number} long The longitude coordinate.
     * @param {number} lat The latitude coordinate.
     * @param {number} [alt=0] The altitude coordinate.
     * @param {THREE.Vector3} [normal=THREE.Vector3(0,0,1)] the normal on coordinates.
     */

  }, {
    key: "pushCoordinatesValues",
    value: function pushCoordinatesValues(feature, _long, lat) {
      var alt = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 0;
      var normal = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : defaultNormal;

      if (feature.normals) {
        normal.toArray(feature.normals, feature._pos);
      }

      feature._pushValues(_long, lat, alt); // expand extent if present


      if (this._currentExtent) {
        this._currentExtent.expandByValuesCoordinates(_long, lat);
      }

      if (this.size == 3) {
        this.altitude.min = Math.min(this.altitude.min, alt);
        this.altitude.max = Math.max(this.altitude.max, alt);
      }
    }
    /**
     * update geometry extent with the last sub geometry extent.
     */

  }, {
    key: "updateExtent",
    value: function updateExtent() {
      if (this.extent) {
        var last = this.indices[this.indices.length - 1];

        if (last) {
          this.extent.union(last.extent);
        }
      }
    }
  }]);
  return FeatureGeometry;
}();

exports.FeatureGeometry = FeatureGeometry;

function push2DValues(value0, value1) {
  this.vertices[this._pos++] = value0;
  this.vertices[this._pos++] = value1;
}

function push3DValues(value0, value1) {
  var value2 = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;
  this.vertices[this._pos++] = value0;
  this.vertices[this._pos++] = value1;
  this.vertices[this._pos++] = value2;
}
/**
 *
 * This class improves and simplifies the construction and conversion of geographic data structures.
 * It's an intermediary structure between geomatic formats and THREE objects.
 *
 * **Warning**, the data (`extent` or `Coordinates`) can be stored in a local system.
 * To use vertices or extent in `Feature.crs` projection,
 * it's necessary to transform `Coordinates` or `Extent` by `FeatureCollection.matrixWorld`.
 *
 * ```js
 * // To have feature extent in featureCollection.crs projection:
 * feature.extent.applyMatrix4(featureCollection.matrixWorld);
 *
 * // To have feature vertex in feature.crs projection:
 * coord.crs = feature.crs;
 * coord.setFromArray(feature.vertices)
 * coord.applyMatrix4(featureCollection.matrixWorld);
 *```
 *
 * @property {string} type - Geometry type, can be `point`, `line`, or
 * `polygon`.
 * @property {number[]} vertices - All the vertices of the Feature.
 * @property {number[]} normals - All the normals of the Feature.
 * @property {number} size - the number of values of the array that should be associated with a coordinates.
 * The size is 3 with altitude and 2 without altitude.
 * @property {string} crs - Geographic or Geocentric coordinates system.
 * @property {FeatureGeometry[]} geometries - An array containing all {@link
 * FeatureGeometry}.
 * @property {Extent?} extent - The extent containing all the geometries
 * composing the feature.
 */


var Feature = /*#__PURE__*/function () {
  /**
   *
   * @param {string} type type of Feature. It can be 'point', 'line' or 'polygon'.
   * @param {FeatureCollection} collection Parent feature collection.
   */
  function Feature(type, collection) {
    (0, _classCallCheck2["default"])(this, Feature);

    if (Object.keys(FEATURE_TYPES).find(function (t) {
      return FEATURE_TYPES[t] === type;
    })) {
      this.type = type;
    } else {
      throw new Error("Unsupported Feature type: ".concat(type));
    }

    this.geometries = [];
    this.vertices = [];
    this.crs = collection.crs;
    this.size = collection.size;
    this.normals = collection.size == 3 ? [] : undefined;
    this.transformToLocalSystem = collection.transformToLocalSystem.bind(collection);

    if (collection.extent) {
      // this.crs is final crs projection, is out projection.
      // If the extent crs is the same then we use output coordinate (coordOut) to expand it.
      this.extent = defaultExtent(collection.extent.crs);
      this.useCrsOut = this.extent.crs == this.crs;
    }

    this._pos = 0;
    this._pushValues = (this.size === 3 ? push3DValues : push2DValues).bind(this);
    this.style = new _Style["default"]({}, collection.style);
    this.altitude = {
      min: Infinity,
      max: -Infinity
    };
  }
  /**
   * Instance a new {@link FeatureGeometry}  and push in {@link Feature}.
   * @returns {FeatureGeometry} the instancied geometry.
   */


  (0, _createClass2["default"])(Feature, [{
    key: "bindNewGeometry",
    value: function bindNewGeometry() {
      var geometry = new FeatureGeometry(this);
      this.geometries.push(geometry);
      return geometry;
    }
    /**
     * Update {@link Extent} feature with {@link Extent} geometry
     * @param {FeatureGeometry} geometry used to update Feature {@link Extent}
     */

  }, {
    key: "updateExtent",
    value: function updateExtent(geometry) {
      if (this.extent) {
        this.extent.union(geometry.extent);
      }

      if (this.size == 3) {
        this.altitude.min = Math.min(this.altitude.min, geometry.altitude.min);
        this.altitude.max = Math.max(this.altitude.max, geometry.altitude.max);
      }
    }
    /**
     * @returns {number} the count of geometry.
     */

  }, {
    key: "geometryCount",
    get: function get() {
      return this.geometries.length;
    }
  }]);
  return Feature;
}();

var _default = Feature;
exports["default"] = _default;

var doNothing = function () {};

var transformToLocalSystem3D = function (coord, collection) {
  coord.geodesicNormal.applyNormalMatrix(collection.normalMatrixInverse);
  return coord.applyMatrix4(collection.matrixWorldInverse);
};

var transformToLocalSystem2D = function (coord, collection) {
  return coord.applyMatrix4(collection.matrixWorldInverse);
};

var axisZ = new THREE.Vector3(0, 0, 1);
var alignYtoEast = new THREE.Quaternion();
/**
 * An object regrouping a list of [features]{@link Feature} and the extent of this collection.
 * **Warning**, the data (`extent` or `Coordinates`) can be stored in a local system.
 * The local system center is the `center` property.
 * To use `Feature` vertices or `FeatureCollection/Feature` extent in FeatureCollection.crs projection,
 * it's necessary to transform `Coordinates` or `Extent` by `FeatureCollection.matrixWorld`.
 *
 * ```js
 * // To have featureCollection extent in featureCollection.crs projection:
 * featureCollection.extent.applyMatrix4(featureCollection.matrixWorld);
 *
 * // To have feature vertex in featureCollection.crs projection:
 * const vertices = featureCollection.features[0].vertices;
 * coord.crs = featureCollection.crs;
 * coord.setFromArray(vertices)
 * coord.applyMatrix4(featureCollection.matrixWorld);
 *```
 *
 * @extends THREE.Object3D
 *
 * @property {Feature[]} features - The array of features composing the
 * collection.
 * @property {Extent?} extent - The 2D extent containing all the features
 * composing the collection. The extent projection is the same local projection `FeatureCollection`.
 * To transform `FeatureCollection.extent` to `FeatureCollection.crs` projection, the transformation matrix must be applied.
 *
 * **WARNING** if crs is `EPSG:4978` because the 3d geocentric system doesn't work with 2D `Extent`,
 * The FeatureCollection.extent projection is the original projection.
 * In this case, there isn't need to transform the extent.
 *
 * @property {string} crs - Geographic or Geocentric coordinates system.
 * @property {boolean} isFeatureCollection - Used to check whether this is FeatureCollection.
 * @property {number} size - The size structure, it's 3 for 3d and 2 for 2d.
 * @property {Style} style - The collection style used to display the feature collection.
 * @property {boolean} isInverted - This option is to be set to the
 * correct value, true or false (default being false), if the computation of
 * the coordinates needs to be inverted to same scheme as OSM, Google Maps
 * or other system. See [this link]{@link
 * https://alastaira.wordpress.com/2011/07/06/converting-tms-tile-coordinates-to-googlebingosm-tile-coordinates}
 * for more informations.
 * @property {THREE.Matrix4} matrixWorldInverse - The matrix world inverse.
 * @property {Coordinates} center - The local center coordinates in `EPSG:4326`.
 * The local system is centred in this center.
 *
 */

var FeatureCollection = /*#__PURE__*/function (_THREE$Object3D) {
  (0, _inherits2["default"])(FeatureCollection, _THREE$Object3D);

  var _super = _createSuper(FeatureCollection);

  /**
   * @param      {FeatureBuildingOptions|Layer}  options  The building options .
   */
  function FeatureCollection(options) {
    var _this;

    (0, _classCallCheck2["default"])(this, FeatureCollection);
    _this = _super.call(this);
    _this.isFeatureCollection = true;
    _this.crs = _Crs["default"].formatToEPSG(options.crs);
    _this.features = [];
    _this.mergeFeatures = options.mergeFeatures === undefined ? true : options.mergeFeatures;
    _this.extent = options.buildExtent ? defaultExtent(options.forcedExtentCrs || _this.crs) : undefined;
    _this.size = options.structure == '3d' ? 3 : 2;
    _this.filterExtent = options.filterExtent;
    _this.style = options.style;
    _this.isInverted = false;
    _this.matrixWorldInverse = new THREE.Matrix4();
    _this.center = new _Coordinates["default"]('EPSG:4326', 0, 0);

    if (_this.size == 2) {
      _this._setLocalSystem = function (center) {
        // set local system center
        center.as('EPSG:4326', _this.center); // set position to local system center

        _this.position.copy(center);

        _this.updateMatrixWorld();

        _this._setLocalSystem = doNothing;
      };

      _this._transformToLocalSystem = transformToLocalSystem2D;
    } else {
      _this._setLocalSystem = function (center) {
        // set local system center
        center.as('EPSG:4326', _this.center);

        if (_this.crs == 'EPSG:4978') {
          // align Z axe to geodesic normal.
          _this.quaternion.setFromUnitVectors(axisZ, center.geodesicNormal); // align Y axe to East


          alignYtoEast.setFromAxisAngle(axisZ, THREE.MathUtils.degToRad(90 + _this.center.longitude));

          _this.quaternion.multiply(alignYtoEast);
        } // set position to local system center


        _this.position.copy(center);

        _this.updateMatrixWorld();

        _this.normalMatrix.getNormalMatrix(_this.matrix);

        _this.normalMatrixInverse = new THREE.Matrix3().copy(_this.normalMatrix).invert();
        _this._setLocalSystem = doNothing;
      };

      _this._transformToLocalSystem = transformToLocalSystem3D;
    }

    _this.altitude = {
      min: Infinity,
      max: -Infinity
    };
    return _this;
  }
  /**
   * Apply the matrix World inverse on the coordinates.
   * This method is used when the coordinates is pushed
   * to transform it in local system.
   *
   * @param   {Coordinates}  coordinates  The coordinates
   * @returns {Coordinates} The coordinates in local system
   */


  (0, _createClass2["default"])(FeatureCollection, [{
    key: "transformToLocalSystem",
    value: function transformToLocalSystem(coordinates) {
      this._setLocalSystem(coordinates);

      return this._transformToLocalSystem(coordinates, this);
    }
    /**
     * Update FeatureCollection extent with `extent` or all features extent if
     * `extent` is `undefined`.
     * @param {Extent} extent
     */

  }, {
    key: "updateExtent",
    value: function updateExtent(extent) {
      if (this.extent) {
        var extents = extent ? [extent] : this.features.map(function (feature) {
          return feature.extent;
        });

        var _iterator = _createForOfIteratorHelper(extents),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var ext = _step.value;
            this.extent.union(ext);
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }

      if (this.size == 3) {
        var _iterator2 = _createForOfIteratorHelper(this.features),
            _step2;

        try {
          for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
            var feature = _step2.value;
            this.altitude.min = Math.min(this.altitude.min, feature.altitude.min);
            this.altitude.max = Math.max(this.altitude.max, feature.altitude.max);
          }
        } catch (err) {
          _iterator2.e(err);
        } finally {
          _iterator2.f();
        }
      }

      this.altitude.min = this.altitude.min == Infinity ? 0 : this.altitude.min;
      this.altitude.max = this.altitude.max == -Infinity ? 0 : this.altitude.max;
    }
    /**
     * Updates the global transform of the object and its descendants.
     *
     * @param {booolean}  force   The force
     */

  }, {
    key: "updateMatrixWorld",
    value: function updateMatrixWorld(force) {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(FeatureCollection.prototype), "updateMatrixWorld", this).call(this, force);
      this.matrixWorldInverse.copy(this.matrixWorld).invert();
    }
    /**
     * Remove features that don't have [FeatureGeometry]{@link FeatureGeometry}.
     */

  }, {
    key: "removeEmptyFeature",
    value: function removeEmptyFeature() {
      this.features = this.features.filter(function (feature) {
        return feature.geometries.length;
      });
    }
    /**
     * Push the `feature` in FeatureCollection.
     * @param {Feature} feature
     */

  }, {
    key: "pushFeature",
    value: function pushFeature(feature) {
      this.features.push(feature);
      this.updateExtent(feature.extent);
    }
  }, {
    key: "requestFeature",
    value: function requestFeature(type, callback) {
      var feature = this.features.find(callback);

      if (feature && this.mergeFeatures) {
        return feature;
      } else {
        var newFeature = new Feature(type, this);
        this.features.push(newFeature);
        return newFeature;
      }
    }
    /**
     * Returns the Feature by type if `mergeFeatures` is `true` or returns the
     * new instance of typed Feature.
     *
     * @param {string} type the type requested
     * @returns {Feature}
     */

  }, {
    key: "requestFeatureByType",
    value: function requestFeatureByType(type) {
      return this.requestFeature(type, function (feature) {
        return feature.type === type;
      });
    }
    /**
     * Returns the Feature by type if `mergeFeatures` is `true` or returns the
     * new instance of typed Feature.
     *
     * @param {string} id the id requested
     * @param {string} type the type requested
     * @returns {Feature}
     */

  }, {
    key: "requestFeatureById",
    value: function requestFeatureById(id, type) {
      return this.requestFeature(type, function (feature) {
        return feature.id === id;
      });
    }
    /**
     * Add a new feature with references to all properties.
     * It allows to have features with different styles
     * without having to duplicate the geometry.
     * @param      {Feature}   feature  The feature to reference.
     * @return     {Feature}  The new referenced feature
     */

  }, {
    key: "newFeatureByReference",
    value: function newFeatureByReference(feature) {
      var ref = new Feature(feature.type, this);
      ref.extent = feature.extent;
      ref.geometries = feature.geometries;
      ref.normals = feature.normals;
      ref.size = feature.size;
      ref.vertices = feature.vertices;
      ref._pos = feature._pos;
      this.features.push(ref);
      return ref;
    }
  }, {
    key: "setParentStyle",
    value: function setParentStyle(style) {
      if (style) {
        this.features.forEach(function (f) {
          f.style.parent = style;
        });
      }
    }
  }]);
  return FeatureCollection;
}(THREE.Object3D);

exports.FeatureCollection = FeatureCollection;