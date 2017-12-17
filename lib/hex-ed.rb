#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  def hex_distance(moves, out = :min)
    x = 0
    y = 0
    max = 0

    moves.each do |m|
      case m
      when 'n' then y += 1
      when 's' then y -= 1
      when 'e' then x += 1
      when 'w' then x -= 1
      when 'ne' then x += 0.5; y += 0.5
      when 'nw' then x -= 0.5; y += 0.5
      when 'se' then x += 0.5; y -= 0.5
      when 'sw' then x -= 0.5; y -= 0.5
      end

      max = [max, (x.abs + y.abs).to_i].max
    end

    out == :max ? max : (x.abs + y.abs).to_i
  end

end
