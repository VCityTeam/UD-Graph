"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

// See the different constants holding ordinal, name, numElements, byteSize in PointAttributes.cpp in PotreeConverter
// elementByteSize is byteSize / numElements
var POINT_ATTTRIBUTES = {
  POSITION_CARTESIAN: {
    numElements: 3,
    arrayType: Float32Array,
    attributeName: 'position'
  },
  COLOR_PACKED: {
    numElements: 4,
    arrayType: Uint8Array,
    attributeName: 'color',
    normalized: true
  },
  INTENSITY: {
    numElements: 1,
    numByte: 2,
    // using Float32Array because Float16Array doesn't exist
    arrayType: Uint16Array,
    attributeName: 'intensity',
    normalized: true
  },
  CLASSIFICATION: {
    numElements: 1,
    arrayType: Uint8Array,
    attributeName: 'classification',
    normalized: true
  },
  // Note: at the time of writing, PotreeConverter will only generate normals in Oct16 format
  // see PotreeConverter.cpp:121
  // we keep all the historical value to still supports old conversion
  NORMAL_SPHEREMAPPED: {
    numElements: 2,
    arrayType: Uint8Array,
    attributeName: 'sphereMappedNormal'
  },
  // see https://web.archive.org/web/20150303053317/http://lgdv.cs.fau.de/get/1602
  NORMAL_OCT16: {
    numElements: 2,
    arrayType: Uint8Array,
    attributeName: 'oct16Normal'
  },
  NORMAL: {
    numElements: 3,
    arrayType: Float32Array,
    attributeName: 'normal'
  }
};

var _loop = function () {
  var potreeName = _Object$keys[_i];
  var attr = POINT_ATTTRIBUTES[potreeName];
  attr.potreeName = potreeName;
  attr.numByte = attr.numByte || attr.arrayType.BYTES_PER_ELEMENT;
  attr.byteSize = attr.numElements * attr.numByte;
  attr.normalized = attr.normalized || false; // chrome is known to perform badly when we call a method without respecting its arity

  var fnName = "getUint".concat(attr.numByte * 8);
  attr.getValue = attr.numByte === 1 ? function (view, offset) {
    return view[fnName](offset);
  } : function (view, offset) {
    return view[fnName](offset, true);
  };
};

for (var _i = 0, _Object$keys = Object.keys(POINT_ATTTRIBUTES); _i < _Object$keys.length; _i++) {
  _loop();
}

var _default = {
  /** @module PotreeBinParser */

  /** Parse .bin PotreeConverter format and convert to a THREE.BufferGeometry
   * @function parse
   * @param {ArrayBuffer} buffer - the bin buffer.
   * @param {Object} options
   * @param {string[]} options.in.pointAttributes - the point attributes information contained in cloud.js
   * @return {Promise} - a promise that resolves with a THREE.BufferGeometry.
   *
   */
  parse: function (buffer, options) {
    if (!buffer) {
      throw new Error('No array buffer provided.');
    }

    var view = new DataView(buffer); // Format: X1,Y1,Z1,R1,G1,B1,A1,[...],XN,YN,ZN,RN,GN,BN,AN

    var pointByteSize = 0;

    var _iterator = _createForOfIteratorHelper(options["in"].pointAttributes),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var potreeName = _step.value;
        pointByteSize += POINT_ATTTRIBUTES[potreeName].byteSize;
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }

    var numPoints = Math.floor(buffer.byteLength / pointByteSize);
    var geometry = new THREE.BufferGeometry();
    var elemOffset = 0;
    var attrOffset = 0;

    var _iterator2 = _createForOfIteratorHelper(options["in"].pointAttributes),
        _step2;

    try {
      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        var _potreeName = _step2.value;
        var attr = POINT_ATTTRIBUTES[_potreeName];
        var arrayLength = attr.numElements * numPoints;
        var array = new attr.arrayType(arrayLength);

        for (var arrayOffset = 0; arrayOffset < arrayLength; arrayOffset += attr.numElements) {
          for (var elemIdx = 0; elemIdx < attr.numElements; elemIdx++) {
            array[arrayOffset + elemIdx] = attr.getValue(view, attrOffset + elemIdx * attr.numByte);
          }

          attrOffset += pointByteSize;
        }

        elemOffset += attr.byteSize;
        attrOffset = elemOffset;
        geometry.setAttribute(attr.attributeName, new THREE.BufferAttribute(array, attr.numElements, attr.normalized));
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }

    geometry.computeBoundingBox();
    return Promise.resolve(geometry);
  }
};
exports["default"] = _default;