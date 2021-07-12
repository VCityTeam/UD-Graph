"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = exports.CACHE_POLICIES = void 0;

var _classCallCheck2 = _interopRequireDefault(require("@babel/runtime/helpers/classCallCheck"));

var _createClass2 = _interopRequireDefault(require("@babel/runtime/helpers/createClass"));

var entry;
/**
 * Cache policies for flushing. Those policies can be used when something is
 * [set]{@link Cache.set} into the Cache, as the lifetime property.
 *
 * @typedef {Object} CACHE_POLICIES
 *
 * @property {number} INFINITE - The entry is never flushed, except when the
 * `all` flag is set to `true` when calling {@link Cache.flush}.
 * @property {number} TEXTURE - Shortcut for texture resources. Time is 15 minutes.
 * @property {number} GEOMETRY - Shortcut for geometry resources. Time is 15 minutes.
 * minutes.
 */

var CACHE_POLICIES = {
  INFINITE: Infinity,
  TEXTURE: 900000,
  GEOMETRY: 900000
};
/**
 * This is a copy of the Map object, except that it also store a value for last
 * time used. This value is used for cache expiration mechanism.
 *
 * @example
 * import Cache, { CACHE_POLICIES } from 'Core/Scheduler/Cache';
 *
 * const cache = new Cache(CACHE_POLICIES.TEXTURE)
 * cache.set({ bar: 1 }, 'foo');
 * cache.set({ bar: 32 }, 'foo', 'toto');
 *
 * cache.get('foo');
 *
 * cache.delete('foo');
 *
 * cache.clear();
 *
 * cache.flush();
 */

exports.CACHE_POLICIES = CACHE_POLICIES;

