#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class CoPro
    attr_reader :multiplies

    def initialize(input)
      @program = input.split("\n").map { |l| l.split }
      @pc = 0
      @registers = Hash.new(0)
      @multiplies = 0
    end

    def run
      while @pc >= 0 && @pc < @program.length
        instr, p1, p2 = @program[@pc]
        case instr
        when 'set'
          @registers[p1] = get_value(p2)
          @pc += 1
        when 'sub'
          @registers[p1] -= get_value(p2)
          @pc += 1
        when 'mul'
          @registers[p1] *= get_value(p2)
          @pc += 1
          @multiplies += 1
        when 'jnz'
          if get_value(p1) != 0
            @pc += get_value(p2)
          else
            @pc += 1
          end
        end
      end
    end

    private

    def get_value(i)
      i.ord < 97 ? i.to_i : @registers[i]
    end

  end

end
