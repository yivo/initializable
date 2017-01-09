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
