"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var _Source2 = _interopRequireDefault(require("./Source"));

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var C3DTilesSource = /*#__PURE__*/function (_Source) {
  (0, _inherits2["default"])(C3DTilesSource, _Source);

  var _super = _createSuper(C3DTilesSource);

  function C3DTilesSource(source) {
    var _this;

    (0, _classCallCheck2["default"])(this, C3DTilesSource);
    _this = _super.call(this, source);
    _this.baseUrl = _this.url.slice(0, _this.url.lastIndexOf('/') + 1);
    _this.whenReady = _Fetcher["default"].json(_this.url, _this.networkOptions);
    return _this;
  }

  return C3DTilesSource;
}(_Source2["default"]);

var _default = C3DTilesSource;
exports["default"] = _default;