var Cache = /*#__PURE__*/function () {
  /**
   * @param      {number}  [lifetime=CACHE_POLICIES.INFINITE]  The cache expiration time for all values.
   */
  function Cache() {
    var lifetime = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : CACHE_POLICIES.INFINITE;
    (0, _classCallCheck2["default"])(this, Cache);
    this.lifeTime = lifetime;
    this.lastTimeFlush = Date.now();
    this.data = new Map();
  }
  /**
   * Returns the entry related to the specified key, content in array, from the cache.
   * The array contents one to three key.
   * The last time used property of the entry is updated to extend the longevity of the
   * entry.
   *
   * @param {string[]|number[]} keyArray key array ([key0, key1, key3])
   *
   * @return {Object}
   */


  (0, _createClass2["default"])(Cache, [{
    key: "getByArray",
    value: function getByArray(keyArray) {
      return this.get(keyArray[0], keyArray[1], keyArray[2]);
    }
    /**
    * Adds or updates an entry with specified keys array ([key0, key1, key3]).
    * Caution: it overrides any existing entry already set at this/those key/s.
    *
    * @param {Object} value to add in cache
    * @param {string[]|number[]} keyArray key array ([key0, key1, key3])
    *
    * @return {Object} the added value
    */

  }, {
    key: "setByArray",
    value: function setByArray(value, keyArray) {
      return this.set(value, keyArray[0], keyArray[1], keyArray[2]);
    }
    /**
     * Returns the entry related to the specified key from the cache. The last
     * time used property of the entry is updated to extend the longevity of the
     * entry.
     *
     * @param {string|number} key1
     * @param {string|number} [key2]
     * @param {string|number} [key3]
     *
     * @return {Object}
     */

  }, {
    key: "get",
    value: function get(key1, key2, key3) {
      var entry_1 = this.data.get(key1);

      if (entry_1 == undefined) {
        return;
      }

      if (entry_1.lastTimeUsed != undefined) {
        entry = entry_1;
      } else {
        var entry_2 = entry_1.get(key2);

        if (entry_2 == undefined) {
          return;
        }

        if (entry_2.lastTimeUsed != undefined) {
          entry = entry_2;
        } else {
          var entry_3 = entry_2.get(key3);

          if (entry_3 == undefined) {
            return;
          }

          entry = entry_3;
        }
      }

      if (entry.value) {
        entry.lastTimeUsed = Date.now();
        return entry.value;
      }
    }
    /**
     * Adds or updates an entry with specified keys (up to 3).
     * Caution: it overrides any existing entry already set at this/those key/s.
     *
     *
     * @param {Object} value to add in cache
     * @param {string|number} key1
     * @param {string|number} [key2]
     * @param {string|number} [key3]
     *
     * @return {Object} the added value
     */

  }, {
    key: "set",
    value: function set(value, key1, key2, key3) {
      entry = {
        value: value,
        lastTimeUsed: Date.now()
      };

      if (key2 == undefined) {
        this.data.set(key1, entry);
        return value;
      }

      if (!this.data.get(key1)) {
        this.data.set(key1, new Map());
      }

      var entry_map = this.data.get(key1);

      if (key3 == undefined) {
        entry_map.set(key2, entry);
        return value;
      }

      if (!entry_map.get(key2)) {
        entry_map.set(key2, new Map());
      }

      entry_map.get(key2).set(key3, entry);
      return value;
    }
    /**
     * Deletes the specified entry from the cache.
     *
     * @param {string|number} key1
     * @param {string|number} [key2]
     * @param {string|number} [key3]
     */

  }, {
    key: "delete",
    value: function _delete(key1, key2, key3) {
      var entry_1 = this.data.get(key1);

      if (entry_1 === undefined) {
        return;
      }

      if (entry_1.lastTimeUsed != undefined) {
        delete this.data.get(key1);
        this.data["delete"](key1);
      } else {
        var entry_2 = entry_1.get(key2);

        if (entry_2 === undefined) {
          return;
        }

        if (entry_2.lastTimeUsed != undefined) {
          delete entry_1.get(key2);
          entry_1["delete"](key2);

          if (entry_1.size == 0) {
            this.data["delete"](key1);
          }
        } else {
          var entry_3 = entry_2.get(key3);

          if (entry_3 === undefined) {
            return;
          }

          delete entry_2.get(key3);
          entry_2["delete"](key3);

          if (entry_2.size == 0) {
            entry_1["delete"](key2);

            if (entry_1.size == 0) {
              this.data["delete"](key1);
            }
          }
        }
      }
    }
    /**
     * Removes all entries of the cache.
     *
     */

  }, {
    key: "clear",
    value: function clear() {
      this.data.clear();
    }
    /**
     * Flush the cache: entries that have been present for too long since the
     * last time they were used, are removed from the cache. By default, the
     * time is the current time, but the interval can be reduced by doing
     * something like `Cache.flush(Date.now() - reductionTime)`. If you want to
     * clear the whole cache, use {@link Cache.clear} instead.
     *
     * @param {number} [time=Date.now()]
     */

  }, {
    key: "flush",
    value: function flush() {
      var _this = this;

      var time = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : Date.now();

      if (this.lifeTime == CACHE_POLICIES.INFINITE || this.lifeTime > time - this.lastTimeFlush || !this.data.size) {
        return;
      }

      this.lastTimeFlush = Infinity;
      this.data.forEach(function (v1, i) {
        if (_this.lifeTime < time - v1.lastTimeUsed) {
          delete _this.data.get(i);

          _this.data["delete"](i);
        } else {
          v1.forEach(function (v2, j) {
            if (_this.lifeTime < time - v2.lastTimeUsed) {
              delete v1.get(j);
              v1["delete"](j);
            } else {
              v2.forEach(function (v3, k) {
                if (_this.lifeTime < time - v3.lastTimeUsed) {
                  delete v2.get(k);
                  v2["delete"](k);
                } else {
                  // Work for the moment because all flushed caches have 3 key!
                  _this.lastTimeFlush = Math.min(_this.lastTimeFlush, v3.lastTimeUsed);
                }
              });

              if (!v2.size) {
                delete v1.get(j);
                v1["delete"](j);
              }
            }
          });

          if (!v1.size) {
            delete _this.data.get(i);

            _this.data["delete"](i);
          }
        }
      });

      if (this.data.size == 0) {
        this.lastTimeFlush = Date.now();
      }
    }
  }]);
  return Cache;
}();

var _default = Cache;
exports["default"] = _default;