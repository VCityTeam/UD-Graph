"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.computeMinMaxElevation = computeMinMaxElevation;
exports.checkNodeElevationTextureValidity = checkNodeElevationTextureValidity;
exports.insertSignificantValuesFromParent = insertSignificantValuesFromParent;

var _toConsumableArray2 = _interopRequireDefault(require("@babel/runtime/helpers/toConsumableArray"));

var _DEMUtils = require("../Utils/DEMUtils");

function minMax4Corners(texture, pitch, noDataValue) {
  var u = pitch.x;
  var v = pitch.y;
  var w = pitch.z;
  var z = [(0, _DEMUtils.readTextureValueWithBilinearFiltering)({
    noDataValue: noDataValue
  }, texture, u, v), (0, _DEMUtils.readTextureValueWithBilinearFiltering)({
    noDataValue: noDataValue
  }, texture, u + w, v), (0, _DEMUtils.readTextureValueWithBilinearFiltering)({
    noDataValue: noDataValue
  }, texture, u + w, v + w), (0, _DEMUtils.readTextureValueWithBilinearFiltering)({
    noDataValue: noDataValue
  }, texture, u, v + w)].filter(function (v) {
    return v != undefined && v > -10;
  });

  if (z.length) {
    return {
      min: Math.min.apply(Math, (0, _toConsumableArray2["default"])(z)),
      max: Math.max.apply(Math, (0, _toConsumableArray2["default"])(z))
    };
  }
}
/**
  * Calculates the minimum maximum texture elevation with xbil data
  *
  * @param      {THREE.Texture}  texture       The texture to parse
  * @param      {THREE.Vector4}  pitch  The pitch,  restrict zone to parse
 * @param      {number}  noDataValue  No data value
  * @return     {Object}  The minimum maximum elevation.
  */


function computeMinMaxElevation(texture, pitch, noDataValue) {
  var _texture$image = texture.image,
      width = _texture$image.width,
      height = _texture$image.height,
      data = _texture$image.data;

  if (!data) {
    // Return null values means there's no elevation values.
    // They can't be determined.
    // Don't return 0 because the result will be wrong
    return {
      min: null,
      max: null
    };
  } // compute extact minimum and maximum elvation on 4 corners texture.


  var _ref = minMax4Corners(texture, pitch, noDataValue) || {
    max: -Infinity,
    min: Infinity
  },
      min = _ref.min,
      max = _ref.max;

  var sizeX = Math.floor(pitch.z * width);

  if (sizeX > 2) {
    var sizeY = Math.floor(pitch.z * height);
    var xs = Math.floor(pitch.x * width);
    var ys = Math.floor(pitch.y * height);
    var inc = Math.max(Math.floor(sizeX / 32), 2);

    for (var y = ys; y < ys + sizeY; y += inc) {
      var pit = y * (width || 0);
      var x = pit + xs;

      var _limX = x + sizeX;

      for (x; x < _limX; x += inc) {
        var val = data[x];

        if (val > -10 && val != noDataValue) {
          max = Math.max(max, val);
          min = Math.min(min, val);
        }
      }
    }
  }

  if (max === -Infinity || min === Infinity) {
    // Return null values means the elevation values are incoherent
    // They can't be determined.
    // Don't return 0, -Infinity or Infinity because the result will be wrong
    return {
      min: null,
      max: null
    };
  } else {
    return {
      min: min,
      max: max
    };
  }
} // We check if the elevation texture has some significant values through corners


function checkNodeElevationTextureValidity(data, noDataValue) {
  var l = data.length;
  return data[0] > noDataValue && data[l - 1] > noDataValue && data[Math.sqrt(l) - 1] > noDataValue && data[l - Math.sqrt(l)] > noDataValue;
}

function getIndiceWithPitch(i, pitch, w) {
  // Return corresponding indice in parent tile using pitch
  // normalized
  var currentY = Math.floor(i / w) / w; // normalized

  var newX = pitch.x + i % w / w * pitch.z;
  var newY = pitch.y + currentY * pitch.w;
  var newIndice = Math.floor(newY * w) * w + Math.floor(newX * w);
  return newIndice;
} // This function replaces noDataValue by significant values from parent texture


function insertSignificantValuesFromParent(data, dataParent, noDataValue, pitch) {
  for (var i = 0, l = data.length; i < l; ++i) {
    if (data[i] === noDataValue) {
      data[i] = dataParent[getIndiceWithPitch(i, pitch, 256)];
    }
  }
}