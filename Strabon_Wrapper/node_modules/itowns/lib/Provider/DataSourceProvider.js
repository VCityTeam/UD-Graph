"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;
var _default = {
  executeCommand: function executeCommand(command) {
    var layer = command.layer;
    var src = command.extentsSource;
    var dst = command.extentsDestination || src;
    return Promise.all(src.map(function (from, i) {
      return layer.getData(from, dst[i]);
    }));
  }
};
exports["default"] = _default;