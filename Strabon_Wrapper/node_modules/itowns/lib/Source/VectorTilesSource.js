"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _mapboxGlStyleSpec = require("@mapbox/mapbox-gl-style-spec");

var _Style = _interopRequireDefault(require("../Core/Style"));

var _TMSSource2 = _interopRequireDefault(require("./TMSSource"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

var _MapBoxUrlParser = _interopRequireDefault(require("../Parser/MapBoxUrlParser"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

function toTMSUrl(url) {
  return url.replace(/\{/g, '${');
}
/**
 * @classdesc
 * VectorTilesSource are object containing informations on how to fetch vector
 * tiles resources.
 *
 * @property {function} filter - function to filter vector tiles layers, the
 * parameter function is a layer.
 * @property {boolean} [symbolToCircle=false] - If true, all symbols from a tile
 * will be considered as circle, and render as circles.
 */


var VectorTilesSource = /*#__PURE__*/function (_TMSSource) {
  (0, _inherits2["default"])(VectorTilesSource, _TMSSource);

  var _super = _createSuper(VectorTilesSource);

  /**
   * @param {Object} source - An object that can contain all properties of a
   * VectorTilesSource and {@link Source}.
   * @param {string|Object} source.style - The URL of the JSON style, of the
   * JSON style directly.
   * @param {string} [source.sprite] - The base URL to load informations about
   * the sprite of the style. If this is set, it overrides the `sprite` value
   * of the `source.style`. A style's sprite property supplies a URL template
   * for loading small images.
   * ```js
   * {
   *      sprite: 'http//:xxxxx/maps/sprites/'
   * }
   * ```
   * A valid sprite source must supply two types of files:
   * * An index file, which is a JSON document containing a description of each image contained in the sprite.
   * * Image files, which are PNG images containing the sprite data.
   *
   * For more specification : [the Mapbox sprite Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sprite/)
   *
   * @param {string} [source.url] - The base URL to load the tiles. If no url
   * is specified, it reads it from the loaded style. Read [the Mapbox Style
   * Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/)
   * for more informations.
   * @param {string} [source.accessToken] - Mapbox access token
   * @constructor
   */
  function VectorTilesSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, VectorTilesSource);
    source.format = 'application/x-protobuf;type=mapbox-vector';
    source.crs = 'EPSG:3857';
    source.isInverted = true;
    source.url = source.url || '.';
    _this = _super.call(this, source);

    var ffilter = source.filter || function () {
      return true;
    };

    _this.layers = {};
    _this.styles = {};
    var promise;
    _this.accessToken = source.accessToken;

    if (source.style) {
      if (typeof source.style == 'string') {
        var styleUrl = _MapBoxUrlParser["default"].normalizeStyleURL(source.style, _this.accessToken);

        promise = _Fetcher["default"].json(styleUrl, _this.networkOptions);
      } else {
        promise = Promise.resolve(source.style);
      }
    } else {
      throw new Error('New VectorTilesSource: style is required');
    }

    _this.whenReady = promise.then(function (style) {
      _this.jsonStyle = style;
      var baseurl = source.sprite || style.sprite;

      if (baseurl) {
        var spriteUrl = _MapBoxUrlParser["default"].normalizeSpriteURL(baseurl, '', '.json', _this.accessToken);

        return _Fetcher["default"].json(spriteUrl, _this.networkOptions).then(function (sprites) {
          _this.sprites = sprites;

          var imgUrl = _MapBoxUrlParser["default"].normalizeSpriteURL(baseurl, '', '.png', _this.accessToken);

          return _Fetcher["default"].texture(imgUrl, _this.networkOptions).then(function (texture) {
            _this.sprites.img = texture.image;
            return style;
          });
        });
      }

      return style;
    }).then(function (style) {
      var s = Object.keys(style.sources)[0];
      var os = style.sources[s];
      style.layers.forEach(function (layer, order) {
        layer.sourceUid = _this.uid;

        if (layer.type === 'background') {
          _this.backgroundLayer = layer;
        } else if (ffilter(layer)) {
          var _style = new _Style["default"]().setFromVectorTileLayer(layer, _this.sprites, order, _this.symbolToCircle);

          _style.zoom.min = layer.minzoom || 0;
          _style.zoom.max = layer.maxzoom || 24;
          _this.styles[layer.id] = _style;

          if (!_this.layers[layer['source-layer']]) {
            _this.layers[layer['source-layer']] = [];
          }

          _this.layers[layer['source-layer']].push({
            id: layer.id,
            order: order,
            filterExpression: (0, _mapboxGlStyleSpec.featureFilter)(layer.filter),
            zoom: _style.zoom
          });
        }
      });

      if (_this.url == '.') {
        if (os.url) {
          var urlSource = _MapBoxUrlParser["default"].normalizeSourceURL(os.url, _this.accessToken);

          return _Fetcher["default"].json(urlSource, _this.networkOptions).then(function (tileJSON) {
            if (tileJSON.tiles[0]) {
              _this.url = toTMSUrl(tileJSON.tiles[0]);
            }
          });
        } else if (os.tiles[0]) {
          _this.url = toTMSUrl(os.tiles[0]);
        }
      }
    });
    return _this;
  }

  return VectorTilesSource;
}(_TMSSource2["default"]);

var _default = VectorTilesSource;
exports["default"] = _default;