#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  class Computor
    attr_reader :running_max

    def initialize
      @registers = Hash.new(0)
      @running_max = 0
    end

    def process_instruction(target, op, param, c_target, c_op, c_param)
      if @registers[c_target].send(c_op, c_param)
        send(op, target, param)
      end

      @running_max = [@running_max, max_value].max
    end

    def max_value
      @registers.values.max || 0
    end

    def self.process_input(input)
      c = Computor.new

      input.split("\n").map { |l| l.split }.each do |i|
        c.process_instruction(i[0], i[1].to_sym, i[2].to_i, i[4], i[5].to_sym, i[6].to_i)
      end

      c
    end

    private

    def inc(target, param)
      @registers[target] += param
    end

    def dec(target, param)
      @registers[target] -= param
    end

  end

end
