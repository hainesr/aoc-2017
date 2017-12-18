#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Spinlock
    attr_reader :buffer
    attr_reader :position

    def initialize(steps)
      @buffer = [0]
      @steps = steps
      @value = 1
      @position = 0
    end

    def step
      @position = ((@position + @steps) % @buffer.length) + 1
      @buffer.insert(@position, @value)
      @value += 1
    end

  end

end
