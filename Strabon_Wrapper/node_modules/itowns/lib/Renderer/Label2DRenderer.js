"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var THREE = _interopRequireWildcard(require("three"));

function isIntersectedOrOverlaped(a, b) {
  return !(a.left > b.right || a.right < b.left || a.top > b.bottom || a.bottom < b.top);
} // find label in children


function hasLabelChildren(object) {
  var parent = object.parent;
  return parent.material && !parent.material.visible && parent.children.find(function (c) {
    return c.isTileMesh && c.children.find(function (cc) {
      return cc.isLabel;
    });
  });
} // A grid to manage labels on the screen.


var ScreenGrid = /*#__PURE__*/function () {
  function ScreenGrid() {
    var x = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 12;
    var y = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 10;
    var width = arguments.length > 2 ? arguments[2] : undefined;
    var height = arguments.length > 3 ? arguments[3] : undefined;
    (0, _classCallCheck2["default"])(this, ScreenGrid);
    this.x = x;
    this.y = y;
    this.grid = [];
    this.hidden = [];
    this.visible = [];
    this.resize();
    this.reset();
    this.width = width;
    this.height = height;
  } // Reset each cell and hidden and visible.


  (0, _createClass2["default"])(ScreenGrid, [{
    key: "reset",
    value: function reset() {
      for (var i = 0; i < this.x; i++) {
        for (var j = 0; j < this.y; j++) {
          // Splice is prefered to creating a new array, in term of memory
          this.grid[i][j].splice(0, this.grid[i][j].length);
        }
      }

      this.hidden = [];
      this.visible = [];
    } // Add rows if needed — but don't delete anything else. Columns are taken
    // care in reset().

  }, {
    key: "resize",
    value: function resize() {
      for (var i = 0; i < this.x; i++) {
        if (!this.grid[i]) {
          this.grid[i] = [];
        }

        for (var j = 0; j < this.y; j++) {
          if (!this.grid[i][j]) {
            this.grid[i][j] = [];
          }
        }
      }
    } // Insert a label using its boundaries. It is either added to hidden or
    // visible, given the result. The grid is populated with true for every
    // filled cell.

  }, {
    key: "insert",
    value: function insert(obj) {
      var minx = Math.max(0, Math.floor(obj.boundaries.left / this.width * this.x));
      var maxx = Math.min(this.x - 1, Math.floor(obj.boundaries.right / this.width * this.x));
      var miny = Math.max(0, Math.floor(obj.boundaries.top / this.height * this.y));
      var maxy = Math.min(this.y - 1, Math.floor(obj.boundaries.bottom / this.height * this.y));

      for (var i = minx; i <= maxx; i++) {
        for (var j = miny; j <= maxy; j++) {
          if (this.grid[i][j].length > 0) {
            if (this.grid[i][j].some(function (l) {
              return isIntersectedOrOverlaped(l.boundaries, obj.boundaries);
            })) {
              this.hidden.push(obj);
              return false;
            }
          }
        }
      }

      for (var _i = minx; _i <= maxx; _i++) {
        for (var _j = miny; _j <= maxy; _j++) {
          this.grid[_i][_j].push(obj);
        }
      }

      return true;
    }
  }]);
  return ScreenGrid;
}();

var viewProjectionMatrix = new THREE.Matrix4();
var vector = new THREE.Vector3();
/**
 * This renderer is inspired by the
 * [`THREE.CSS2DRenderer`](https://threejs.org/docs/#examples/en/renderers/CSS2DRenderer).
 * It is instanciated in `c3DEngine`, as another renderer to handles Labels.
 */

