"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
Object.defineProperty(exports, "Extent", {
  enumerable: true,
  get: function get() {
    return _Extent["default"];
  }
});
Object.defineProperty(exports, "Coordinates", {
  enumerable: true,
  get: function get() {
    return _Coordinates["default"];
  }
});
Object.defineProperty(exports, "CRS", {
  enumerable: true,
  get: function get() {
    return _Crs["default"];
  }
});
Object.defineProperty(exports, "Ellipsoid", {
  enumerable: true,
  get: function get() {
    return _Ellipsoid["default"];
  }
});
Object.defineProperty(exports, "ellipsoidSizes", {
  enumerable: true,
  get: function get() {
    return _Ellipsoid.ellipsoidSizes;
  }
});
Object.defineProperty(exports, "GlobeView", {
  enumerable: true,
  get: function get() {
    return _GlobeView["default"];
  }
});
Object.defineProperty(exports, "GLOBE_VIEW_EVENTS", {
  enumerable: true,
  get: function get() {
    return _GlobeView.GLOBE_VIEW_EVENTS;
  }
});
Object.defineProperty(exports, "PlanarView", {
  enumerable: true,
  get: function get() {
    return _PlanarView["default"];
  }
});
Object.defineProperty(exports, "Fetcher", {
  enumerable: true,
  get: function get() {
    return _Fetcher["default"];
  }
});
Object.defineProperty(exports, "MAIN_LOOP_EVENTS", {
  enumerable: true,
  get: function get() {
    return _MainLoop.MAIN_LOOP_EVENTS;
  }
});
Object.defineProperty(exports, "View", {
  enumerable: true,
  get: function get() {
    return _View["default"];
  }
});
Object.defineProperty(exports, "VIEW_EVENTS", {
  enumerable: true,
  get: function get() {
    return _View.VIEW_EVENTS;
  }
});
Object.defineProperty(exports, "FeatureProcessing", {
  enumerable: true,
  get: function get() {
    return _FeatureProcessing["default"];
  }
});
Object.defineProperty(exports, "updateLayeredMaterialNodeImagery", {
  enumerable: true,
  get: function get() {
    return _LayeredMaterialNodeProcessing.updateLayeredMaterialNodeImagery;
  }
});
Object.defineProperty(exports, "updateLayeredMaterialNodeElevation", {
  enumerable: true,
  get: function get() {
    return _LayeredMaterialNodeProcessing.updateLayeredMaterialNodeElevation;
  }
});
Object.defineProperty(exports, "OrientedImageCamera", {
  enumerable: true,
  get: function get() {
    return _OrientedImageCamera["default"];
  }
});
Object.defineProperty(exports, "PointsMaterial", {
  enumerable: true,
  get: function get() {
    return _PointsMaterial["default"];
  }
});
Object.defineProperty(exports, "GlobeControls", {
  enumerable: true,
  get: function get() {
    return _GlobeControls["default"];
  }
});
Object.defineProperty(exports, "CONTROL_EVENTS", {
  enumerable: true,
  get: function get() {
    return _GlobeControls.CONTROL_EVENTS;
  }
});
Object.defineProperty(exports, "FlyControls", {
  enumerable: true,
  get: function get() {
    return _FlyControls["default"];
  }
});
Object.defineProperty(exports, "FirstPersonControls", {
  enumerable: true,
  get: function get() {
    return _FirstPersonControls["default"];
  }
});
Object.defineProperty(exports, "StreetControls", {
  enumerable: true,
  get: function get() {
    return _StreetControls["default"];
  }
});
Object.defineProperty(exports, "PlanarControls", {
  enumerable: true,
  get: function get() {
    return _PlanarControls["default"];
  }
});
Object.defineProperty(exports, "PLANAR_CONTROL_EVENT", {
  enumerable: true,
  get: function get() {
    return _PlanarControls.PLANAR_CONTROL_EVENT;
  }
});
Object.defineProperty(exports, "Feature2Mesh", {
  enumerable: true,
  get: function get() {
    return _Feature2Mesh["default"];
  }
});
Object.defineProperty(exports, "FeaturesUtils", {
  enumerable: true,
  get: function get() {
    return _FeaturesUtils["default"];
  }
});
Object.defineProperty(exports, "DEMUtils", {
  enumerable: true,
  get: function get() {
    return _DEMUtils["default"];
  }
});
Object.defineProperty(exports, "CameraUtils", {
  enumerable: true,
  get: function get() {
    return _CameraUtils["default"];
  }
});
Object.defineProperty(exports, "OrientationUtils", {
  enumerable: true,
  get: function get() {
    return _OrientationUtils["default"];
  }
});
Object.defineProperty(exports, "ShaderChunk", {
  enumerable: true,
  get: function get() {
    return _ShaderChunk["default"];
  }
});
Object.defineProperty(exports, "getMaxColorSamplerUnitsCount", {
  enumerable: true,
  get: function get() {
    return _LayeredMaterial.getMaxColorSamplerUnitsCount;
  }
});
Object.defineProperty(exports, "colorLayerEffects", {
  enumerable: true,
  get: function get() {
    return _LayeredMaterial.colorLayerEffects;
  }
});
Object.defineProperty(exports, "Capabilities", {
  enumerable: true,
  get: function get() {
    return _Capabilities["default"];
  }
});
Object.defineProperty(exports, "CAMERA_TYPE", {
  enumerable: true,
  get: function get() {
    return _Camera.CAMERA_TYPE;
  }
});
Object.defineProperty(exports, "Feature", {
  enumerable: true,
  get: function get() {
    return _Feature["default"];
  }
});
Object.defineProperty(exports, "FeatureCollection", {
  enumerable: true,
  get: function get() {
    return _Feature.FeatureCollection;
  }
});
Object.defineProperty(exports, "FeatureGeometry", {
  enumerable: true,
  get: function get() {
    return _Feature.FeatureGeometry;
  }
});
Object.defineProperty(exports, "FEATURE_TYPES", {
  enumerable: true,
  get: function get() {
    return _Feature.FEATURE_TYPES;
  }
});
Object.defineProperty(exports, "Style", {
  enumerable: true,
  get: function get() {
    return _Style["default"];
  }
});
Object.defineProperty(exports, "Label", {
  enumerable: true,
  get: function get() {
    return _Label["default"];
  }
});
Object.defineProperty(exports, "Layer", {
  enumerable: true,
  get: function get() {
    return _Layer["default"];
  }
});
Object.defineProperty(exports, "ImageryLayers", {
  enumerable: true,
  get: function get() {
    return _Layer.ImageryLayers;
  }
});
Object.defineProperty(exports, "ColorLayer", {
  enumerable: true,
  get: function get() {
    return _ColorLayer["default"];
  }
});
Object.defineProperty(exports, "ElevationLayer", {
  enumerable: true,
  get: function get() {
    return _ElevationLayer["default"];
  }
});
Object.defineProperty(exports, "GeometryLayer", {
  enumerable: true,
  get: function get() {
    return _GeometryLayer["default"];
  }
});
Object.defineProperty(exports, "PointCloudLayer", {
  enumerable: true,
  get: function get() {
    return _PointCloudLayer["default"];
  }
});
Object.defineProperty(exports, "PotreeLayer", {
  enumerable: true,
  get: function get() {
    return _PotreeLayer["default"];
  }
});
Object.defineProperty(exports, "C3DTilesLayer", {
  enumerable: true,
  get: function get() {
    return _C3DTilesLayer["default"];
  }
});
Object.defineProperty(exports, "TiledGeometryLayer", {
  enumerable: true,
  get: function get() {
    return _TiledGeometryLayer["default"];
  }
});
Object.defineProperty(exports, "OrientedImageLayer", {
  enumerable: true,
  get: function get() {
    return _OrientedImageLayer["default"];
  }
});
Object.defineProperty(exports, "STRATEGY_MIN_NETWORK_TRAFFIC", {
  enumerable: true,
  get: function get() {
    return _LayerUpdateStrategy.STRATEGY_MIN_NETWORK_TRAFFIC;
  }
});
Object.defineProperty(exports, "STRATEGY_GROUP", {
  enumerable: true,
  get: function get() {
    return _LayerUpdateStrategy.STRATEGY_GROUP;
  }
});
Object.defineProperty(exports, "STRATEGY_PROGRESSIVE", {
  enumerable: true,
  get: function get() {
    return _LayerUpdateStrategy.STRATEGY_PROGRESSIVE;
  }
});
Object.defineProperty(exports, "STRATEGY_DICHOTOMY", {
  enumerable: true,
  get: function get() {
    return _LayerUpdateStrategy.STRATEGY_DICHOTOMY;
  }
});
Object.defineProperty(exports, "ColorLayersOrdering", {
  enumerable: true,
  get: function get() {
    return _ColorLayersOrdering["default"];
  }
});
Object.defineProperty(exports, "GlobeLayer", {
  enumerable: true,
  get: function get() {
    return _GlobeLayer["default"];
  }
});
Object.defineProperty(exports, "PlanarLayer", {
  enumerable: true,
  get: function get() {
    return _PlanarLayer["default"];
  }
});
Object.defineProperty(exports, "LabelLayer", {
  enumerable: true,
  get: function get() {
    return _LabelLayer["default"];
  }
});
Object.defineProperty(exports, "EntwinePointTileLayer", {
  enumerable: true,
  get: function get() {
    return _EntwinePointTileLayer["default"];
  }
});
Object.defineProperty(exports, "Source", {
  enumerable: true,
  get: function get() {
    return _Source["default"];
  }
});
Object.defineProperty(exports, "FileSource", {
  enumerable: true,
  get: function get() {
    return _FileSource["default"];
  }
});
Object.defineProperty(exports, "TMSSource", {
  enumerable: true,
  get: function get() {
    return _TMSSource["default"];
  }
});
Object.defineProperty(exports, "WFSSource", {
  enumerable: true,
  get: function get() {
    return _WFSSource["default"];
  }
});
Object.defineProperty(exports, "WMSSource", {
  enumerable: true,
  get: function get() {
    return _WMSSource["default"];
  }
});
Object.defineProperty(exports, "WMTSSource", {
  enumerable: true,
  get: function get() {
    return _WMTSSource["default"];
  }
});
Object.defineProperty(exports, "VectorTilesSource", {
  enumerable: true,
  get: function get() {
    return _VectorTilesSource["default"];
  }
});
Object.defineProperty(exports, "OrientedImageSource", {
  enumerable: true,
  get: function get() {
    return _OrientedImageSource["default"];
  }
});
Object.defineProperty(exports, "PotreeSource", {
  enumerable: true,
  get: function get() {
    return _PotreeSource["default"];
  }
});
Object.defineProperty(exports, "C3DTilesSource", {
  enumerable: true,
  get: function get() {
    return _C3DTilesSource["default"];
  }
});
Object.defineProperty(exports, "EntwinePointTileSource", {
  enumerable: true,
  get: function get() {
    return _EntwinePointTileSource["default"];
  }
});
Object.defineProperty(exports, "GpxParser", {
  enumerable: true,
  get: function get() {
    return _GpxParser["default"];
  }
});
Object.defineProperty(exports, "GeoJsonParser", {
  enumerable: true,
  get: function get() {
    return _GeoJsonParser["default"];
  }
});
Object.defineProperty(exports, "KMLParser", {
  enumerable: true,
  get: function get() {
    return _KMLParser["default"];
  }
});
Object.defineProperty(exports, "CameraCalibrationParser", {
  enumerable: true,
  get: function get() {
    return _CameraCalibrationParser["default"];
  }
});
Object.defineProperty(exports, "ShapefileParser", {
  enumerable: true,
  get: function get() {
    return _ShapefileParser["default"];
  }
});
Object.defineProperty(exports, "LASParser", {
  enumerable: true,
  get: function get() {
    return _LASParser["default"];
  }
});
Object.defineProperty(exports, "enableDracoLoader", {
  enumerable: true,
  get: function get() {
    return _B3dmParser.enableDracoLoader;
  }
});
Object.defineProperty(exports, "glTFLoader", {
  enumerable: true,
  get: function get() {
    return _B3dmParser.glTFLoader;
  }
});
Object.defineProperty(exports, "legacyGLTFLoader", {
  enumerable: true,
  get: function get() {
    return _B3dmParser.legacyGLTFLoader;
  }
});
Object.defineProperty(exports, "C3DTileset", {
  enumerable: true,
  get: function get() {
    return _C3DTileset["default"];
  }
});
Object.defineProperty(exports, "C3DTBoundingVolume", {
  enumerable: true,
  get: function get() {
    return _C3DTBoundingVolume["default"];
  }
});
Object.defineProperty(exports, "C3DTBatchTable", {
  enumerable: true,
  get: function get() {
    return _C3DTBatchTable["default"];
  }
});
Object.defineProperty(exports, "C3DTExtensions", {
  enumerable: true,
  get: function get() {
    return _C3DTExtensions["default"];
  }
});
Object.defineProperty(exports, "C3DTilesTypes", {
  enumerable: true,
  get: function get() {
    return _C3DTilesTypes["default"];
  }
});
Object.defineProperty(exports, "C3DTBatchTableHierarchyExtension", {
  enumerable: true,
  get: function get() {
    return _C3DTBatchTableHierarchyExtension["default"];
  }
});
exports.REVISION = void 0;

