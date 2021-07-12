"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _default = {
  setDefineMapping: function setDefineMapping(object, PROPERTY, mapping) {
    Object.keys(mapping).forEach(function (key) {
      object.defines["".concat(PROPERTY, "_").concat(key)] = mapping[key];
    });
  },
  setDefineProperty: function setDefineProperty(object, property, PROPERTY, initValue) {
    object.defines[PROPERTY] = initValue;
    Object.defineProperty(object, property, {
      get: function get() {
        return object.defines[PROPERTY];
      },
      set: function set(value) {
        if (object.defines[PROPERTY] != value) {
          object.defines[PROPERTY] = value;
          object.needsUpdate = true;
        }
      }
    });
  },
  setUniformProperty: function setUniformProperty(object, property, initValue) {
    object.uniforms[property] = new THREE.Uniform(initValue);
    Object.defineProperty(object, property, {
      get: function get() {
        return object.uniforms[property].value;
      },
      set: function set(value) {
        if (object.uniforms[property].value != value) {
          object.uniforms[property].value = value;
        }
      }
    });
  }
};
exports["default"] = _default;