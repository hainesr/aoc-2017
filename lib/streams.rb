#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def stream_score(input)
    # First, get rid of the cancelled data.
    input.gsub!(/!./, '')

    # Strip out garbage.
    input.gsub!(/<.*?>/, '')

    # Get rid of anything left that isn't a { or }.
    input.gsub!(/[^{}]/, '')

    # Reduce whatever is left down to a score by stepping through each char.
    _, score = input.chars.reduce([0, 0]) do |(depth, total), c|
      case c
      when ?{ then [depth + 1, total]
      when ?} then [depth - 1, total + depth]
      end
    end

    [score, 0]
  end

end