var _Extent = _interopRequireDefault(require("./Core/Geographic/Extent"));

var _Coordinates = _interopRequireDefault(require("./Core/Geographic/Coordinates"));

var _Crs = _interopRequireDefault(require("./Core/Geographic/Crs"));

var _Ellipsoid = _interopRequireWildcard(require("./Core/Math/Ellipsoid"));

var _GlobeView = _interopRequireWildcard(require("./Core/Prefab/GlobeView"));

var _PlanarView = _interopRequireDefault(require("./Core/Prefab/PlanarView"));

var _Fetcher = _interopRequireDefault(require("./Provider/Fetcher"));

var _MainLoop = require("./Core/MainLoop");

var _View = _interopRequireWildcard(require("./Core/View"));

var _FeatureProcessing = _interopRequireDefault(require("./Process/FeatureProcessing"));

var _LayeredMaterialNodeProcessing = require("./Process/LayeredMaterialNodeProcessing");

var _OrientedImageCamera = _interopRequireDefault(require("./Renderer/OrientedImageCamera"));

var _PointsMaterial = _interopRequireDefault(require("./Renderer/PointsMaterial"));

var _GlobeControls = _interopRequireWildcard(require("./Controls/GlobeControls"));

var _FlyControls = _interopRequireDefault(require("./Controls/FlyControls"));

