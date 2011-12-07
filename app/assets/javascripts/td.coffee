tdjs ->
  @setup = () =>
    @size(CONF.dimensions.width, CONF.dimensions.height)
    @background(CONF.colors.bg)
    @smooth()
    @noFill()
    @frameRate 30
    Game.util = Util
    Game.level = new Level(1)
    Game.grid = new Grid()
    Game.wave = new Wave()
    
  @draw = () =>
    Game.grid.render()
    
    Game.wave.update() if Game.wave.minions.length < Game.wave.conf.nb_minions - 1
    Game.wave.render()
  
  @mousePressed = () =>
    x = Game.grid.getCoordinate(@mouseX)
    y = Game.grid.getCoordinate(@mouseY)
    console.log('['+x+','+y+']')