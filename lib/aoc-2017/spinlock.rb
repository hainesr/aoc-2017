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

    def step_to_2017
      while step != 2018 do; end
    end

    def self.simulate_50M(steps)
      pos = 0
      one = nil

      50_000_000.times do |i|
        pos = ((pos + steps) % (i + 1)) + 1
        one = i + 1 if pos == 1
      end

      one
    end

  end

end