var Label2DRenderer = /*#__PURE__*/function () {
  function Label2DRenderer() {
    (0, _classCallCheck2["default"])(this, Label2DRenderer);
    this.domElement = document.createElement('div');
    this.domElement.style.overflow = 'hidden';
    this.domElement.style.position = 'absolute';
    this.domElement.style.height = '100%';
    this.domElement.style.width = '100%';
    this.domElement.style.zIndex = 1; // Used to destroy labels that are not added to the DOM

    this.garbage = document.createElement('div');
    this.garbage.style.display = 'none';
    this.domElement.appendChild(this.garbage);
    this.halfWidth = 0;
    this.halfHeight = 0;
    this.grid = new ScreenGrid();
    this.infoTileLayer = undefined;
  }

  (0, _createClass2["default"])(Label2DRenderer, [{
    key: "setSize",
    value: function setSize(width, height) {
      this.domElement.style.width = "".concat(width);
      this.domElement.style.height = "".concat(height);
      this.halfWidth = width / 2;
      this.halfHeight = height / 2;
      this.grid.width = width;
      this.grid.height = height;
      this.grid.x = Math.ceil(width / 20);
      this.grid.y = Math.ceil(height / 20);
      this.grid.resize();
    }
  }, {
    key: "registerLayer",
    value: function registerLayer(layer) {
      this.domElement.appendChild(layer.domElement);
    }
  }, {
    key: "render",
    value: function render(scene, camera) {
      var _this = this;

      if (!this.infoTileLayer || !this.infoTileLayer.layer.attachedLayers.find(function (l) {
        return l.isLabelLayer && l.visible;
      })) {
        return;
      }

      this.grid.reset();
      viewProjectionMatrix.multiplyMatrices(camera.projectionMatrix, camera.matrixWorldInverse);
      this.culling(scene, this.infoTileLayer.displayed.extent); // sort by order, then by visibility inside those subsets
      // https://docs.mapbox.com/help/troubleshooting/optimize-map-label-placement/#label-hierarchy

      this.grid.visible.sort(function (a, b) {
        var r = b.order - a.order;

        if (r == 0) {
          if (!a.visible && b.visible) {
            return 1;
          } else {
            return -1;
          }
        } else {
          return r;
        }
      });
      this.grid.visible.forEach(function (l) {
        if (_this.grid.insert(l)) {
          l.visible = true;
          l.updateCSSPosition();
        }
      });
      this.grid.hidden.forEach(function (label) {
        label.visible = false;
      });
    }
  }, {
    key: "culling",
    value: function culling(object, extent) {
      var _this2 = this;

      if (!object.isLabel) {
        if (!object.visible) {
          this.hideNodeDOM(object);
          return; // Don't go further if the node can't be in the screen space (it
          // does not need to be rendered to continue the culling)
        } else if (object.extent && !object.extent.intersectsExtent(extent)) {
          this.hideNodeDOM(object);
          return;
        }

        this.showNodeDOM(object);
        object.children.forEach(function (c) {
          return _this2.culling(c, extent);
        }); // the presence of the label inside the visible extent and if children has label, we can filter more labels.
      } else if (!extent.isPointInside(object.coordinates) || hasLabelChildren(object)) {
        this.grid.hidden.push(object); // Do some horizon culling (if possible) if the tiles level is small
        // enough. The chosen value of 4 seems to provide a good result.
      } else if (object.parent.level < 4 && object.parent.layer.horizonCulling && object.parent.layer.horizonCulling(object.horizonCullingPoint)) {
        this.grid.hidden.push(object);
      } else {
        vector.setFromMatrixPosition(object.matrixWorld);
        vector.applyMatrix4(viewProjectionMatrix);
        object.updateProjectedPosition(vector.x * this.halfWidth + this.halfWidth, -vector.y * this.halfHeight + this.halfHeight); // Are considered duplicates, labels that have the same screen
        // coordinates and the same base content.

        if (this.grid.visible.some(function (l) {
          return l.projectedPosition.x == object.projectedPosition.x && l.projectedPosition.y == object.projectedPosition.y && l.baseContent == object.baseContent;
        })) {
          object.parent.remove(object);
          this.grid.hidden.push(object);
        } else {
          this.grid.visible.push(object);
        }
      }
    }
  }, {
    key: "removeLabelDOM",
    value: function removeLabelDOM(label) {
      this.garbage.appendChild(label.content);
      this.garbage.innerHTML = '';
    }
  }, {
    key: "hideNodeDOM",
    value: function hideNodeDOM(node) {
      var _this3 = this;

      if (node.domElements) {
        var domElements = Object.values(node.domElements);

        if (domElements.length > 0) {
          domElements.forEach(function (domElement) {
            if (domElement.visible == true) {
              domElement.dom.style.display = 'none';
              domElement.visible = false;
            }
          });
        } else {
          node.children.filter(function (n) {
            return n.isTileMesh;
          }).forEach(function (n) {
            return _this3.hideNodeDOM(n);
          });
        }
      }
    }
  }, {
    key: "showNodeDOM",
    value: function showNodeDOM(node) {
      if (node.domElements) {
        Object.values(node.domElements).forEach(function (domElement) {
          if (domElement.visible == false) {
            domElement.dom.style.display = 'block';
            domElement.visible = true;
          }
        });
      }
    }
  }]);
  return Label2DRenderer;
}();

var _default = Label2DRenderer;
exports["default"] = _default;