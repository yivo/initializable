(function() {
  (function(factory) {
    var root;
    root = typeof self === 'object' && self !== null && self.self === self ? self : typeof global === 'object' && global !== null && global.global === global ? global : void 0;
    if (typeof define === 'function' && typeof define.amd === 'object' && define.amd !== null) {
      root.Initializable = factory(root, Object);
      define(function() {
        return root.Initializable;
      });
    } else if (typeof module === 'object' && module !== null && typeof module.exports === 'object' && module.exports !== null) {
      module.exports = factory(root, Object);
    } else {
      root.Initializable = factory(root, Object);
    }
  })(function(__root__, Object) {
    return {
      VERSION: '1.0.0',
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
