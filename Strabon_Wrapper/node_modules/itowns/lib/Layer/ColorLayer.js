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

var _Style = _interopRequireDefault(require("../Core/Style"));

var _Undeprecator = require("../Core/Deprecated/Undeprecator");

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

/**
 * Fires when the visiblity of the layer has changed.
 * @event ColorLayer#visible-property-changed
 */

/**
 * Fires when the opacity of the layer has changed.
 * @event ColorLayer#opacity-property-changed
 */

/**
 * Fires when the sequence of the layer has changed, meaning that the order of
 * the layer changed in the view it is attached to.
 * @event ColorLayer#sequence-property-changed
 */

/**
 * @property {boolean} isColorLayer - Used to checkout whether this layer is a
 * ColorLayer. Default is true. You should not change this, as it is used
 * internally for optimisation.
 * @property {Style} style - default style apply layer features.
 * @property {boolean} visible - property to display or to hide layer.
 * @property {number} opacity - property to adjust transparency, opacity is between 0. and 1.
 * @property {boolean} transparent - specify if the layer could be transparent.
 * @property {boolean} noTextureParentOutsideLimit - don't parent texture if it's outside limit.
 * @property {number} effect_type - type effect to apply on raster color.
 * if `effect_type` equals:
 * * `0`: no special effect.
 * * `1`: light color to invisible effect.
 * * `2`: white color to invisible effect.
 * * `3`: custom shader effect (defined `ShaderChunk.customBodyColorLayer` and `ShaderChunk.customHeaderColorLayer`).
 * @property {number} effect_parameter - amount value used with effect applied on raster color.
 */
var ColorLayer = /*#__PURE__*/function (_RasterLayer) {
  (0, _inherits2["default"])(ColorLayer, _RasterLayer);

  var _super = _createSuper(ColorLayer);

  /**
   * A simple layer, usually managing a texture to display on a view. For example,
   * it can be an aerial view of the ground or a simple transparent layer with the
   * roads displayed.
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
   * @param {Source} [config.source] - Description and options of the source.
   * @param {number} [config.magFilter] - How the texture is sampled when a texel covers more than one pixel. [see](https://threejs.org/docs/?q=texture#api/en/textures/Texture.magFilter)
   * @param {number} [config.minFilter] - How the texture is sampled when a texel covers less than one pixel. [see](https://threejs.org/docs/?q=texture#api/en/textures/Texture.minFilter)
   * @param {number} [effect_type=0] - type effect to apply on raster color.
   * if `effect_type` equals:
   * * `0`: no special effect.
   * * `1`: light color to invisible effect.
   * * `2`: white color to invisible effect.
   * * `3`: custom shader effect (defined `ShaderChunk.customBodyColorLayer` and `ShaderChunk.customHeaderColorLayer`).
   * @param {number} [effect_parameter=1.0] - amount value used with effect applied on raster color.
   *
   * @example
   * // Create a ColorLayer
   * const color = new ColorLayer('roads', {
   *     source: new  SourceWMTS({
   *          protocol: 'wmts',
   *          url: 'http://server.geo/wmts/....',
   *          format: 'image/png',
   *          name: 'nameService',
   *          tileMatrixSet: 'PM',
   *     }),
   *     transparent: true,
   *     opacity: 0.5,
   * });
   *
   * // Add the layer
   * view.addLayer(color);
   */
  function ColorLayer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, ColorLayer);
    (0, _Undeprecator.deprecatedColorLayerOptions)(config);
    _this = _super.call(this, id, config);
    _this.isColorLayer = true;
    _this.style = new _Style["default"](config.style);

    _this.defineLayerProperty('visible', true);

    _this.defineLayerProperty('opacity', 1.0);

    _this.defineLayerProperty('sequence', 0);

    _this.transparent = config.transparent || _this.opacity < 1.0;
    _this.noTextureParentOutsideLimit = config.source ? config.source.isFileSource : false; // Feature options

    _this.buildExtent = true;
    _this.structure = '2d';
    return _this;
  }
  /**
   * Setup RasterColorTile added to TileMesh. This RasterColorTile handles
   * the ColorLayer textures mapped on this TileMesh.
   *
   * @param      {TileMesh}  node    The node to apply new RasterColorTile;
   * @return     {RasterColorTile}  The raster color node added.
   */


  (0, _createClass2["default"])(ColorLayer, [{
    key: "setupRasterNode",
    value: function setupRasterNode(node) {
      var rasterColorNode = new _RasterTile.RasterColorTile(node.material, this);
      node.material.addLayer(rasterColorNode); // set up ColorLayer ordering.

      node.material.setSequence(this.parent.colorLayersOrder);
      return rasterColorNode;
    }
  }, {
    key: "update",
    value: function update(context, layer, node, parent) {
      return (0, _LayeredMaterialNodeProcessing.updateLayeredMaterialNodeImagery)(context, this, node, parent);
    }
  }]);
  return ColorLayer;
}(_RasterLayer2["default"]);

var _default = ColorLayer;
exports["default"] = _default;