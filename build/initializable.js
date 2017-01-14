
/*!
 * initializable 1.0.1 | https://github.com/yivo/initializable | MIT License
 */

(function() {
  (function(factory) {
    var __root__;
    __root__ = typeof self === 'object' && self !== null && self.self === self ? self : typeof global === 'object' && global !== null && global.global === global ? global : Function('return this')();
    if (typeof define === 'function' && typeof define.amd === 'object' && define.amd !== null) {
      __root__.Initializable = factory(__root__, Object);
      define(function() {
        return __root__.Initializable;
      });
    } else if (typeof module === 'object' && module !== null && typeof module.exports === 'object' && module.exports !== null) {
      module.exports = factory(__root__, Object);
    } else {
      __root__.Initializable = factory(__root__, Object);
    }
  })(function(__root__, Object) {
    return {
      VERSION: '1.0.1',
      InstanceMembers: {
        initialized: false,
        initializing: false,
        __initializers__: [],
        initialize: function() {
          var fn, i, len, ref;
          if (!this.initialized && !this.initializing) {
            this.initializing = true;
            ref = this.__initializers__;
            for (i = 0, len = ref.length; i < len; i++) {
              fn = ref[i];
              (typeof fn === 'string' ? this[fn] : fn).apply(this, arguments);
            }
            this.initializing = false;
            this.initialized = true;
          }
          return this;
        }
      },
      ClassMembers: {
        initializer: function() {
          var fn, i, len;
          this.prototype.__initializers__ = this.prototype.__initializers__.slice();
          for (i = 0, len = arguments.length; i < len; i++) {
            fn = arguments[i];
            this.prototype.__initializers__.push(fn);
          }
          if (typeof Object.freeze === "function") {
            Object.freeze(this.prototype.__initializers__);
          }
          return this;
        }
      }
    };
  });

}).call(this);
