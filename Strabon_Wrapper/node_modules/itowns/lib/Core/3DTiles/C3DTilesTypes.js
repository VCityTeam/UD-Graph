"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

/**
 * Enumeration of implemented 3D Tiles classes. Used in C3DTExtensions to
 * now which classes ask for extension parsing.
 *
 * @enum {Object} C3DTilesTypes
 *
 * @property {String} tileset - value: 'tileset'
 * @property {String} batchtable - value: 'batchtable'
 * @property {String} boundingVolume - value: 'bounding volume'
 */
var C3DTilesTypes = {
  tileset: 'tileset',
  batchtable: 'batchtable',
  boundingVolume: 'boundingVolume'
};
var _default = C3DTilesTypes;
exports["default"] = _default;