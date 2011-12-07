window.Grid = class Grid
  constructor: () ->
    @grid = []
    @cells_path = new Array
    cell = null
    for x in [0..CONF.dimensions.cols-1]
      @grid[x] = []
      for y in [0..CONF.dimensions.rows-1]
        if Game.level.is_path(x, y)
          cell = new Cell(x, y, {animate: true, type: CellTypes.path, path_id: @cells_path.length})
          @cells_path.push(cell)
        else
          cell = new Cell(x, y, {animate: true, type: CellTypes.blank})
        
        @grid[x][y] = cell

  render: () ->
    for x in [0..CONF.dimensions.cols-1]
      for y in [0..CONF.dimensions.rows-1]
        cell = @getCell(x, y)
        if cell.options.animate
          cell.render()
          
  getCell: (x, y) ->
    @grid[x][y]

  getCoordinate: (coordinate) ->
    return(Game.floor(coordinate / CONF.dimensions.cell_size))