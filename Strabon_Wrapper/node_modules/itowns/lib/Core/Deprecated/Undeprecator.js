"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.deprecatedFeature2MeshOptions = exports.deprecatedParsingOptionsToNewOne = exports.deprecatedColorLayerOptions = void 0;

var _LayeredMaterial = require("../../Renderer/LayeredMaterial");

var deprecatedColorLayerOptions = function (options) {
  if (options.fx) {
    console.warn('ColorLayer fx is deprecated, use ColorLayer.effect_type and ColorLayer.effect_parameter instead.');

    if (options.fx > 2.0) {
      options.effect_parameter = options.fx;
      options.effect_type = _LayeredMaterial.colorLayerEffects.removeLightColor;
    } else if (options.fx > 0.0) {
      options.effect_parameter = options.fx;
      options.effect_type = _LayeredMaterial.colorLayerEffects.removeWhiteColor;
    }
  }

  return options;
};

exports.deprecatedColorLayerOptions = deprecatedColorLayerOptions;

var deprecatedParsingOptionsToNewOne = function (options) {
  /* istanbul ignore next */
  if (options.crsOut || options.crsIn) {
    console.warn('Parsing options with crsIn and crsOut are deprecated, use { in, out } structure.');
    var newOptions = {
      "in": {},
      out: {}
    };
    newOptions["in"].crs = options.crsIn;
    newOptions["in"].isInverted = options.isInverted;
    newOptions["in"].styles = options.styles;
    newOptions["in"].layers = options.layers;
    newOptions["in"].filter = options.filter;
    newOptions.out.crs = options.crsOut;
    newOptions.out.mergeFeatures = options.mergeFeatures;

    if (options.withAltitude && options.withNormal) {
      console.warn('Parsing options withAltitude and withNormal is deprecated, use out.structure: 2d or 3d.');
      newOptions.out.structure = '3d';
    } else {
      newOptions.out.structure = '2d';
    }

    newOptions.out.filteringExtent = options.filteringExtent;
    newOptions.out.style = options.style;

    if (options.crsOut.overrideAltitudeInToZero !== undefined) {
      console.error('Parsing options out.overrideAltitudeInToZero is removed, use Style.xxx.base_altitude instead');
    }

    newOptions.out.filter = options.filter;
    return newOptions;
  }

  if (options.out) {
    if (options.out.withAltitude !== undefined || options.out.withNormal !== undefined) {
      console.warn('Parsing options out.withAltitude and out.withNormal is deprecated, use out.structure: 2d or 3d.');

      if (options.out.withAltitude && options.out.withNormal) {
        options.out.structure = '3d';
      } else {
        options.out.structure = '2d';
      }
    }

    if (options.out.overrideAltitudeInToZero !== undefined) {
      console.error('Parsing options out.overrideAltitudeInToZero is removed, use Style.xxx.base_altitude instead');
    }
  }

  return options;
};

exports.deprecatedParsingOptionsToNewOne = deprecatedParsingOptionsToNewOne;

var deprecatedFeature2MeshOptions = function (options) {
  if (options.color) {
    console.error('Color convert option is removed, use Style.xxx.color');
  }

  if (options.extrude) {
    console.error('extrude convert option is removed, use Style.fill.extrusion_height instead');
  }

  if (options.altitude) {
    console.error('altitude convert option is removed, use Style.xxx.base_altitude instead');
  }
};

exports.deprecatedFeature2MeshOptions = deprecatedFeature2MeshOptions;
var _default = {};
exports["default"] = _default;