#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class TuringState

    attr_reader :id

    def initialize(input)
      @id = input[0][-2].to_sym
      @instructions = {0 => {}, 1 => {}}
      2.times do |i|
        @instructions[i][:write] = input[2 + (i * 4)][-2].to_i
        @instructions[i][:move] = input[3 + (i * 4)].chomp('.').split[-1] == "left" ? -1 : 1
        @instructions[i][:next] = input[4 + (i * 4)][-2].to_sym
      end
    end

    def run(i)
      [
        @instructions[i][:write],
        @instructions[i][:move],
        @instructions[i][:next]
      ]
    end

  end

  class TuringMachine

    def initialize(input)
      program = input.split("\n").reject { |l| l == "" }
      @start, @steps = read_params(program)
      @states = read_states(program)
      @tape = Hash.new(0)
      @tc = 0
    end

    def run
      state = @start
      @steps.times do
        w, m, state = @states[state].run(@tape[@tc])
        @tape[@tc] = w
        @tc += m
      end
    end

    def checksum
      @tape.values.sum
    end

    private

    def read_params(prog)
      state = prog[0].split[-1].chomp('.').to_sym
      steps = prog[1].split[-2].to_i

      [state, steps]
    end

    def read_states(prog)
      s = 2
      l = 9
      states = {}

      while s < prog.length
        state = TuringState.new(prog[s, l])
        states[state.id] = state
        s += l
      end

      states
    end

  end

end
