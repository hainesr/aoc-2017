#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Generator

    DIVISOR = 2147483647

    def initialize(factor, seed, multiple = 1)
      @factor = factor
      @value = seed
      @multiple = multiple
    end

    def value
      while (@value = (@value * @factor) % DIVISOR) % @multiple != 0; end

      @value
    end

    def self.compare(one, two)
      ("%032b" % one)[16..-1] == ("%032b" % two)[16..-1]
    end

  end

end
