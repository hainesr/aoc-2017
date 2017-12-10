#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  class KnotHash
    attr_reader :string

    def initialize(size = 256)
      @string = Array.new(size) { |i| i }
      @start = 0
      @skip = 0
    end

    def k_hash(length)
      @string.rotate!(@start)
      r = @string[0...length]
      r.reverse!
      @string[0...length] = r
      @string.rotate!(@start * -1)
      @start = length + @skip
      @skip += 1

      @string
    end

  end

end
