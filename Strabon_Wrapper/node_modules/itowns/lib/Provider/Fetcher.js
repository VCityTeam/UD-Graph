"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _three = require("three");

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var textureLoader = new _three.TextureLoader();
var SIZE_TEXTURE_TILE = 256;

function checkResponse(response) {
  if (!response.ok) {
    var error = new Error("Error loading ".concat(response.url, ": status ").concat(response.status));
    error.response = response;
    throw error;
  }
}

var arrayBuffer = function (url) {
  var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
  return fetch(url, options).then(function (response) {
    checkResponse(response);
    return response.arrayBuffer();
  });
};

function getTextureFloat(buffer) {
  var isWebGL2 = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;

  if (isWebGL2) {
    var texture = new _three.DataTexture(buffer, SIZE_TEXTURE_TILE, SIZE_TEXTURE_TILE, _three.RedFormat, _three.FloatType);
    texture.internalFormat = 'R32F';
    return texture;
  } else {
    return new _three.DataTexture(buffer, SIZE_TEXTURE_TILE, SIZE_TEXTURE_TILE, _three.AlphaFormat, _three.FloatType);
  }
}
/**
 * Utilitary to fetch resources from a server using the [fetch API]{@link
 * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch}.
 *
 * @module Fetcher
 */


var _default = {
  /**
   * Wrapper over fetch to get some text.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise<string>} Promise containing the text.
   */
  text: function text(url) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return fetch(url, options).then(function (response) {
      checkResponse(response);
      return response.text();
    });
  },

  /**
   * Little wrapper over fetch to get some JSON.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise<Object>} Promise containing the JSON object.
   */
  json: function json(url) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return fetch(url, options).then(function (response) {
      checkResponse(response);
      return response.json();
    });
  },

  /**
   * Wrapper over fetch to get some XML.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise<Document>} Promise containing the XML Document.
   */
  xml: function xml(url) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return fetch(url, options).then(function (response) {
      checkResponse(response);
      return response.text();
    }).then(function (text) {
      return new window.DOMParser().parseFromString(text, 'text/xml');
    });
  },

  /**
   * Wrapper around {@link THREE.TextureLoader}.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   * Note that THREE.js docs mentions `withCredentials`, but it is not
   * actually used in {@link THREE.TextureLoader}.
   *
   * @return {Promise<THREE.Texture>} Promise containing the {@link
   * THREE.Texture}.
   */
  texture: function texture(url) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    var res;
    var rej;
    textureLoader.crossOrigin = options.crossOrigin;
    var promise = new Promise(function (resolve, reject) {
      res = resolve;
      rej = reject;
    });
    textureLoader.load(url, res, function () {}, rej);
    return promise;
  },

  /**
   * Wrapper over fetch to get some ArrayBuffer.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise<ArrayBuffer>} Promise containing the ArrayBuffer.
   */
  arrayBuffer: arrayBuffer,

  /**
   * Wrapper over fetch to get some {@link THREE.DataTexture}.
   *
   * @param {string} url - The URL of the resources to fetch.
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise<THREE.DataTexture>} Promise containing the DataTexture.
   */
  textureFloat: function textureFloat(url) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return arrayBuffer(url, options).then(function (buffer) {
      var floatArray = new Float32Array(buffer);
      var texture = getTextureFloat(floatArray, options.isWebGL2);
      return texture;
    });
  },

  /**
   * Wrapper over fetch to get a bunch of files sharing the same name, but
   * different extensions.
   *
   * @param {string} baseUrl - The shared URL of the resources to fetch.
   * @param {Object} extensions - An object containing arrays. The keys of
   * each of this array are available fetch type, such as `text`, `json` or
   * even `arrayBuffer`. The arrays contains the extensions to append after
   * the `baseUrl` (see example below).
   * @param {Object} options - Fetch options (passed directly to `fetch()`),
   * see [the syntax for more information]{@link
   * https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Syntax}.
   *
   * @return {Promise[]} An array of promises, containing all the files,
   * organized by their extensions (see the example below).
   *
   * @example
   * itowns.Fetcher.multiple('http://geo.server/shapefile', {
   *     // will fetch:
   *     // - http://geo.server/shapefile.shp
   *     // - http://geo.server/shapefile.dbf
   *     // - http://geo.server/shapefile.shx
   *     // - http://geo.server/shapefile.prj
   *     arrayBuffer: ['shp', 'dbf', 'shx'],
   *     text: ['prj'],
   * }).then(function _(result) {
   *     // result looks like:
   *     result = {
   *         shp: ArrayBuffer
   *         dbf: ArrayBuffer
   *         shx: ArrayBuffer
   *         prj: string
   *     };
   * });
   */
  multiple: function multiple(baseUrl, extensions) {
    var _this = this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    var promises = [];
    var url;

    for (var fetchType in extensions) {
      if (!this[fetchType]) {
        throw new Error("".concat(fetchType, " is not a valid Fetcher method."));
      } else {
        var _iterator = _createForOfIteratorHelper(extensions[fetchType]),
            _step;

        try {
          var _loop = function () {
            var extension = _step.value;
            url = "".concat(baseUrl, ".").concat(extension);
            promises.push(_this[fetchType](url, options).then(function (result) {
              return {
                type: extension,
                result: result
              };
            }));
          };

          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            _loop();
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }
    }

    return Promise.all(promises).then(function (result) {
      var all = {};

      var _iterator2 = _createForOfIteratorHelper(result),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var res = _step2.value;
          all[res.type] = res.result;
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      return Promise.resolve(all);
    });
  }
};
exports["default"] = _default;