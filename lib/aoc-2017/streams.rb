#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  def stream_score(input)
    # First, get rid of the cancelled data.
    input.gsub!(/!./, '')

    # Strip out garbage, and count how much we remove, less < and >.
    garbage = 0
    input.gsub!(/<.*?>/) do |g|
      garbage += (g.length - 2)
    end

    # Get rid of anything left that isn't a { or }.
    input.gsub!(/[^{}]/, '')

    # Reduce whatever is left down to a score by stepping through each char.
    _, score = input.chars.reduce([0, 0]) do |(depth, total), c|
      case c
      when ?{ then [depth + 1, total]
      when ?} then [depth - 1, total + depth]
      end
    end

    [score, garbage]
  end

end
