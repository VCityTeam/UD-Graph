"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _Feature2Texture = _interopRequireDefault(require("./Feature2Texture"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

var _Crs = _interopRequireDefault(require("../Core/Geographic/Crs"));

var extentTexture = new _Extent["default"]('EPSG:4326', [0, 0, 0, 0]);

var textureLayer = function (texture, layer) {
  texture.generateMipmaps = false;
  texture.magFilter = layer.magFilter || THREE.LinearFilter;
  texture.minFilter = layer.minFilter || THREE.LinearFilter;
  return texture;
};

function textureColorLayer(texture, layer) {
  texture.anisotropy = 16;
  texture.premultiplyAlpha = layer.transparent;
  return textureLayer(texture, layer);
}

var _default = {
  convert: function convert(data, extentDestination, layer) {
    var texture;

    if (data.isFeatureCollection) {
      var backgroundLayer = layer.source.backgroundLayer;
      var backgroundColor = backgroundLayer && backgroundLayer.paint ? new THREE.Color(backgroundLayer.paint['background-color']) : undefined;
      extentDestination.as(_Crs["default"].formatToEPSG(layer.crs), extentTexture);
      texture = _Feature2Texture["default"].createTextureFromFeature(data, extentTexture, 256, layer.style, backgroundColor);
      texture.features = data;
      texture.extent = extentDestination;
    } else if (data.isTexture) {
      texture = data;
    } else {
      throw new Error('Data type is not supported to convert into texture');
    }

    if (layer.isColorLayer) {
      return textureColorLayer(texture, layer);
    } else if (layer.isElevationLayer) {
      if (texture.flipY) {
        // DataTexture default to false, so make sure other Texture types
        // do the same (eg image texture)
        // See UV construction for more details
        texture.flipY = false;
      }

      return textureLayer(texture, layer);
    }
  }
};
exports["default"] = _default;