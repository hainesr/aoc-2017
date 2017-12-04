#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def side_length(num)
    rounded_root = Math.sqrt(num).ceil
    (rounded_root % 2 != 0) ? rounded_root : rounded_root + 1
  end

  def get_spiral_distance(num)
    return 0 if num == 1

    side = side_length(num)
    distance_to_centre = (side - 1) / 2
    axis_offset = (num - (side - 2) ** 2) % (side - 1)

    distance_to_centre + (axis_offset - distance_to_centre).abs
  end

end
