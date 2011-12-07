window.Wave = class Wave
  constructor: (@round = 1) ->    
    @conf = Game.level.conf.waves[@round - 1]
    @delay_before_spawn = 0
    @minions = []
  
  update: () ->
    if @delay_before_spawn == @conf.spawn_delay
      @delay_before_spawn = 0
      minion = new Minion()
      @minions.push(minion)
    @delay_before_spawn++

  render: () ->
    minion.render() for minion in @minions