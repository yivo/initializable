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
