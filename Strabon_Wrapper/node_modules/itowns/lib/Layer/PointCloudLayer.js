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

var _GeometryLayer2 = _interopRequireDefault(require("./GeometryLayer"));

var _PointsMaterial = _interopRequireWildcard(require("../Renderer/PointsMaterial"));

var _Picking = _interopRequireDefault(require("../Core/Picking"));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

var point = new THREE.Vector3();
var bboxMesh = new THREE.Mesh();
var box3 = new THREE.Box3();
bboxMesh.geometry.boundingBox = box3;

function initBoundingBox(elt, layer) {
  elt.tightbbox.getSize(box3.max);
  box3.max.multiplyScalar(0.5);
  box3.min.copy(box3.max).negate();
  elt.obj.boxHelper = new THREE.BoxHelper(bboxMesh);
  elt.obj.boxHelper.geometry = elt.obj.boxHelper.geometry.toNonIndexed();
  elt.obj.boxHelper.computeLineDistances();
  elt.obj.boxHelper.material = elt.childrenBitField ? new THREE.LineDashedMaterial({
    dashSize: 0.25,
    gapSize: 0.25
  }) : new THREE.LineBasicMaterial();
  elt.obj.boxHelper.material.color.setHex(0);
  elt.obj.boxHelper.material.linewidth = 2;
  elt.obj.boxHelper.frustumCulled = false;
  elt.obj.boxHelper.position.copy(elt.tightbbox.min).add(box3.max);
  elt.obj.boxHelper.autoUpdateMatrix = false;
  elt.obj.boxHelper.layers.mask = layer.bboxes.layers.mask;
  layer.bboxes.add(elt.obj.boxHelper);
  elt.obj.boxHelper.updateMatrix();
  elt.obj.boxHelper.updateMatrixWorld();
}

function computeScreenSpaceError(context, pointSize, spacing, elt, distance) {
  if (distance <= 0) {
    return Infinity;
  }

  var pointSpacing = spacing / Math.pow(2, elt.depth); // Estimate the onscreen distance between 2 points

  var onScreenSpacing = context.camera.preSSE * pointSpacing / distance; // [  P1  ]--------------[   P2   ]
  //     <--------------------->      = pointsSpacing (in world coordinates)
  //                                  ~ onScreenSpacing (in pixels)
  // <------>                         = pointSize (in pixels)

  return Math.max(0.0, onScreenSpacing - pointSize);
}

function markForDeletion(elt) {
  if (elt.obj) {
    elt.obj.visible = false;
  }

  if (!elt.notVisibleSince) {
    elt.notVisibleSince = Date.now(); // Set .sse to an invalid value

    elt.sse = -1;
  }

  var _iterator = _createForOfIteratorHelper(elt.children),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var child = _step.value;
      markForDeletion(child);
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
}

function changeIntensityRange(layer) {
  if (layer.material.intensityRange) {
    layer.material.intensityRange.set(layer.minIntensityRange, layer.maxIntensityRange);
  }
}
/**
 * The basis for all point clouds related layers.
 *
 * @property {boolean} isPointCloudLayer - Used to checkout whether this layer
 * is a PointCloudLayer. Default is `true`. You should not change this, as it is
 * used internally for optimisation.
 * @property {THREE.Group|THREE.Object3D} group - Contains the created
 * `THREE.Points` meshes, usually with an instance of a `THREE.Points` per node.
 * @property {THREE.Group|THREE.Object3D} bboxes - Contains the bounding boxes
 * (`THREE.Box3`) of the tree, usually one per node.
 * @property {number} octreeDepthLimit - The depth limit at which to stop
 * browsing the octree. Can be used to limit the browsing, without having to
 * edit manually the source of the point cloud. No limit by default (`-1`).
 * @property {number} [pointBudget=2000000] - Maximum number of points to
 * display at the same time. This influences the performance of rendering.
 * Default to two millions points.
 * @property {number} [sseThreshold=2] - Threshold of the **S**creen **S**pace
 * **E**rror. Default to `2`.
 * @property {number} [pointSize=4] - The size (in pixels) of the points.
 * Default to `4`.
 * @property {THREE.Material|PointsMaterial} [material=new PointsMaterial] - The
 * material to use to display the points of the cloud. Be default it is a new
 * `PointsMaterial`.
 * @property {number} [mode=MODE.COLOR] - The displaying mode of the points.
 * Values are specified in `PointsMaterial`.
 * @property {number} [minIntensityRange=0] - The minimal intensity of the
 * layer. Changing this value will affect the material, if it has the
 * corresponding uniform. The value is normalized between 0 and 1.
 * @property {number} [maxIntensityRange=1] - The maximal intensity of the
 * layer. Changing this value will affect the material, if it has the
 * corresponding uniform. The value is normalized between 0 and 1.
 */


