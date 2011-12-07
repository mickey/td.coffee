window.Minion = class Minion
  constructor: () ->
    @conf = Game.wave.conf.spawn
    @path = this.random_path()
    @path_index = 0
    @type = this.random_minion()
    entry = @path[@path_index]
    @next_waypoint =
      x: Game.util.grid_to_pixels(entry[0])
      y: Game.util.grid_to_pixels(entry[1])
    if entry[0] == 0
      @x = -(CONF.dimensions.cell_size/2)
      @y = Game.util.grid_to_pixels(entry[1])
    else if entry[1] == 0
      @x = Game.util.grid_to_pixels(entry[0])
      @y = -(CONF.dimensions.cell_size/2)
    else
      console.log("Minion: there's something WRONG") # if x and y eql 0 ...

  render: () ->
    # Calculating the x distance from the current minion position and the next waypoint
    dist_x = @next_waypoint.x - @x
    dist_y = @next_waypoint.y - @y

    # increase the waypoint flag to make the minion move to the next waypoint
    if (Math.abs(dist_x) + Math.abs(dist_y)) < 1
      @path_index++
      # I should remove the minion from the list
      return if @path_index > @path.length
      if @path_index == @path.length
        # the + 1 should be determined according to which direction is the minion going 
        @next_waypoint =
          x: Game.util.grid_to_pixels(@path[@path_index - 1][0] + 1)
          y: Game.util.grid_to_pixels(@path[@path_index - 1][1])
      else
        @next_waypoint =
          x: Game.util.grid_to_pixels(@path[@path_index][0])
          y: Game.util.grid_to_pixels(@path[@path_index][1])
    # Determining the angle of the minion according to its direction
    angle = Math.atan2(dist_y, dist_x)
    # Updating minion’x and y position according to its direction and speed
    @x = @x + @type.speed * Math.cos(angle)
    @y = @y + @type.speed * Math.sin(angle)
    # Rotating the minion facing the direction it’s walking.
    if @rotation != angle
      @rotation = angle + Game.radians(90)
    Game.fill(175)
    Game.stroke(0)
    Game.pushMatrix()
    Game.translate(@x,@y)
    Game.rotate(@rotation)
    Game.beginShape(Game.TRIANGLES)
    r = 6.0
    Game.vertex(0, -r*2)
    Game.vertex(-r, r*2)
    Game.vertex(r, r*2)
    Game.endShape()
    Game.popMatrix()


  random_path: () ->
    a = Math.floor(Math.random() * Game.level.conf.path.length)
    return(Game.level.conf.path[a])

  random_minion: () ->
    # order minions by weight
    minions = []
    for hash_minion in @conf
      minions.push([hash_minion["type"], hash_minion["weight"]])
    minions = _.sortBy(minions, (ar_minion) =>
      ar_minion[1]).reverse()
    ##
    minion_cum_weight = 0
    random = Math.random()
    for minion in minions
      minion_cum_weight += minion[1]
      return minion[0] if random < minion_cum_weight