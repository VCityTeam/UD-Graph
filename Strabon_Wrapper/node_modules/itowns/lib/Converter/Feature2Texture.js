"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _Feature = require("../Core/Feature");

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
var matrix = svg.createSVGMatrix();

function drawPolygon(ctx, vertices) {
  var indices = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : [{
    offset: 0,
    count: 1
  }];
  var style = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};
  var size = arguments.length > 4 ? arguments[4] : undefined;
  var extent = arguments.length > 5 ? arguments[5] : undefined;
  var invCtxScale = arguments.length > 6 ? arguments[6] : undefined;
  var canBeFilled = arguments.length > 7 ? arguments[7] : undefined;

  if (vertices.length === 0) {
    return;
  }

  if (style.length) {
    var _iterator = _createForOfIteratorHelper(style),
        _step;

    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var s = _step.value;

        _drawPolygon(ctx, vertices, indices, s, size, extent, invCtxScale, canBeFilled);
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  } else {
    _drawPolygon(ctx, vertices, indices, style, size, extent, invCtxScale, canBeFilled);
  }
}

function _drawPolygon(ctx, vertices, indices, style, size, extent, invCtxScale, canBeFilled) {
  // build contour
  ctx.beginPath();

  var _iterator2 = _createForOfIteratorHelper(indices),
      _step2;

  try {
    for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
      var indice = _step2.value;

      if (indice.extent && indice.extent.intersectsExtent(extent)) {
        var offset = indice.offset * size;
        var count = offset + indice.count * size;
        ctx.moveTo(vertices[offset], vertices[offset + 1]);

        for (var j = offset + size; j < count; j += size) {
          ctx.lineTo(vertices[j], vertices[j + 1]);
        }
      }
    } // draw line or edge of polygon

  } catch (err) {
    _iterator2.e(err);
  } finally {
    _iterator2.f();
  }

  if (style.stroke) {
    strokeStyle(style, ctx, invCtxScale);
    ctx.stroke();
  } // fill polygon only


  if (canBeFilled && style.fill) {
    fillStyle(style, ctx, invCtxScale);
    ctx.fill();
  }
}

function fillStyle(style, ctx, invCtxScale) {
  if (style.fill.pattern && ctx.fillStyle.src !== style.fill.pattern.src) {
    ctx.fillStyle = ctx.createPattern(style.fill.pattern, 'repeat');

    if (ctx.fillStyle.setTransform) {
      ctx.fillStyle.setTransform(matrix.scale(invCtxScale));
    } else {
      console.warn('Raster pattern isn\'t completely supported on Ie and edge');
    }
  } else if (ctx.fillStyle !== style.fill.color) {
    ctx.fillStyle = style.fill.color;
  }

  if (style.fill.opacity !== ctx.globalAlpha) {
    ctx.globalAlpha = style.fill.opacity;
  }
}

function strokeStyle(style, ctx, invCtxScale) {
  if (ctx.strokeStyle !== style.stroke.color) {
    ctx.strokeStyle = style.stroke.color;
  }

  var width = (style.stroke.width || 2.0) * invCtxScale;

  if (ctx.lineWidth !== width) {
    ctx.lineWidth = width;
  }

  var alpha = style.stroke.opacity == undefined ? 1.0 : style.stroke.opacity;

  if (alpha !== ctx.globalAlpha && typeof alpha == 'number') {
    ctx.globalAlpha = alpha;
  }

  if (ctx.lineCap !== style.stroke.lineCap) {
    ctx.lineCap = style.stroke.lineCap;
  }

  ctx.setLineDash(style.stroke.dasharray.map(function (a) {
    return a * invCtxScale * 2;
  }));
}

function drawPoint(ctx, x, y) {
  var style = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};
  var invCtxScale = arguments.length > 4 ? arguments[4] : undefined;
  ctx.beginPath();
  var opacity = style.point.opacity == undefined ? 1.0 : style.point.opacity;

  if (opacity !== ctx.globalAlpha) {
    ctx.globalAlpha = opacity;
  }

  ctx.arc(x, y, (style.point.radius || 3.0) * invCtxScale, 0, 2 * Math.PI, false);

  if (style.point.color) {
    ctx.fillStyle = style.point.color;
    ctx.fill();
  }

  if (style.point.line) {
    ctx.lineWidth = (style.point.width || 1.0) * invCtxScale;
    ctx.strokeStyle = style.point.line;
    ctx.stroke();
  }
}

var coord = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);

