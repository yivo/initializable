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
  VERSION: '1.0.0'  
  
  InstanceMembers:
    initialized:      false
    initializing:     false
    __initializers__: []
    
    initialize: ->
      if not @initialized and not @initializing
        @initializing = true
        for fn in @__initializers__
          (if typeof fn is 'string' then this[fn] else fn).apply(this, arguments)
        @initializing = false
        @initialized  = true
      this
      
  ClassMembers:
    initializer: ->
      this::__initializers__ = this::__initializers__.slice()
      for fn in arguments
        this::__initializers__.push(fn)
      Object.freeze?(this::__initializers__)
      this
)