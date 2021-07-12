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

var _Fetcher = _interopRequireDefault(require("../Provider/Fetcher"));

var _PointCloudNode2 = _interopRequireDefault(require("./PointCloudNode"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var size = new THREE.Vector3();
var position = new THREE.Vector3();
var translation = new THREE.Vector3();

function buildId(depth, x, y, z) {
  return "".concat(depth, "-").concat(x, "-").concat(y, "-").concat(z);
}
/**
 * @extends PointCloudNode
 *
 * @property {boolean} isEntwinePointTileNode - Used to checkout whether this
 * node is a EntwinePointTileNode. Default is `true`. You should not change
 * this, as it is used internally for optimisation.
 * @property {number} depth - The depth of the node in the tree - see the
 * [Entwine
 * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
 * @property {number} x - The x coordinate of the node in the tree - see the
 * [Entwine
 * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
 * @property {number} y - The x coordinate of the node in the tree - see the
 * [Entwine
 * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
 * @property {number} z - The x coordinate of the node in the tree - see the
 * [Entwine
 * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
 * @property {string} id - The id of the node, constituted of the four
 * components: `depth-x-y-z`.
 */


var EntwinePointTileNode = /*#__PURE__*/function (_PointCloudNode) {
  (0, _inherits2["default"])(EntwinePointTileNode, _PointCloudNode);

  var _super = _createSuper(EntwinePointTileNode);

  /**
   * Constructs a new instance of EntwinePointTileNode.
   *
   * @constructor
   *
   * @param {number} depth - The depth of the node in the tree - see the
   * [Entwine
   * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
   * @param {number} x - The x coordinate of the node in the tree - see the
   * [Entwine
   * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
   * @param {number} y - The x coordinate of the node in the tree - see the
   * [Entwine
   * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
   * @param {number} z - The x coordinate of the node in the tree - see the
   * [Entwine
   * documentation](https://entwine.io/entwine-point-tile.html#ept-data)
   * @param {EntwinePointTileLayer} layer - The layer the node is attached to.
   * @param {number} [numPoints=0] - The number of points in this node. If
   * `-1`, it means that the octree hierarchy associated to this node needs to
   * be loaded.
   */
  function EntwinePointTileNode(depth, x, y, z, layer) {
    var _this;

    var numPoints = arguments.length > 5 && arguments[5] !== undefined ? arguments[5] : 0;
    (0, _classCallCheck2["default"])(this, EntwinePointTileNode);
    _this = _super.call(this, numPoints, layer);
    _this.isEntwinePointTileNode = true;
    _this.depth = depth;
    _this.x = x;
    _this.y = y;
    _this.z = z;
    _this.id = buildId(depth, x, y, z);
    _this.url = "".concat(_this.layer.source.url, "/ept-data/").concat(_this.id, ".").concat(_this.layer.source.extension);
    return _this;
  }

  (0, _createClass2["default"])(EntwinePointTileNode, [{
    key: "createChildAABB",
    value: function createChildAABB(node) {
      // factor to apply, based on the depth difference (can be > 1)
      var f = Math.pow(2, node.depth - this.depth); // size of the child node bbox (Vector3), based on the size of the
      // parent node, and divided by the factor

      this.bbox.getSize(size).divideScalar(f); // initialize the child node bbox at the location of the parent node bbox

      node.bbox.min.copy(this.bbox.min); // position of the parent node, if it was at the same depth than the
      // child, found by multiplying the tree position by the factor

      position.copy(this).multiplyScalar(f); // difference in position between the two nodes, at child depth, and
      // scale it using the size

      translation.subVectors(node, position).multiply(size); // apply the translation to the child node bbox

      node.bbox.min.add(translation); // use the size computed above to set the max

      node.bbox.max.copy(node.bbox.min).add(size);
    }
  }, {
    key: "octreeIsLoaded",
    get: function get() {
      return this.numPoints >= 0;
    }
  }, {
    key: "loadOctree",
    value: function loadOctree() {
      var _this2 = this;

      return _Fetcher["default"].json("".concat(this.layer.source.url, "/ept-hierarchy/").concat(this.id, ".json"), this.layer.source.networkOptions).then(function (hierarchy) {
        _this2.numPoints = hierarchy[_this2.id];
        var stack = [];
        stack.push(_this2);

        while (stack.length) {
          var node = stack.shift();
          var depth = node.depth + 1;
          var x = node.x * 2;
          var y = node.y * 2;
          var z = node.z * 2;
          node.findAndCreateChild(depth, x, y, z, hierarchy, stack);
          node.findAndCreateChild(depth, x + 1, y, z, hierarchy, stack);
          node.findAndCreateChild(depth, x, y + 1, z, hierarchy, stack);
          node.findAndCreateChild(depth, x + 1, y + 1, z, hierarchy, stack);
          node.findAndCreateChild(depth, x, y, z + 1, hierarchy, stack);
          node.findAndCreateChild(depth, x + 1, y, z + 1, hierarchy, stack);
          node.findAndCreateChild(depth, x, y + 1, z + 1, hierarchy, stack);
          node.findAndCreateChild(depth, x + 1, y + 1, z + 1, hierarchy, stack);
        }
      });
    }
  }, {
    key: "findAndCreateChild",
    value: function findAndCreateChild(depth, x, y, z, hierarchy, stack) {
      var id = buildId(depth, x, y, z);
      var numPoints = hierarchy[id];

      if (typeof numPoints == 'number') {
        var child = new EntwinePointTileNode(depth, x, y, z, this.layer, numPoints);
        this.add(child);
        stack.push(child);
      }
    }
  }]);
  return EntwinePointTileNode;
}(_PointCloudNode2["default"]);

var _default = EntwinePointTileNode;
exports["default"] = _default;