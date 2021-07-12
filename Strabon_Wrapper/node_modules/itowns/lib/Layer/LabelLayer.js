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

var _LayerUpdateState = _interopRequireDefault(require("./LayerUpdateState"));

var _ObjectRemovalHelper = _interopRequireDefault(require("../Process/ObjectRemovalHelper"));

var _Layer2 = _interopRequireDefault(require("./Layer"));

var _Coordinates = _interopRequireDefault(require("../Core/Geographic/Coordinates"));

var _Extent = _interopRequireDefault(require("../Core/Geographic/Extent"));

var _Label = _interopRequireDefault(require("../Core/Label"));

var _Feature = require("../Core/Feature");

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function () { var Super = (0, _getPrototypeOf2["default"])(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2["default"])(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2["default"])(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var coord = new _Coordinates["default"]('EPSG:4326', 0, 0, 0);

var _extent = new _Extent["default"]('EPSG:4326', 0, 0, 0, 0);
/**
 * A layer to handle a bunch of `Label`. This layer can be created on its own,
 * but it is better to use the option `addLabelLayer` on another `Layer` to let
 * it work with it (see the `vector_tile_raster_2d` example).
 *
 * @property {boolean} isLabelLayer - Used to checkout whether this layer is a
 * LabelLayer.  Default is true. You should not change this, as it is used
 * internally for optimisation.
 */


var LabelLayer = /*#__PURE__*/function (_Layer) {
  (0, _inherits2["default"])(LabelLayer, _Layer);

  var _super = _createSuper(LabelLayer);

  /**
   * @constructor
   * @extends Layer
   *
   * @param {string} id - The id of the layer, that should be unique. It is
   * not mandatory, but an error will be emitted if this layer is added a
   * {@link View} that already has a layer going by that id.
   * @param {Object} [config] - Optional configuration, all elements in it
   * will be merged as is in the layer. For example, if the configuration
   * contains three elements `name, protocol, extent`, these elements will be
   * available using `layer.name` or something else depending on the property
   * name.
   */
  function LabelLayer(id) {
    var _this;

    var config = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    (0, _classCallCheck2["default"])(this, LabelLayer);
    _this = _super.call(this, id, config);
    _this.isLabelLayer = true;
    _this.domElement = document.createElement('div');
    _this.domElement.id = "itowns-label-".concat(_this.id);

    _this.defineLayerProperty('visible', true, function () {
      _this.domElement.style.display = _this.visible ? 'block' : 'none';
    });

    _this.buildExtent = true;
    return _this;
  }
  /**
   * Reads each {@link FeatureGeometry} that contains label configuration, and
   * creates the corresponding {@link Label}. To create a `Label`, a geometry
   * needs to have a `label` object with at least a few properties:
   * - `content`, which refers to `Label#content`
   * - `position`, which refers to `Label#position`
   * - (optional) `config`, containing miscellaneous configuration for the
   *   label
   *
   * The geometry (or its parent Feature) needs to have a Style set.
   *
   * @param {FeatureCollection} data - The FeatureCollection to read the
   * labels from.
   * @param {Extent} extent
   *
   * @return {Label[]} An array containing all the created labels.
   */


  (0, _createClass2["default"])(LabelLayer, [{
    key: "convert",
    value: function convert(data, extent) {
      var _this2 = this;

      var labels = [];
      var layerField = this.style && this.style.text && this.style.text.field; // Converting the extent now is faster for further operation

      extent.as(data.crs, _extent);
      coord.crs = data.crs;
      var globals = {
        zoom: extent.zoom
      };
      data.features.forEach(function (f) {
        // TODO: add support for LINE and POLYGON
        if (f.type !== _Feature.FEATURE_TYPES.POINT) {
          return;
        }

        var featureField = f.style && f.style.text.field;
        f.geometries.forEach(function (g) {
          // NOTE: this only works because only POINT is supported, it
          // needs more work for LINE and POLYGON
          coord.setFromArray(f.vertices, g.size * g.indices[0].offset); // Transform coordinate to data.crs projection

          coord.applyMatrix4(data.matrixWorld);

          if (f.size == 2) {
            coord.z = 0;
          }

          if (!_extent.isPointInside(coord)) {
            return;
          }

          var geometryField = g.properties.style && g.properties.style.text.field;
          var content;
          var context = {
            globals: globals,
            properties: function properties() {
              return g.properties;
            }
          };

          if (!geometryField && !featureField && !layerField) {
            // Check if there is an icon, with no text
            if (!(g.properties.style && g.properties.style.icon) && !(f.style && f.style.icon) && !(_this2.style && _this2.style.icon)) {
              return;
            }
          } else if (geometryField) {
            content = g.properties.style.getTextFromProperties(context);
          } else if (featureField) {
            content = f.style.getTextFromProperties(context);
          } else if (layerField) {
            content = _this2.style.getTextFromProperties(context);
          }

          var style = (g.properties.style || f.style || _this2.style).symbolStylefromContext(context);

          var label = new _Label["default"](content, coord.clone(), style, _this2.source.sprites);
          label.layerId = _this2.id;

          if (f.size == 2) {
            label.needsAltitude = true;
          }

          labels.push(label);
        });
      });
      return labels;
    } // placeholder

  }, {
    key: "preUpdate",
    value: function preUpdate() {}
  }, {
    key: "update",
    value: function update(context, layer, node, parent) {
      var _this3 = this;

      if (!parent && node.children.length) {
        // if node has been removed dispose three.js resource
        _ObjectRemovalHelper["default"].removeChildrenAndCleanupRecursively(this, node);

        return;
      }

      if (this.frozen || !node.visible || !this.visible) {
        return;
      }

      var extentsDestination = node.getExtentsByProjection(this.source.crs) || [node.extent];
      var zoomDest = extentsDestination[0].zoom;

      if (zoomDest < layer.zoom.min || zoomDest > layer.zoom.max) {
        return;
      }

      if (node.layerUpdateState[this.id] === undefined) {
        node.layerUpdateState[this.id] = new _LayerUpdateState["default"]();
      }

      var elevationLayer = node.material.getElevationLayer();

      if (elevationLayer && node.layerUpdateState[elevationLayer.id].canTryUpdate()) {
        node.children.forEach(function (c) {
          if (c.isLabel && c.needsAltitude && c.updateElevationFromLayer(_this3.parent)) {
            c.update3dPosition(context.view.referenceCrs);
          }
        });
      }

      if (!node.layerUpdateState[this.id].canTryUpdate()) {
        return;
      } else if (!this.source.extentInsideLimit(node.extent, zoomDest)) {
        node.layerUpdateState[this.id].noMoreUpdatePossible();
        return;
      }

      node.layerUpdateState[this.id].newTry();
      var command = {
        layer: this,
        extentsSource: extentsDestination,
        view: context.view,
        threejsLayer: this.threejsLayer,
        requester: node
      };
      return context.scheduler.execute(command).then(function (result) {
        if (!result) {
          return;
        }

        var renderer = context.view.mainLoop.gfxEngine.label2dRenderer;
        var labelsDiv = [];
        result.forEach(function (labels) {
          if (!node.parent) {
            labels.forEach(function (l) {
              _ObjectRemovalHelper["default"].removeChildrenAndCleanupRecursively(_this3, l);

              renderer.removeLabelDOM(l);
            });
            return;
          }

          labels.forEach(function (label) {
            if (label.needsAltitude) {
              label.updateElevationFromLayer(_this3.parent);
            }

            var present = node.children.find(function (l) {
              return l.isLabel && l.baseContent == label.baseContent;
            });

            if (!present) {
              node.add(label);
              label.update3dPosition(context.view.referenceCrs);

              if (node.level < 4) {
                label.horizonCullingPoint = new THREE.Vector3();
                label.updateHorizonCullingPoint();
              }

              labelsDiv.push(label.content);
            }
          });
        });

        if (labelsDiv.length > 0) {
          var _nodeDomElement$dom;

          // Add all labels for this tile at once to batch it
          var nodeDomElement = node.domElements[_this3.id];

          if (!nodeDomElement) {
            nodeDomElement = {
              dom: document.createElement('div'),
              visible: true
            };
            node.domElements[_this3.id] = nodeDomElement;
          }

          (_nodeDomElement$dom = nodeDomElement.dom).append.apply(_nodeDomElement$dom, labelsDiv);

          var closestDomElement = node.findClosestDomElement(_this3.id);

          (closestDomElement && closestDomElement.dom || _this3.domElement).appendChild(nodeDomElement.dom);

          nodeDomElement.visible = true; // Batch update the dimensions of labels all at once to avoid
          // redraw for at least this tile.

          result.forEach(function (labels) {
            return labels.forEach(function (label) {
              return label.initDimensions();
            });
          });
          result.forEach(function (labels) {
            return labels.forEach(function (label) {
              label.visible = false;
            });
          }); // Sort labels so they can be the first in the renderer. That
          // way, we cull labels on parent tile first, and then on
          // children tile. This allows a z-order priority, and reduce
          // flickering.

          node.children.sort(function (c) {
            return c.isLabel ? -c.order : 1;
          }); // Necessary event listener, to remove any Label attached to
          // this tile

          node.addEventListener('removed', function () {
            result.forEach(function (labels) {
              return labels.forEach(function (l) {
                return node.remove(l);
              });
            });

            _this3.removeNodeDomElement(node);
          });
        }

        node.layerUpdateState[_this3.id].noMoreUpdatePossible();
      });
    }
  }, {
    key: "removeLabelsFromNodeRecursive",
    value: function removeLabelsFromNodeRecursive(node) {
      var _this4 = this;

      node.children.forEach(function (c) {
        if (c.isLabel && c.layerId === _this4.id) {
          node.remove(c);
        } else if (c.isTileMesh) {
          _this4.removeLabelsFromNodeRecursive(c);
        }
      });
      this.removeNodeDomElement(node);
    }
  }, {
    key: "removeNodeDomElement",
    value: function removeNodeDomElement(node) {
      if (node.domElements[this.id]) {
        var child = node.domElements[this.id].dom;
        child.parentElement.removeChild(child);
        delete node.domElements[this.id];
      }
    }
  }, {
    key: "delete",
    value: function _delete() {
      var _this5 = this;

      this.domElement.parentElement.removeChild(this.domElement);
      this.parent.level0Nodes.forEach(function (obj) {
        return _this5.removeLabelsFromNodeRecursive(obj);
      });
    }
  }]);
  return LabelLayer;
}(_Layer2["default"]);

var _default = LabelLayer;
exports["default"] = _default;