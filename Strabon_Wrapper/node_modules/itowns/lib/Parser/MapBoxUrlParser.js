"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;
var urlRe = /^(\w+):\/\/([^/?]*)(\/[^?]+)?\??(.+)?/;
var config = {
  API_URL: 'https://api.mapbox.com',
  REQUIRE_ACCESS_TOKEN: true,
  ACCESS_TOKEN: null
};

function formatUrl(obj) {
  var params = obj.params.length ? "?".concat(obj.params.join('&')) : '';
  return "".concat(obj.protocol, "://").concat(obj.authority).concat(obj.path).concat(params);
}

function makeAPIURL(urlObject, accessToken) {
  var apiUrlObject = parseUrl(config.API_URL);
  urlObject.protocol = apiUrlObject.protocol;
  urlObject.authority = apiUrlObject.authority;

  if (urlObject.protocol === 'http') {
    var i = urlObject.params.indexOf('secure');

    if (i >= 0) {
      urlObject.params.splice(i, 1);
    }
  }

  if (apiUrlObject.path !== '/') {
    urlObject.path = "".concat(apiUrlObject.path).concat(urlObject.path);
  }

  if (!config.REQUIRE_ACCESS_TOKEN) {
    return formatUrl(urlObject);
  }

  accessToken = accessToken || config.ACCESS_TOKEN;

  if (!accessToken) {
    throw new Error('An API access token is required');
  }

  if (accessToken[0] === 's') {
    throw new Error('Use a public access token (pk.*), not a secret access token (sk.*).');
  }

  urlObject.params = urlObject.params.filter(function (d) {
    return d.indexOf('access_token') === -1;
  });
  urlObject.params.push("access_token=".concat(accessToken));
  return formatUrl(urlObject);
}

function isMapboxURL(url) {
  return url.indexOf('mapbox:') === 0;
}

function parseUrl(url) {
  var parts = url.match(urlRe);

  if (!parts) {
    throw new Error('Unable to parse URL object');
  }

  return {
    protocol: parts[1],
    authority: parts[2],
    path: parts[3] || '/',
    params: parts[4] ? parts[4].split('&') : []
  };
}

function normalizeSpriteURL(url, format, extension, accessToken) {
  var urlObject = parseUrl(url);

  if (!isMapboxURL(url)) {
    urlObject.path += "".concat(format).concat(extension);
    return formatUrl(urlObject);
  }

  urlObject.path = "/styles/v1".concat(urlObject.path, "/sprite").concat(format).concat(extension);
  return makeAPIURL(urlObject, accessToken);
}

function normalizeSourceURL(url, accessToken) {
  if (!isMapboxURL(url)) {
    return url;
  }

  var urlObject = parseUrl(url);
  urlObject.path = "/v4/".concat(urlObject.authority, ".json");
  urlObject.params.push('secure');
  return makeAPIURL(urlObject, accessToken);
}

function normalizeStyleURL(url, accessToken) {
  if (!isMapboxURL(url)) {
    return url;
  }

  var urlObject = parseUrl(url);
  urlObject.path = "/styles/v1".concat(urlObject.path);
  return makeAPIURL(urlObject, accessToken);
}

var _default = {
  normalizeStyleURL: normalizeStyleURL,
  normalizeSourceURL: normalizeSourceURL,
  normalizeSpriteURL: normalizeSpriteURL
};
exports["default"] = _default;