window.LEVELS = {}

window.Level = class Level
  constructor: (@level_number) ->
    @conf = _.find(LEVELS, (level_object) =>
      return(level_object.order == @level_number))
  
  is_path: (x, y) ->
    _is_path = false
    for paths in @conf.path
      for pos in paths
        _is_path = true if pos[0] == x && pos[1] == y
    return _is_path
   
  metadata: (x, y) ->
    r = false

    for paths in @conf.path
      for pos in paths
        if pos[0] == x && pos[1] == y && pos.length == 3
          r = pos[2]
          break
    return r
  
  # doors: () ->
  #   doors = []
  #   for p in @conf.path
  #     doors.push(p[0]) # first one is always the entrance
  #   doors