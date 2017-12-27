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

    def burst_ng
      #puts "#{@current[0]}, #{@current[1]}: #{@map[@current]}"
      case @map[@current]
      when '#'
        right
        @map[@current] = 'F'
      when '.'
        left
        @map[@current] = 'W'
      when 'W'
        @map[@current] = '#'
        @infections += 1
      when 'F'
        back
        @map[@current] = '.'
      end

      @current[0] += @dx
      @current[1] += @dy

      @infections
    end

    def run(iterations, version = :original)
      if version == :evolved
        iterations.times { burst_ng }
      else
        iterations.times { burst }
      end
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

    def back
      @dx = -@dx
      @dy = -@dy
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
