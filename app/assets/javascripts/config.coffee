window.CONF =
  dimensions:
    width: 801
    height: 601
    cell_size: 40
  colors:
    bg: 0
    stroke: 0xFF183E47
    stroke_entrance: 0xFF488E47
    stroke_finish: 0xFFCB433C

CONF.dimensions.cols = Math.floor(CONF.dimensions.width / CONF.dimensions.cell_size)
CONF.dimensions.rows = Math.floor(CONF.dimensions.height / CONF.dimensions.cell_size)