var _FirstPersonControls = _interopRequireDefault(require("./Controls/FirstPersonControls"));

var _StreetControls = _interopRequireDefault(require("./Controls/StreetControls"));

var _PlanarControls = _interopRequireWildcard(require("./Controls/PlanarControls"));

var _Feature2Mesh = _interopRequireDefault(require("./Converter/Feature2Mesh"));

var _FeaturesUtils = _interopRequireDefault(require("./Utils/FeaturesUtils"));

var _DEMUtils = _interopRequireDefault(require("./Utils/DEMUtils"));

var _CameraUtils = _interopRequireDefault(require("./Utils/CameraUtils"));

var _OrientationUtils = _interopRequireDefault(require("./Utils/OrientationUtils"));

var _ShaderChunk = _interopRequireDefault(require("./Renderer/Shader/ShaderChunk"));

var _LayeredMaterial = require("./Renderer/LayeredMaterial");

var _Capabilities = _interopRequireDefault(require("./Core/System/Capabilities"));

var _Camera = require("./Renderer/Camera");

var _Feature = _interopRequireWildcard(require("./Core/Feature"));

var _Style = _interopRequireDefault(require("./Core/Style"));

var _Label = _interopRequireDefault(require("./Core/Label"));

var _Layer = _interopRequireWildcard(require("./Layer/Layer"));

