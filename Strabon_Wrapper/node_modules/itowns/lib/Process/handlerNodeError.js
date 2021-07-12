"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = handlingError;
// max retry loading before changing the status to definitiveError
var MAX_RETRY = 4;

function handlingError(err, node, layer, targetLevel, view) {
  // Cancel error handling if the layer was removed between command scheduling and its execution
  if (!node.layerUpdateState[layer.id]) {
    return;
  }

  if (err.isCancelledCommandException) {
    node.layerUpdateState[layer.id].success();
  } else if (err instanceof SyntaxError) {
    node.layerUpdateState[layer.id].failure(0, true);
  } else {
    var definitiveError = node.layerUpdateState[layer.id].errorCount > MAX_RETRY;
    node.layerUpdateState[layer.id].failure(Date.now(), definitiveError, {
      targetLevel: targetLevel
    });

    if (!definitiveError) {
      window.setTimeout(function () {
        view.notifyChange(node, false);
      }, node.layerUpdateState[layer.id].secondsUntilNextTry() * 1000);
    }
  }
}