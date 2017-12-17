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

    def initialize(factor, seed)
      @factor = factor
      @value = seed
    end

    def value
      @value = (@value * @factor) % DIVISOR
    end

    def self.compare(one, two)
      ("%032b" % one)[16..-1] == ("%032b" % two)[16..-1]
    end

  end

end
