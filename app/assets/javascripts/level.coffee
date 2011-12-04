window.LEVELS = {}

window.Level = class Level
  constructor: (@level_number) ->
    @options = _.find(LEVELS, (level_object) =>
      return(level_object.order == @level_number))
    
  
  is_path: (x, y) ->
    path = _.find @options.path, (position) =>
      return(position[0] == x && position[1] == y)
    return true if path
    return false
   
  metadata: (x, y) ->
    r = false
    for pos in @options.path
      if pos[0] == x && pos[1] == y && pos.length == 3
        r = pos[2]
        break
    return r