#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'prime'

module AOC2017

  class CoPro
    attr_reader :multiplies

    def initialize(input, debug = true)
      @program = input.split("\n").map { |l| l.split }
      @pc = 0
      @registers = Hash.new(0)
      @registers['a'] = 1 unless debug
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

    def h
      @registers['h']
    end

    private

    def get_value(i)
      i.ord < 97 ? i.to_i : @registers[i]
    end

  end

  # Part 2 is searching for non-primes. Register h is incremented for each
  # composite number between the start and end points (registers b and c),
  # with 17 as the step size (sub b -17).
  def copro_part_2
    start = (79 * 100) + 100_000
    stop = start + 17_000
    step = 17

    h = 0
    (start..stop).step(step) { |i| h += 1 unless i.prime? }
    h
  end

end
