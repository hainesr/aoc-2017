#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Promenade

    def initialize(size)
      @line = Array.new(size) { |i| ('a'.ord + i).chr }
      @size = size
    end

    def line
      @line.join
    end

    def spin(n)
      @line.rotate!(-n)
    end

    def exchange(a, b)
      c = @line[a]
      @line[a] = @line[b]
      @line[b] = c
    end

    def partner(a, b)
      exchange(@line.index(a), @line.index(b))
    end

    def dance(moves)
      moves.split(',').map do |m|
        move = m[0]
        param = m[1..-1].split('/')
        case move
        when 's'
          spin(param[0].to_i)
        when 'x'
          exchange(param[0].to_i, param[1].to_i)
        when 'p'
          partner(param[0], param[1])
        end
      end
    end

  end

end