var PointCloudLayer = /*#__PURE__*/function (_GeometryLayer) {
  (0, _inherits2["default"])(PointCloudLayer, _GeometryLayer);

  var _super = _createSuper(PointCloudLayer);

  /**
   * Constructs a new instance of point cloud layer.
   * Constructs a new instance of a Point Cloud Layer. This should not be used
   * directly, but rather implemented using `extends`.
   *
   * @constructor
   * @extends GeometryLayer
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Object} [config] - Optional configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name. See the list of properties to know which one can be specified.
   */
  function PointCloudLayer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, PointCloudLayer);
    _this = _super.call(this, id, new THREE.Group(), config);
    _this.isPointCloudLayer = true;
    _this.protocol = 'pointcloud';
    _this.group = config.group || new THREE.Group();

    _this.object3d.add(_this.group);

    _this.bboxes = config.bboxes || new THREE.Group();
    _this.bboxes.visible = false;

    _this.object3d.add(_this.bboxes);

    _this.group.updateMatrixWorld(); // default config


    _this.octreeDepthLimit = config.octreeDepthLimit || -1;
    _this.pointBudget = config.pointBudget || 2000000;
    _this.pointSize = config.pointSize === 0 || !isNaN(config.pointSize) ? config.pointSize : 4;
    _this.sseThreshold = config.sseThreshold || 2;

    _this.defineLayerProperty('minIntensityRange', config.minIntensityRange || 0, changeIntensityRange);

    _this.defineLayerProperty('maxIntensityRange', config.maxIntensityRange || 1, changeIntensityRange);

    _this.material = config.material || {};

    if (!_this.material.isMaterial) {
      config.material = config.material || {};
      config.material.intensityRange = new THREE.Vector2(_this.minIntensityRange, _this.maxIntensityRange);
      _this.material = new _PointsMaterial["default"](config.material);
    }

    _this.material.defines = _this.material.defines || {};
    _this.mode = config.mode || _PointsMaterial.MODE.COLOR;
    return _this;
  }

  (0, _createClass2["default"])(PointCloudLayer, [{
    key: "preUpdate",
    value: function preUpdate(context, changeSources) {
      // See https://cesiumjs.org/hosted-apps/massiveworlds/downloads/Ring/WorldScaleTerrainRendering.pptx
      // slide 17
      context.camera.preSSE = context.camera.height / (2 * Math.tan(THREE.MathUtils.degToRad(context.camera.camera3D.fov) * 0.5));

      if (this.material) {
        this.material.visible = this.visible;
        this.material.opacity = this.opacity;
        this.material.transparent = this.opacity < 1;
        this.material.size = this.pointSize;

        if (this.material.updateUniforms) {
          this.material.updateUniforms();
        }
      } // lookup lowest common ancestor of changeSources


      var commonAncestor;

      var _iterator2 = _createForOfIteratorHelper(changeSources.values()),
          _step2;

      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var source = _step2.value;

          if (source.isCamera || source == this) {
            // if the change is caused by a camera move, no need to bother
            // to find common ancestor: we need to update the whole tree:
            // some invisible tiles may now be visible
            return [this.root];
          }

          if (source.obj === undefined) {
            continue;
          } // filter sources that belong to our layer


          if (source.obj.isPoints && source.obj.layer == this) {
            if (!commonAncestor) {
              commonAncestor = source;
            } else {
              commonAncestor = source.findCommonAncestor(commonAncestor);

              if (!commonAncestor) {
                return [this.root];
              }
            }
          }
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }

      if (commonAncestor) {
        return [commonAncestor];
      } // Start updating from hierarchy root


      return [this.root];
    }
  }, {
    key: "update",
    value: function update(context, layer, elt) {
      var _this2 = this;

      elt.visible = false;

      if (this.octreeDepthLimit >= 0 && this.octreeDepthLimit < elt.depth) {
        markForDeletion(elt);
        return;
      } // pick the best bounding box


      var bbox = elt.tightbbox ? elt.tightbbox : elt.bbox;
      elt.visible = context.camera.isBox3Visible(bbox, this.object3d.matrixWorld);

      if (!elt.visible) {
        markForDeletion(elt);
        return;
      }

      elt.notVisibleSince = undefined;
      point.copy(context.camera.camera3D.position).sub(this.object3d.position); // only load geometry if this elements has points

      if (elt.numPoints !== 0) {
        if (elt.obj) {
          elt.obj.visible = true;
        } else if (!elt.promise) {
          var distance = Math.max(0.001, bbox.distanceToPoint(point)); // Increase priority of nearest node

          var priority = computeScreenSpaceError(context, layer.pointSize, layer.spacing, elt, distance) / distance;
          elt.promise = context.scheduler.execute({
            layer: layer,
            requester: elt,
            view: context.view,
            priority: priority,
            redraw: true,
            earlyDropFunction: function earlyDropFunction(cmd) {
              return !cmd.requester.visible || !_this2.visible;
            }
          }).then(function (pts) {
            if (_this2.onPointsCreated) {
              _this2.onPointsCreated(layer, pts);
            }

            elt.obj = pts; // store tightbbox to avoid ping-pong (bbox = larger => visible, tight => invisible)

            elt.tightbbox = pts.tightbbox; // make sure to add it here, otherwise it might never
            // be added nor cleaned

            _this2.group.add(elt.obj);

            elt.obj.updateMatrixWorld(true);
            elt.promise = null;
          }, function (err) {
            if (err.isCancelledCommandException) {
              elt.promise = null;
            }
          });
        }
      }

      if (elt.children && elt.children.length) {
        var _distance = bbox.distanceToPoint(point);

        elt.sse = computeScreenSpaceError(context, layer.pointSize, layer.spacing, elt, _distance) / this.sseThreshold;

        if (elt.sse >= 1) {
          return elt.children;
        } else {
          var _iterator3 = _createForOfIteratorHelper(elt.children),
              _step3;

          try {
            for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
              var child = _step3.value;
              markForDeletion(child);
            }
          } catch (err) {
            _iterator3.e(err);
          } finally {
            _iterator3.f();
          }
        }
      }
    }
  }, {
    key: "postUpdate",
    value: function postUpdate() {
      this.displayedCount = 0;

      var _iterator4 = _createForOfIteratorHelper(this.group.children),
          _step4;

      try {
        for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
          var _pts2 = _step4.value;

          if (_pts2.visible) {
            var _count2 = _pts2.geometry.attributes.position.count;

            _pts2.geometry.setDrawRange(0, _count2);

            this.displayedCount += _count2;
          }
        }
      } catch (err) {
        _iterator4.e(err);
      } finally {
        _iterator4.f();
      }

      if (this.displayedCount > this.pointBudget) {
        // 2 different point count limit implementation, depending on the potree source
        if (this.supportsProgressiveDisplay) {
          // In this format, points are evenly distributed within a node,
          // so we can draw a percentage of each node and still get a correct
          // representation
          var reduction = this.pointBudget / this.displayedCount;

          var _iterator5 = _createForOfIteratorHelper(this.group.children),
              _step5;

          try {
            for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
              var pts = _step5.value;

              if (pts.visible) {
                var count = Math.floor(pts.geometry.drawRange.count * reduction);

                if (count > 0) {
                  pts.geometry.setDrawRange(0, count);
                } else {
                  pts.visible = false;
                }
              }
            }
          } catch (err) {
            _iterator5.e(err);
          } finally {
            _iterator5.f();
          }

          this.displayedCount *= reduction;
        } else {
          // This format doesn't require points to be evenly distributed, so
          // we're going to sort the nodes by "importance" (= on screen size)
          // and display only the first N nodes
          this.group.children.sort(function (p1, p2) {
            return p2.userData.node.sse - p1.userData.node.sse;
          });
          var limitHit = false;
          this.displayedCount = 0;

          var _iterator6 = _createForOfIteratorHelper(this.group.children),
              _step6;

          try {
            for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
              var _pts = _step6.value;
              var _count = _pts.geometry.attributes.position.count;

              if (limitHit || this.displayedCount + _count > this.pointBudget) {
                _pts.visible = false;
                limitHit = true;
              } else {
                this.displayedCount += _count;
              }
            }
          } catch (err) {
            _iterator6.e(err);
          } finally {
            _iterator6.f();
          }
        }
      }

      var now = Date.now();

      for (var i = this.group.children.length - 1; i >= 0; i--) {
        var obj = this.group.children[i];

        if (!obj.visible && now - obj.userData.node.notVisibleSince > 10000) {
          // remove from group
          this.group.children.splice(i, 1); // no need to dispose obj.material, as it is shared by all objects of this layer

          obj.geometry.dispose();
          obj.material = null;
          obj.geometry = null;
          obj.userData.node.obj = null;
        }
      }
    }
  }, {
    key: "pickObjectsAt",
    value: function pickObjectsAt(view, mouse, radius) {
      var target = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : [];
      return _Picking["default"].pickPointsAt(view, mouse, radius, this, target);
    }
  }, {
    key: "getObjectToUpdateForAttachedLayers",
    value: function getObjectToUpdateForAttachedLayers(meta) {
      if (meta.obj) {
        var p = meta.parent;

        if (p && p.obj) {
          return {
            element: meta.obj,
            parent: p.obj
          };
        } else {
          return {
            element: meta.obj
          };
        }
      }
    }
  }]);
  return PointCloudLayer;
}(_GeometryLayer2["default"]);

var _default = PointCloudLayer;
exports["default"] = _default;