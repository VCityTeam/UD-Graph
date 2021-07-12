"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _computeBufferTileGeometry = _interopRequireDefault(require("./Prefab/computeBufferTileGeometry"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

function defaultBuffers(params) {
  params.buildIndexAndUv_0 = true;
  params.center = params.builder.center(params.extent).clone();
  var buffers = (0, _computeBufferTileGeometry["default"])(params);
  buffers.index = new THREE.BufferAttribute(buffers.index, 1);
  buffers.uvs[0] = new THREE.BufferAttribute(buffers.uvs[0], 2);
  buffers.position = new THREE.BufferAttribute(buffers.position, 3);
  buffers.normal = new THREE.BufferAttribute(buffers.normal, 3);

  for (var i = 1; i < params.builder.uvCount; i++) {
    buffers.uvs[1] = new THREE.BufferAttribute(buffers.uvs[1], 1);
  }

  return buffers;
}

var TileGeometry = /*#__PURE__*/function (_THREE$BufferGeometry) {
  (0, _inherits2["default"])(TileGeometry, _THREE$BufferGeometry);

  var _super = _createSuper(TileGeometry);

  function TileGeometry(params) {
    var _this;

    var buffers = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : defaultBuffers(params);
    (0, _classCallCheck2["default"])(this, TileGeometry);
    _this = _super.call(this);
    _this.center = params.center;
    _this.extent = params.extent;

    _this.setIndex(buffers.index);

    _this.setAttribute('position', buffers.position);

    _this.setAttribute('normal', buffers.normal);

    for (var i = 0; i < buffers.uvs.length; i++) {
      _this.setAttribute("uv_".concat(i), buffers.uvs[i]);
    }

    _this.computeBoundingBox();

    _this.OBB = {};
    return _this;
  }

  return TileGeometry;
}(THREE.BufferGeometry);

var _default = TileGeometry;
exports["default"] = _default;