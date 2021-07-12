"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var PointCloudNode = /*#__PURE__*/function (_THREE$EventDispatche) {
  (0, _inherits2["default"])(PointCloudNode, _THREE$EventDispatche);

  var _super = _createSuper(PointCloudNode);

  function PointCloudNode() {
    var _this;

    var numPoints = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
    var layer = arguments.length > 1 ? arguments[1] : undefined;
    (0, _classCallCheck2["default"])(this, PointCloudNode);
    _this = _super.call(this);
    _this.numPoints = numPoints;
    _this.layer = layer;
    _this.children = [];
    _this.bbox = new THREE.Box3();
    _this.sse = -1;
    return _this;
  }

  (0, _createClass2["default"])(PointCloudNode, [{
    key: "add",
    value: function add(node, indexChild) {
      this.children.push(node);
      node.parent = this;
      this.createChildAABB(node, indexChild);
    }
  }, {
    key: "load",
    value: function load() {
      var _this2 = this;

      // Query octree/HRC if we don't have children potreeNode yet.
      if (!this.octreeIsLoaded) {
        this.loadOctree();
      }

      return this.layer.source.fetcher(this.url, this.layer.source.networkOptions).then(function (file) {
        return _this2.layer.source.parse(file, {
          out: _this2.layer,
          "in": _this2.layer.source
        });
      });
    }
  }, {
    key: "findCommonAncestor",
    value: function findCommonAncestor(node) {
      if (node.depth == this.depth) {
        if (node.id == this.id) {
          return node;
        } else if (node.depth != 0) {
          return this.parent.findCommonAncestor(node.parent);
        }
      } else if (node.depth < this.depth) {
        return this.parent.findCommonAncestor(node);
      } else {
        return this.findCommonAncestor(node.parent);
      }
    }
  }]);
  return PointCloudNode;
}(THREE.EventDispatcher);

var _default = PointCloudNode;
exports["default"] = _default;