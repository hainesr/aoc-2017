#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Sporifica
    attr_reader :infections

    def initialize(input, x, y)
      @map = init_map(input)
      @current = [x, y]
      @dx = 0
      @dy = 1
      @infections = 0
    end

    def burst
      if @map[@current] == '#'
        right
        @map[@current] = '.'
      else
        left
        @map[@current] = '#'
        @infections += 1
      end

      @current[0] += @dx
      @current[1] += @dy

      @infections
    end

    def run(iterations)
      iterations.times { burst }
    end

    private

    def left
      tmp = @dx
      @dx = -@dy
      @dy = tmp
    end

    def right
      tmp = @dy
      @dy = -@dx
      @dx = tmp
    end

    def init_map(input)
      map = Hash.new('.')
      input.split("\n").reverse.map.with_index do |l, j|
        l.chars.map.with_index do |c, i|
          index = [i, j]
          map[index] = c
        end
      end
      map
    end

  end

end
