"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var _get2 = _interopRequireDefault(require("@babel/runtime/helpers/get"));

var _inherits2 = _interopRequireDefault(require("@babel/runtime/helpers/inherits"));

var _possibleConstructorReturn2 = _interopRequireDefault(require("@babel/runtime/helpers/possibleConstructorReturn"));

var _getPrototypeOf2 = _interopRequireDefault(require("@babel/runtime/helpers/getPrototypeOf"));

var THREE = _interopRequireWildcard(require("three"));

var _PointCloudNode2 = _interopRequireDefault(require("./PointCloudNode"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

// Create an A(xis)A(ligned)B(ounding)B(ox) for the child `childIndex` of one aabb.
// (PotreeConverter protocol builds implicit octree hierarchy by applying the same
// subdivision algo recursively)
var dHalfLength = new THREE.Vector3();

var PotreeNode = /*#__PURE__*/function (_PointCloudNode) {
  (0, _inherits2["default"])(PotreeNode, _PointCloudNode);

  var _super = _createSuper(PotreeNode);

  function PotreeNode() {
    var _this;

    var numPoints = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
    var childrenBitField = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
    var layer = arguments.length > 2 ? arguments[2] : undefined;
    (0, _classCallCheck2["default"])(this, PotreeNode);
    _this = _super.call(this, numPoints, layer);
    _this.childrenBitField = childrenBitField;
    _this.id = '';
    _this.depth = 0;
    _this.baseurl = layer.source.baseurl;
    return _this;
  }

  (0, _createClass2["default"])(PotreeNode, [{
    key: "add",
    value: function add(node, indexChild, root) {
      (0, _get2["default"])((0, _getPrototypeOf2["default"])(PotreeNode.prototype), "add", this).call(this, node, indexChild);
      node.id = this.id + indexChild;
      node.depth = node.id.length;

      if (node.id.length % this.layer.hierarchyStepSize == 0) {
        node.baseurl = "".concat(root.baseurl, "/").concat(node.id.substr(root.id.length));
      } else {
        node.baseurl = root.baseurl;
      }
    }
  }, {
    key: "createChildAABB",
    value: function createChildAABB(node, childIndex) {
      // Code inspired from potree
      node.bbox.copy(this.bbox);
      this.bbox.getCenter(node.bbox.max);
      dHalfLength.copy(node.bbox.max).sub(this.bbox.min);

      if (childIndex === 1) {
        node.bbox.min.z += dHalfLength.z;
        node.bbox.max.z += dHalfLength.z;
      } else if (childIndex === 3) {
        node.bbox.min.z += dHalfLength.z;
        node.bbox.max.z += dHalfLength.z;
        node.bbox.min.y += dHalfLength.y;
        node.bbox.max.y += dHalfLength.y;
      } else if (childIndex === 0) {//
      } else if (childIndex === 2) {
        node.bbox.min.y += dHalfLength.y;
        node.bbox.max.y += dHalfLength.y;
      } else if (childIndex === 5) {
        node.bbox.min.z += dHalfLength.z;
        node.bbox.max.z += dHalfLength.z;
        node.bbox.min.x += dHalfLength.x;
        node.bbox.max.x += dHalfLength.x;
      } else if (childIndex === 7) {
        node.bbox.min.add(dHalfLength);
        node.bbox.max.add(dHalfLength);
      } else if (childIndex === 4) {
        node.bbox.min.x += dHalfLength.x;
        node.bbox.max.x += dHalfLength.x;
      } else if (childIndex === 6) {
        node.bbox.min.y += dHalfLength.y;
        node.bbox.max.y += dHalfLength.y;
        node.bbox.min.x += dHalfLength.x;
        node.bbox.max.x += dHalfLength.x;
      }
    }
  }, {
    key: "octreeIsLoaded",
    get: function get() {
      return !(this.childrenBitField && this.children.length === 0);
    }
  }, {
    key: "url",
    get: function get() {
      return "".concat(this.baseurl, "/r").concat(this.id, ".").concat(this.layer.source.extension);
    }
  }, {
    key: "loadOctree",
    value: function loadOctree() {
      var _this2 = this;

      var octreeUrl = "".concat(this.baseurl, "/r").concat(this.id, ".").concat(this.layer.source.extensionOctree);
      return this.layer.source.fetcher(octreeUrl, this.layer.source.networkOptions).then(function (blob) {
        var view = new DataView(blob);
        var stack = [];
        var offset = 0;
        _this2.childrenBitField = view.getUint8(0);
        offset += 1;
        _this2.numPoints = view.getUint32(1, true);
        offset += 4;
        stack.push(_this2);

        while (stack.length && offset < blob.byteLength) {
          var snode = stack.shift(); // look up 8 children

          for (var indexChild = 0; indexChild < 8; indexChild++) {
            // does snode have a #indexChild child ?
            if (snode.childrenBitField & 1 << indexChild && offset + 5 <= blob.byteLength) {
              var childrenBitField = view.getUint8(offset);
              offset += 1;

              var numPoints = view.getUint32(offset, true) || _this2.numPoints;

              offset += 4;
              var item = new PotreeNode(numPoints, childrenBitField, _this2.layer);
              snode.add(item, indexChild, _this2);
              stack.push(item);
            }
          }
        }
      });
    }
  }]);
  return PotreeNode;
}(_PointCloudNode2["default"]);

var _default = PotreeNode;
exports["default"] = _default;