function drawFeature(ctx, feature, extent, style, invCtxScale) {
  var extentDim = extent.dimensions();
  var scaleRadius = extentDim.x / ctx.canvas.width;
  var globals = {
    zoom: extent.zoom
  };

  var _iterator3 = _createForOfIteratorHelper(feature.geometries),
      _step3;

  try {
    var _loop = function () {
      var geometry = _step3.value;

      if (geometry.extent.intersectsExtent(extent)) {
        var contextStyle = (geometry.properties.style || style).drawingStylefromContext({
          globals: globals,
          properties: function properties() {
            return geometry.properties;
          }
        });

        if (contextStyle) {
          if (feature.type === _Feature.FEATURE_TYPES.POINT) {
            // cross multiplication to know in the extent system the real size of
            // the point
            var px = (Math.round(contextStyle.point.radius * invCtxScale) || 3 * invCtxScale) * scaleRadius;

            var _iterator4 = _createForOfIteratorHelper(geometry.indices),
                _step4;

            try {
              for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
                var indice = _step4.value;
                var offset = indice.offset * feature.size;
                var count = offset + indice.count * feature.size;

                for (var j = offset; j < count; j += feature.size) {
                  coord.setFromArray(feature.vertices, j);

                  if (extent.isPointInside(coord, px)) {
                    drawPoint(ctx, feature.vertices[j], feature.vertices[j + 1], contextStyle, invCtxScale);
                  }
                }
              }
            } catch (err) {
              _iterator4.e(err);
            } finally {
              _iterator4.f();
            }
          } else {
            drawPolygon(ctx, feature.vertices, geometry.indices, contextStyle, feature.size, extent, invCtxScale, feature.type == _Feature.FEATURE_TYPES.POLYGON);
          }
        }
      }
    };

    for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
      _loop();
    }
  } catch (err) {
    _iterator3.e(err);
  } finally {
    _iterator3.f();
  }
}

var origin = new THREE.Vector3();
var dimension = new THREE.Vector3(0, 0, 1);
var scale = new THREE.Vector3();
var quaternion = new THREE.Quaternion();
var world2texture = new THREE.Matrix4();
var feature2texture = new THREE.Matrix4();
var worldTextureOrigin = new THREE.Vector3();
var featureExtent = new _Extent["default"]('EPSG:4326', 0, 0, 0, 0);
var _default = {
  // backgroundColor is a THREE.Color to specify a color to fill the texture
  // with, given there is no feature passed in parameter
  createTextureFromFeature: function createTextureFromFeature(collection, extent, sizeTexture, style, backgroundColor) {
    var texture;

    if (collection) {
      // A texture is instancied drawn canvas
      // origin and dimension are used to transform the feature's coordinates to canvas's space
      extent.dimensions(dimension);
      var c = document.createElement('canvas');
      coord.crs = extent.crs;
      c.width = sizeTexture;
      c.height = sizeTexture;
      var ctx = c.getContext('2d');

      if (backgroundColor) {
        ctx.fillStyle = backgroundColor.getStyle();
        ctx.fillRect(0, 0, sizeTexture, sizeTexture);
      }

      ctx.globalCompositeOperation = style.globalCompositeOperation || 'source-over';
      ctx.imageSmoothingEnabled = false;
      ctx.lineJoin = 'round'; // transform extent to feature projection

      extent.as(collection.crs, featureExtent); // transform extent to local system

      featureExtent.applyMatrix4(collection.matrixWorldInverse); // compute matrix transformation `world2texture` to convert coordinates to texture coordinates

      if (collection.isInverted) {
        worldTextureOrigin.set(extent.west, extent.north, 0);
        scale.set(ctx.canvas.width, -ctx.canvas.height, 1.0).divide(dimension);
      } else {
        worldTextureOrigin.set(extent.west, extent.south, 0);
        scale.set(ctx.canvas.width, ctx.canvas.height, 1.0).divide(dimension);
      }

      world2texture.compose(worldTextureOrigin.multiply(scale).negate(), quaternion, scale); // compute matrix transformation `feature2texture` to convert features coordinates to texture coordinates

      feature2texture.multiplyMatrices(world2texture, collection.matrixWorld);
      feature2texture.decompose(origin, quaternion, scale);
      ctx.setTransform(scale.x, 0, 0, scale.y, origin.x, origin.y); // to scale line width and radius circle

      var invCtxScale = Math.abs(1 / scale.x); // Draw the canvas

      var _iterator5 = _createForOfIteratorHelper(collection.features),
          _step5;

      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          var feature = _step5.value;
          drawFeature(ctx, feature, featureExtent, feature.style || style, invCtxScale);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }

      texture = new THREE.CanvasTexture(c);
      texture.flipY = collection.isInverted;
    } else if (backgroundColor) {
      var data = new Uint8Array(3);
      data[0] = backgroundColor.r * 255;
      data[1] = backgroundColor.g * 255;
      data[2] = backgroundColor.b * 255;
      texture = new THREE.DataTexture(data, 1, 1, THREE.RGBFormat);
    } else {
      texture = new THREE.Texture();
    }

    return texture;
  }
};
exports["default"] = _default;