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
      VERSION: '0.0.1',
      InstanceMembers: {
        __initializers__: [],
        initialize: function() {
          var fn, j, len, ref;
          ref = this.__initializers__;
          for (j = 0, len = ref.length; j < len; j++) {
            fn = ref[j];
            (typeof fn === 'string' ? this[fn] : fn).apply(this, arguments);
          }
          return this;
        }
      },
      ClassMembers: {
        initializer: function() {
          var a, i, l;
          a = [];
          i = -1;
          l = arguments.length;
          while (++i < l) {
            a.push(arguments[i]);
          }
          this.prototype.__initializers__ = this.prototype.__initializers__.concat(a);
          if (typeof Object.freeze === "function") {
            Object.freeze(this.prototype.__initializers__);
          }
          return this;
        }
      }
    };
  });

}).call(this);
