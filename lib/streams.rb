#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def stream_score(input)
    _, score = input.chars.reduce([0, 0]) do |(depth, total), c|
      case c
      when ?{ then [depth + 1, total]
      when ?} then [depth - 1, total + depth]
      end
    end

    score
  end

end
