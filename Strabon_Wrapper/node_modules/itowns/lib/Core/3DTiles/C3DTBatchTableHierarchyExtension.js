"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

/**
 * @classdesc
 * Batch Table part of the 3D Tiles
 * [Batch Table Hierarchy Extension](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/extensions/3DTILES_batch_table_hierarchy)
 * @property {object} classes - The classes as defined in the specification.
 * @property {object} inverseHierarchy - InverseHierarchy contains for each
 * instance (i.e. georgraphic feature e.g. building, roof, etc.) an array of the
 * indexes of its parents. For example, the parents of the instance 0 can be
 * found using inverseHierarchy[0].
 * @property {number[]} instancesIdxs - For each instance of the extension,
 * contains a javascript object with classId and instanceIdx. classId is the id
 * of the class (from this.classes) of the instance. instanceIdx is the index of
 * the instance in this class. Goal: Ease the retrieval of the properties of an
 * instance.
 */
var C3DTBatchTableHierarchyExtension = /*#__PURE__*/function () {
  /**
   * Constructor of the C3DTBatchTableHierarchyExtension class.
   * @param {Object} json - The parsed json of the batch table part of the 3D
   * Tiles [Batch Table Hierarchy Extension](https://github.com/AnalyticalGraphicsInc/3d-tiles/tree/master/extensions/3DTILES_batch_table_hierarchy)
   */
  function C3DTBatchTableHierarchyExtension(json) {
    (0, _classCallCheck2["default"])(this, C3DTBatchTableHierarchyExtension);
    this.classes = json.classes;
    this.inverseHierarchy = {};
    this.instancesIdxs = []; // Counts the number of instances of a class

    var classCounter = {};
    var parentIdsCounter = 0; // if omitted, parentCounts is an array of length instancesLength,
    // where all values are 1 (cf. spec)

    var parentCounts = json.parentCounts;

    if (parentCounts === undefined) {
      parentCounts = new Array(json.instancesLength);
      parentCounts.fill(1);
    } // for each instance


    for (var i = 0; i < json.instancesLength; i++) {
      // for each parent of the current instance
      for (var j = 0; j < parentCounts[i]; j++) {
        // When an instance's parentId points to itself, then it has no
        // parent" (cf. spec)
        if (i !== json.parentIds[parentIdsCounter]) {
          if (this.inverseHierarchy[i] === undefined) {
            this.inverseHierarchy[i] = [];
          }

          this.inverseHierarchy[i].push(json.parentIds[parentIdsCounter]);
          parentIdsCounter++;
        }
      }

      var classId = json.classIds[i];

      if (classCounter[classId] === undefined) {
        classCounter[classId] = 0;
      }

      this.instancesIdxs[i] = {
        classId: classId,
        instanceIdx: classCounter[classId]
      };
      classCounter[classId]++;
    }
  }
  /**
   * Creates and returns a javascript object holding the displayable
   * information relative to this extension for a given feature.
   * @param {integer} featureId - id of the feature
   * @returns {Object} - displayable information relative to this
   * extension, for the feature with id=featureId and for its parents
   */


  (0, _createClass2["default"])(C3DTBatchTableHierarchyExtension, [{
    key: "getInfoById",
    value: function getInfoById(featureId) {
      var instanceProperties = {}; // get feature class name

      var instanceClassId = this.instancesIdxs[featureId].classId;
      var featureClass = this.classes[instanceClassId].name; // get feature properties and values

      var instanceIdx = this.instancesIdxs[featureId].instanceIdx;
      var instances = this.classes[instanceClassId].instances;

      for (var key in instances) {
        if (Object.prototype.hasOwnProperty.call(instances, key)) {
          instanceProperties[key] = instances[key][instanceIdx];
        }
      } // create return object: className: {featureProperties and values}


      var pickingInfo = {};
      pickingInfo[featureClass] = instanceProperties; // If this feature has parent(s), recurse on them

      if (this.inverseHierarchy && this.inverseHierarchy[featureId]) {
        var _iterator = _createForOfIteratorHelper(this.inverseHierarchy[featureId]),
            _step;

        try {
          for (_iterator.s(); !(_step = _iterator.n()).done;) {
            var parentID = _step.value;
            Object.assign(pickingInfo, this.getInfoById(parentID));
          }
        } catch (err) {
          _iterator.e(err);
        } finally {
          _iterator.f();
        }
      }

      return pickingInfo;
    }
  }]);
  return C3DTBatchTableHierarchyExtension;
}();

var _default = C3DTBatchTableHierarchyExtension;
exports["default"] = _default;