var _ColorLayer = _interopRequireDefault(require("./Layer/ColorLayer"));

var _ElevationLayer = _interopRequireDefault(require("./Layer/ElevationLayer"));

var _GeometryLayer = _interopRequireDefault(require("./Layer/GeometryLayer"));

var _PointCloudLayer = _interopRequireDefault(require("./Layer/PointCloudLayer"));

var _PotreeLayer = _interopRequireDefault(require("./Layer/PotreeLayer"));

var _C3DTilesLayer = _interopRequireDefault(require("./Layer/C3DTilesLayer"));

var _TiledGeometryLayer = _interopRequireDefault(require("./Layer/TiledGeometryLayer"));

var _OrientedImageLayer = _interopRequireDefault(require("./Layer/OrientedImageLayer"));

var _LayerUpdateStrategy = require("./Layer/LayerUpdateStrategy");

var _ColorLayersOrdering = _interopRequireDefault(require("./Renderer/ColorLayersOrdering"));

var _GlobeLayer = _interopRequireDefault(require("./Core/Prefab/Globe/GlobeLayer"));

var _PlanarLayer = _interopRequireDefault(require("./Core/Prefab/Planar/PlanarLayer"));

var _LabelLayer = _interopRequireDefault(require("./Layer/LabelLayer"));

