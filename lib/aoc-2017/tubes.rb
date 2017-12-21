#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Network

    def initialize(input)
      @net = read_network(input)
      @letters = []
    end

    def find_entrance
      @net[0].index('|')
    end

    def follow
      x = find_entrance
      y = 0
      dir = :down
      current = ''

      while dir != :end
        case dir
        when :down
          dx = 0
          dy = 1
        when :up
          dx = 0
          dy = -1
        when :right
          dx = 1
          dy = 0
        when :left
          dx = -1
          dy = 0
        end

        current = @net[y][x]
        while current != '+'
          if current.ord >= 'A'.ord && current.ord <= 'Z'.ord
            @letters.push current
            return @letters.join if last_letter?(y, x, dir)
          end

          y += dy
          x += dx
          current = @net[y][x]
        end

        y, x, dir = turn_corner(y, x, dir)
      end

      @letters.join
    end

    private

    def last_letter?(y, x, dir)
      case dir
      when :down
        return @net[y + 1].nil? || @net[y + 1][x] == ' '
      when :up
        return (y - 1) < 0 || @net[y - 1][x].nil? || @net[y - 1][x] == ' '
      when :right
        return @net[y][x + 1].nil? || @net[y][x + 1] == ' '
      when :left
        return (x - 1) < 0 || @net[y][x - 1].nil? || @net[y][x - 1] == ' '
      end

      false
    end

    def turn_corner(y, x, dir)
      if dir == :left || dir == :right
        ny = y + 1
        return [ny, x, :down] if (!@net[ny].nil? && @net[ny][x] != ' ')

        ny = y - 1
        return [ny, x, :up] if ny > 0 && (!@net[ny].nil? && @net[ny][x] != ' ')
      end

      if dir == :up || dir == :down
        nx = x + 1
        return [y, nx, :right] if (!@net[y][nx].nil? && @net[y][nx] != ' ')

        nx = x - 1
        return [y, nx, :left] if nx > 0 && (!@net[y][nx].nil? && @net[y][nx] != ' ')
      end

      [nil, nil, :end]
    end

    def read_network(input)
      input.split("\n").map { |line| line.chars }
    end

  end

end
