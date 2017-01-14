###!
# initializable 1.0.1 | https://github.com/yivo/initializable | MIT License
###

((factory) ->

  __root__ = 
    # The root object for Browser or Web Worker
    if typeof self is 'object' and self isnt null and self.self is self
      self

    # The root object for Server-side JavaScript Runtime
    else if typeof global is 'object' and global isnt null and global.global is global
      global

    else
      Function('return this')()

  # Asynchronous Module Definition (AMD)
  if typeof define is 'function' and typeof define.amd is 'object' and define.amd isnt null
    __root__.Initializable = factory(__root__, Object)
    define -> __root__.Initializable

  # Server-side JavaScript Runtime compatible with CommonJS Module Spec
  else if typeof module is 'object' and module isnt null and typeof module.exports is 'object' and module.exports isnt null
    module.exports = factory(__root__, Object)

  # Browser, Web Worker and the rest
  else
    __root__.Initializable = factory(__root__, Object)

  # No return value
  return

)((__root__, Object) ->
  VERSION: '1.0.1'  
  
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