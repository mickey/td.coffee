window.CellTypes =
  blank:
    color: CONF.colors.bg
    render_edge: (x, y, edge_id, edge) ->
      Game.line(edge.a.x, edge.a.y, edge.b.x, edge.b.y)
  path:
    color: 0x80183E47
    render_edge: (x, y, edge_id, edge) ->
      metadata = Game.level.metadata(x, y)
      return if !metadata
      # this thing with y and edge_id is bullshit
      # It doesnt handle a lot of cases
      if metadata == "entrance" && y == 0 && edge_id == 0
        Game.stroke(CONF.colors.stroke_entrance)
        Game.line(edge.a.x, edge.a.y, edge.b.x, edge.b.y)  
      else if metadata == "finish" && x == CONF.dimensions.cols - 1 && edge_id == 1
        Game.stroke(CONF.colors.stroke_finish)
        Game.line(edge.a.x, edge.a.y, edge.b.x, edge.b.y)
