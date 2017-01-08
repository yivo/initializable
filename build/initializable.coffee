((factory) ->

  # Browser and WebWorker
  root = if typeof self is 'object' and self isnt null and self.self is self
    self

  # Server
  else if typeof global is 'object' and global isnt null and global.global is global
    global

  # AMD
  if typeof define is 'function' and typeof define.amd is 'object' and define.amd isnt null
    root.Initializable = factory(root, Object)
    define -> root.Initializable

  # CommonJS
  else if typeof module is 'object' and module isnt null and
          typeof module.exports is 'object' and module.exports isnt null
    module.exports = factory(root, Object)

  # Browser and the rest
  else
    root.Initializable = factory(root, Object)

  # No return value
  return

)((__root__, Object) ->
  VERSION: '0.0.1'  
  
  InstanceMembers:
    __initializers__: []
  
    initialize: ->
      for fn in @__initializers__
        (if typeof fn is 'string' then this[fn] else fn).apply(this, arguments)
      this
      
  ClassMembers:
    initializer: ->
      a = []
      i = -1
      l = arguments.length
      a.push(arguments[i]) while ++i < l
      this::__initializers__ = this::__initializers__.concat(a)
      Object.freeze?(this::__initializers__)
      this
)