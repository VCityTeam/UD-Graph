"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _Utf8Decoder = _interopRequireDefault(require("../Utils/Utf8Decoder"));

var _C3DTBatchTable = _interopRequireDefault(require("../Core/3DTiles/C3DTBatchTable"));

var _default = {
  /** @module PntsParser */

  /** Parse pnts buffer and extract THREE.Points and batch table
   * @function parse
   * @param {ArrayBuffer} buffer - the pnts buffer.
   * @param {Object} registeredExtensions - 3D Tiles extensions registered
   * in the layer
   * @return {Promise} - a promise that resolves with an object containig a THREE.Points (point) and a batch table (batchTable).
   *
   */
  parse: function (buffer, registeredExtensions) {
    if (!buffer) {
      throw new Error('No array buffer provided.');
    }

    var view = new DataView(buffer);
    var byteOffset = 0;
    var pntsHeader = {};
    var batchTable = {};
    var point = {}; // Magic type is unsigned char [4]

    pntsHeader.magic = _Utf8Decoder["default"].decode(new Uint8Array(buffer, byteOffset, 4));
    byteOffset += 4;

    if (pntsHeader.magic) {
      // Version, byteLength, batchTableJSONByteLength, batchTableBinaryByteLength and batchTable types are uint32
      pntsHeader.version = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      pntsHeader.byteLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      pntsHeader.FTJSONLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      pntsHeader.FTBinaryLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      pntsHeader.BTJSONLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT;
      pntsHeader.BTBinaryLength = view.getUint32(byteOffset, true);
      byteOffset += Uint32Array.BYTES_PER_ELEMENT; // feature table

      var FTJSON = {};

      if (pntsHeader.FTJSONLength > 0) {
        var sizeBegin = byteOffset;
        var jsonBuffer = buffer.slice(sizeBegin, pntsHeader.FTJSONLength + sizeBegin);

        var content = _Utf8Decoder["default"].decode(new Uint8Array(jsonBuffer));

        FTJSON = JSON.parse(content);
      } // binary table


      if (pntsHeader.FTBinaryLength > 0) {
        point = parseFeatureBinary(buffer, byteOffset, pntsHeader.FTJSONLength);
      } // batch table


      if (pntsHeader.BTJSONLength > 0) {
        // parse batch table
        var _sizeBegin = byteOffset + pntsHeader.FTJSONLength + pntsHeader.FTBinaryLength;

        var BTBuffer = buffer.slice(_sizeBegin, pntsHeader.BTJSONLength + _sizeBegin);
        batchTable = new _C3DTBatchTable["default"](BTBuffer, pntsHeader.BTBinaryLength, FTJSON.BATCH_LENGTH, registeredExtensions);
      }

      var pnts = {
        point: point,
        batchTable: batchTable
      };
      return Promise.resolve(pnts);
    } else {
      throw new Error('Invalid pnts file.');
    }
  }
};
exports["default"] = _default;

function parseFeatureBinary(array, byteOffset, FTJSONLength) {
  // Init geometry
  var geometry = new THREE.BufferGeometry(); // init Array feature binary

  var subArrayJson = _Utf8Decoder["default"].decode(new Uint8Array(array, byteOffset, FTJSONLength));

  var parseJSON = JSON.parse(subArrayJson);
  var lengthFeature;

  if (parseJSON.POINTS_LENGTH) {
    lengthFeature = parseJSON.POINTS_LENGTH;
  }

  if (parseJSON.POSITION) {
    var byteOffsetPos = parseJSON.POSITION.byteOffset + subArrayJson.length + byteOffset;
    var positionArray = new Float32Array(array, byteOffsetPos, lengthFeature * 3);
    geometry.setAttribute('position', new THREE.BufferAttribute(positionArray, 3));
  }

  if (parseJSON.RGB) {
    var byteOffsetCol = parseJSON.RGB.byteOffset + subArrayJson.length + byteOffset;
    var colorArray = new Uint8Array(array, byteOffsetCol, lengthFeature * 3);
    geometry.setAttribute('color', new THREE.BufferAttribute(colorArray, 3, true));
  }

  if (parseJSON.POSITION_QUANTIZED) {
    throw new Error('For pnts loader, POSITION_QUANTIZED: not yet managed');
  }

  if (parseJSON.RGBA) {
    throw new Error('For pnts loader, RGBA: not yet managed');
  }

  if (parseJSON.RGB565) {
    throw new Error('For pnts loader, RGB565: not yet managed');
  }

  if (parseJSON.NORMAL) {
    throw new Error('For pnts loader, NORMAL: not yet managed');
  }

  if (parseJSON.NORMAL_OCT16P) {
    throw new Error('For pnts loader, NORMAL_OCT16P: not yet managed');
  }

  if (parseJSON.BATCH_ID) {
    throw new Error('For pnts loader, BATCH_ID: not yet managed');
  } // Add RTC feature


  var offset = parseJSON.RTC_CENTER ? new THREE.Vector3().fromArray(parseJSON.RTC_CENTER) : undefined;
  return {
    geometry: geometry,
    offset: offset
  };
}