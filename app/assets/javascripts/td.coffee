tdjs ->
  Game.grid = []
  @setup = () =>
    @size(CONF.dimensions.width, CONF.dimensions.height)
    @background(CONF.colors.bg)
    @smooth()
    @noFill()
    @frameRate 10
    Game.level = new Level(1)
    Game.grid = new Grid
    
  @draw = () =>
    for x in [0..CONF.dimensions.cols-1]
      for y in [0..CONF.dimensions.rows-1]
        cell = Game.grid.getCell(x, y)
        if cell.options.animate
          cell.render()
  
  @mousePressed = () =>
    x = Game.grid.getCoordinate(@mouseX)
    y = Game.grid.getCoordinate(@mouseY)
    console.log('['+x+','+y+']')