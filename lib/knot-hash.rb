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
      @size = size
      @start = 0
      @skip = 0
    end

    def k_hash(length)
      if length > 1
        @string.rotate!(@start)
        r = @string[0...length]
        r.reverse!
        @string[0...length] = r
        @string.rotate!(@start * -1)
      end

      @start += (length + @skip)
      @start = (@start >= @size) ? @start -= @size : @start
      @skip += 1

      @string
    end

    def checksum
      @string[0] * @string[1]
    end

  end

end
