"use strict";

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

var _RasterLayer2 = _interopRequireDefault(require("./RasterLayer"));

var _LayeredMaterialNodeProcessing = require("../Process/LayeredMaterialNodeProcessing");

var _RasterTile = require("../Renderer/RasterTile");

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * @property {boolean} isElevationLayer - Used to checkout whether this layer is
 * an ElevationLayer. Default is true. You should not change this, as it is used
 * internally for optimisation.
 * @property {number} noDataValue - Used to specify a **null** or **no data value** in the elevation terrain.
 * @property {number} scale - Used to apply a scale on the elevation value. It
 * can be used for exageration of the elevation, like in [this
 * example](https://www.itowns-project.org/itowns/examples/#plugins_pyramidal_tiff).
 * @property {boolean} useColorTextureElevation - the elevation is computed with one color texture channel,
 * `this.colorTextureElevationMaxZ` and `this.colorTextureElevationMinZ`.
 *
 * The formula is:
 *
 * ```js
 * elevation = color.r * (this.colorTextureElevationMaxZ - this.colorTextureElevationMinZ) + this.colorTextureElevationMinZ
 * ```
 * @property {number} colorTextureElevationMinZ - elevation minimum in `useColorTextureElevation` mode.
 * @property {number} colorTextureElevationMaxZ - elevation maximum in `useColorTextureElevation` mode.
 */
var ElevationLayer = /*#__PURE__*/function (_RasterLayer) {
  (0, _inherits2["default"])(ElevationLayer, _RasterLayer);

  var _super = _createSuper(ElevationLayer);

  /**
   * A simple layer, managing an elevation texture to add some reliefs on the
   * plane or globe view for example.
   *
   * @constructor
   * @extends Layer
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Object} [config] - Optional configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name.
   *
   * @example
   * // Create an ElevationLayer
   * const elevation = new ElevationLayer('IGN_MNT', {
   *      source: new WMTSSource({
   *          "url": "https://wxs.ign.fr/3ht7xcw6f7nciopo16etuqp2/geoportail/wmts",
   *           "crs": "EPSG:4326",
   *           "format": "image/x-bil;bits=32",
   *           "name": "ELEVATION.ELEVATIONGRIDCOVERAGE",
   *      }),
   * });
   *
   * // Add the layer
   * view.addLayer(elevation);
   */
  function ElevationLayer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, ElevationLayer);
    _this = _super.call(this, id, config);
    _this.isElevationLayer = true; // This is used to add a factor needed to color texture

    var baseScale = 1.0;

    if (_this.useColorTextureElevation) {
      baseScale = _this.colorTextureElevationMaxZ - _this.colorTextureElevationMinZ;
    }

    _this.defineLayerProperty('scale', _this.scale || 1.0, function (self) {
      self.parent.object3d.traverse(function (obj) {
        if (obj.layer == self.parent && obj.material) {
          obj.material.setElevationScale(self.scale * baseScale);
          obj.obb.updateScaleZ(self.scale);
        }
      });
    });

    return _this;
  }
  /**
   * Setup RasterElevationTile added to TileMesh. This RasterElevationTile handles
   * the elevation texture to displace TileMesh vertices.
   *
   * @param      {TileMesh}  node    The node to apply new RasterElevationTile;
   * @return     {RasterElevationTile}  The raster elevation node added.
   */


  (0, _createClass2["default"])(ElevationLayer, [{
    key: "setupRasterNode",
    value: function setupRasterNode(node) {
      var _this2 = this;

      var rasterElevationNode = new _RasterTile.RasterElevationTile(node.material, this);
      node.material.addLayer(rasterElevationNode);
      node.material.setSequenceElevation(this.id); // bounding box initialisation

      var updateBBox = function () {
        return node.setBBoxZ(rasterElevationNode.min, rasterElevationNode.max, _this2.scale);
      };

      updateBBox(); // listen elevation updating

      rasterElevationNode.addEventListener('updatedElevation', updateBBox);
      return rasterElevationNode;
    }
  }, {
    key: "update",
    value: function update(context, layer, node, parent) {
      return (0, _LayeredMaterialNodeProcessing.updateLayeredMaterialNodeElevation)(context, this, node, parent);
    }
  }]);
  return ElevationLayer;
}(_RasterLayer2["default"]);

var _default = ElevationLayer;
exports["default"] = _default;