var _EntwinePointTileLayer = _interopRequireDefault(require("./Layer/EntwinePointTileLayer"));

var _Source = _interopRequireDefault(require("./Source/Source"));

var _FileSource = _interopRequireDefault(require("./Source/FileSource"));

var _TMSSource = _interopRequireDefault(require("./Source/TMSSource"));

var _WFSSource = _interopRequireDefault(require("./Source/WFSSource"));

var _WMSSource = _interopRequireDefault(require("./Source/WMSSource"));

var _WMTSSource = _interopRequireDefault(require("./Source/WMTSSource"));

var _VectorTilesSource = _interopRequireDefault(require("./Source/VectorTilesSource"));

var _OrientedImageSource = _interopRequireDefault(require("./Source/OrientedImageSource"));

var _PotreeSource = _interopRequireDefault(require("./Source/PotreeSource"));

var _C3DTilesSource = _interopRequireDefault(require("./Source/C3DTilesSource"));

var _EntwinePointTileSource = _interopRequireDefault(require("./Source/EntwinePointTileSource"));

var _GpxParser = _interopRequireDefault(require("./Parser/GpxParser"));

var _GeoJsonParser = _interopRequireDefault(require("./Parser/GeoJsonParser"));

var _KMLParser = _interopRequireDefault(require("./Parser/KMLParser"));

var _CameraCalibrationParser = _interopRequireDefault(require("./Parser/CameraCalibrationParser"));

var _ShapefileParser = _interopRequireDefault(require("./Parser/ShapefileParser"));

var _LASParser = _interopRequireDefault(require("./Parser/LASParser"));

var _B3dmParser = require("./Parser/B3dmParser");

var _C3DTileset = _interopRequireDefault(require("./Core/3DTiles/C3DTileset"));

var _C3DTBoundingVolume = _interopRequireDefault(require("./Core/3DTiles/C3DTBoundingVolume"));

var _C3DTBatchTable = _interopRequireDefault(require("./Core/3DTiles/C3DTBatchTable"));

var _C3DTExtensions = _interopRequireDefault(require("./Core/3DTiles/C3DTExtensions"));

var _C3DTilesTypes = _interopRequireDefault(require("./Core/3DTiles/C3DTilesTypes"));

var _C3DTBatchTableHierarchyExtension = _interopRequireDefault(require("./Core/3DTiles/C3DTBatchTableHierarchyExtension"));

var conf = {
  version: '2.33.0'
};
var REVISION = conf.version; // Geographic tools

exports.REVISION = REVISION;