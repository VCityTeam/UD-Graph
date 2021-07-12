"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.configureTile = configureTile;
exports["default"] = void 0;

var THREE = _interopRequireWildcard(require("three"));

var _B3dmParser = _interopRequireDefault(require("../Parser/B3dmParser"));

var _PntsParser = _interopRequireDefault(require("../Parser/PntsParser"));

var _Fetcher = _interopRequireDefault(require("./Fetcher"));

var _Utf8Decoder = _interopRequireDefault(require("../Utils/Utf8Decoder"));

function b3dmToMesh(data, layer, url) {
  var urlBase = THREE.LoaderUtils.extractUrlBase(url);
  var options = {
    gltfUpAxis: layer.tileset.asset.gltfUpAxis,
    urlBase: urlBase,
    overrideMaterials: layer.overrideMaterials,
    doNotPatchMaterial: layer.doNotPatchMaterial,
    opacity: layer.opacity,
    registeredExtensions: layer.registeredExtensions
  };
  return _B3dmParser["default"].parse(data, options).then(function (result) {
    var batchTable = result.batchTable; // object3d is actually a THREE.Scene

    var object3d = result.gltf.scene;
    return {
      batchTable: batchTable,
      object3d: object3d
    };
  });
}

function pntsParse(data, layer) {
  return _PntsParser["default"].parse(data, layer.registeredExtensions).then(function (result) {
    var material = layer.material ? layer.material.clone() : new THREE.PointsMaterial({
      size: 0.05,
      vertexColors: true
    }); // creation points with geometry and material

    var points = new THREE.Points(result.point.geometry, material);

    if (result.point.offset) {
      points.position.copy(result.point.offset);
    }

    return {
      object3d: points
    };
  });
}

function configureTile(tile, layer, metadata, parent) {
  tile.frustumCulled = false;
  tile.layer = layer; // parse metadata

  if (metadata.transform) {
    tile.applyMatrix4(metadata.transform);
  }

  tile.geometricError = metadata.geometricError;
  tile.tileId = metadata.tileId;

  if (metadata.refine) {
    tile.additiveRefinement = metadata.refine.toUpperCase() === 'ADD';
  } else {
    tile.additiveRefinement = parent ? parent.additiveRefinement : false;
  }

  tile.viewerRequestVolume = metadata.viewerRequestVolume;
  tile.boundingVolume = metadata.boundingVolume;

  if (tile.boundingVolume.region) {
    tile.add(tile.boundingVolume.region);
  }

  tile.updateMatrixWorld();
}

function executeCommand(command) {
  var layer = command.layer;
  var metadata = command.metadata;
  var tile = new THREE.Object3D();
  configureTile(tile, layer, metadata, command.requester); // Patch for supporting 3D Tiles pre 1.0 (metadata.content.url) and 1.0
  // (metadata.content.uri)

  var path = metadata.content && (metadata.content.url || metadata.content.uri);

  var setLayer = function (obj) {
    obj.layers.set(layer.threejsLayer);
    obj.userData.metadata = metadata;
    obj.layer = layer;

    if (obj.material) {
      obj.material.transparent = layer.opacity < 1.0;
      obj.material.opacity = layer.opacity;
      obj.material.wireframe = layer.wireframe;
    }
  };

  if (path) {
    // Check if we have relative or absolute url (with tileset's lopocs for example)
    var url = path.startsWith('http') ? path : metadata.baseURL + path;
    var supportedFormats = {
      b3dm: b3dmToMesh,
      pnts: pntsParse
    };
    return _Fetcher["default"].arrayBuffer(url, layer.source.networkOptions).then(function (result) {
      if (result !== undefined) {
        var func;

        var magic = _Utf8Decoder["default"].decode(new Uint8Array(result, 0, 4));

        if (magic[0] === '{') {
          result = JSON.parse(_Utf8Decoder["default"].decode(new Uint8Array(result)));
          var newPrefix = url.slice(0, url.lastIndexOf('/') + 1);
          layer.tileset.extendTileset(result, metadata.tileId, newPrefix, layer.registeredExtensions);
        } else if (magic == 'b3dm') {
          func = supportedFormats.b3dm;
        } else if (magic == 'pnts') {
          func = supportedFormats.pnts;
        } else {
          return Promise.reject("Unsupported magic code ".concat(magic));
        }

        if (func) {
          // TODO: request should be delayed if there is a viewerRequestVolume
          return func(result, layer, url).then(function (content) {
            tile.content = content.object3d;

            if (content.batchTable) {
              tile.batchTable = content.batchTable;
            }

            tile.add(content.object3d);
            tile.traverse(setLayer);
            return tile;
          });
        }
      }

      tile.traverse(setLayer);
      return tile;
    });
  } else {
    tile.traverse(setLayer);
    return Promise.resolve(tile);
  }
}

var _default = {
  executeCommand: executeCommand
};
exports["default"] = _default;