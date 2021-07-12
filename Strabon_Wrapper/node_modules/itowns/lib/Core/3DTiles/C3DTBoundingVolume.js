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

var _Extent = _interopRequireDefault(require("../Geographic/Extent"));

var _OBB = _interopRequireDefault(require("../../Renderer/OBB"));

var _C3DTilesTypes = _interopRequireDefault(require("./C3DTilesTypes"));

var matrix = new THREE.Matrix4();
var center = new THREE.Vector3();
var size = new THREE.Vector3();
var extent = new _Extent["default"]('EPSG:4326', 0, 0, 0, 0);
var sphereCenter = new THREE.Vector3();
var worldCoordinateCenter = new THREE.Vector3();
/**
 * @classdesc 3D Tiles
 * [bounding volume](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/specification/schema/boundingVolume.schema.json)
 * @property {C3DTilesTypes} type - Used by 3D Tiles extensions
 * (e.g. {@link C3DTBatchTableHierarchyExtension}) to know in which context
 * (i.e. for which 3D Tiles class) the parsing of the extension should be done.
 * @property {THREE.Box3} box - Bounding box, defined only if the Bounding Volume
 * is a box.
 * @property {OBB} region - Bounding region, defined only if the Bounding
 * Volume is a region.
 * @property {THREE.Sphere} sphere - Bounding sphere, defined only if the
 * Bounding Volume is a sphere.
 * @property {object} extensions - 3D Tiles extensions of the bounding volume
 * stored in the following format:
 * {extensioName1: extensionObject1, extensioName2: extensionObject2, ...}
 */

var C3DTBoundingVolume = /*#__PURE__*/function () {
  function C3DTBoundingVolume(json, inverseTileTransform, registeredExtensions) {
    (0, _classCallCheck2["default"])(this, C3DTBoundingVolume);
    this.type = _C3DTilesTypes["default"].boundingVolume; // Init bounding volume

    if (json.region) {
      this.initBoundingRegion(json.region, inverseTileTransform);
    } else if (json.box) {
      this.initBoundingBox(json.box);
    } else if (json.sphere) {
      this.initBoundingSphere(json.sphere);
    } else {
      throw new Error('3D Tiles nodes must have a bounding volume');
    }

    if (json.extensions) {
      this.extensions = registeredExtensions.parseExtensions(json.extensions, this.type);
    }
  }

  (0, _createClass2["default"])(C3DTBoundingVolume, [{
    key: "initBoundingRegion",
    value: function initBoundingRegion(region, inverseTileTransform) {
      extent.set(THREE.MathUtils.radToDeg(region[0]), THREE.MathUtils.radToDeg(region[2]), THREE.MathUtils.radToDeg(region[1]), THREE.MathUtils.radToDeg(region[3]));
      var regionBox = new _OBB["default"]();
      regionBox.setFromExtent(extent);
      regionBox.updateZ(region[4], region[5]); // at this point box.matrix = box.epsg4978_from_local, so
      // we transform it in parent_from_local by using parent's
      // epsg4978_from_local which from our point of view is
      // epsg4978_from_parent. box.matrix = (epsg4978_from_parent ^ -1) *
      // epsg4978_from_local =  parent_from_epsg4978 * epsg4978_from_local =
      // parent_from_local

      regionBox.matrix.premultiply(inverseTileTransform); // update position, rotation and scale

      regionBox.matrix.decompose(regionBox.position, regionBox.quaternion, regionBox.scale);
      this.region = regionBox;
    }
  }, {
    key: "initBoundingBox",
    value: function initBoundingBox(box) {
      // box[0], box[1], box[2] = center of the box
      // box[3], box[4], box[5] = x axis direction and half-length
      // box[6], box[7], box[8] = y axis direction and half-length
      // box[9], box[10], box[11] = z axis direction and half-length
      center.set(box[0], box[1], box[2]);
      size.set(box[3], box[7], box[11]).multiplyScalar(2);
      this.box = new THREE.Box3();
      this.box.setFromCenterAndSize(center, size);
    }
  }, {
    key: "initBoundingSphere",
    value: function initBoundingSphere(sphere) {
      sphereCenter.set(sphere[0], sphere[1], sphere[2]);
      this.sphere = new THREE.Sphere(sphereCenter, sphere[3]);
    }
  }, {
    key: "boundingVolumeCulling",
    value: function boundingVolumeCulling(camera, tileMatrixWorld) {
      if (this.region && !camera.isBox3Visible(this.region.box3D, matrix.multiplyMatrices(tileMatrixWorld, this.region.matrix))) {
        return true;
      }

      if (this.box && !camera.isBox3Visible(this.box, tileMatrixWorld)) {
        return true;
      }

      return this.sphere && !camera.isSphereVisible(this.sphere, tileMatrixWorld);
    }
  }, {
    key: "viewerRequestVolumeCulling",
    value: function viewerRequestVolumeCulling(camera, tileMatrixWorld) {
      if (this.region) {
        console.warn('Region viewerRequestVolume not yet supported');
        return true;
      }

      if (this.box) {
        console.warn('Bounding box viewerRequestVolume not yet supported');
        return true;
      }

      if (this.sphere) {
        worldCoordinateCenter.copy(this.sphere.center);
        worldCoordinateCenter.applyMatrix4(tileMatrixWorld); // To check the distance between the center sphere and the camera

        if (!(camera.camera3D.position.distanceTo(worldCoordinateCenter) <= this.sphere.radius)) {
          return true;
        }
      }

      return false;
    }
  }]);
  return C3DTBoundingVolume;
}();

var _default = C3DTBoundingVolume;
exports["default"] = _default;