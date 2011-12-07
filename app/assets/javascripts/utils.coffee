window.Util =
  grid_to_pixels: (c) ->
    return(c * CONF.dimensions.cell_size + CONF.dimensions.cell_size/2)