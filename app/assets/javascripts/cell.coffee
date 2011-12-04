window.Cell = class Cell
  constructor: (@x, @y, @options = {animate: true, type: CellTypes.blank}) ->
    cell_size = CONF.dimensions.cell_size
    @rect = new toxi.Rect(@x * cell_size, @y * cell_size, cell_size, cell_size)

  render: () ->    
    this.render_edge(edge_id) for edge_id in [0..3]
    this.fill_rect() if @options.type == CellTypes.path
    @options.animate = false

  render_edge: (edge_id) ->
    Game.strokeWeight(1)
    Game.stroke(CONF.colors.stroke)
    edge = @rect.getEdge(edge_id)
    @options.type.render_edge(@x, @y, edge_id, edge)
  
  fill_rect: () ->
    Game.noStroke()
    Game.fill(@options.type.color)
    Game.rect(@rect.x, @rect.y, @rect.width, @rect.height)
    Game.noFill()