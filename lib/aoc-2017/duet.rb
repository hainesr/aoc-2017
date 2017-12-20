#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class BrokenDuet

    def initialize(prog)
      @registers = Hash.new(0)
      @prog_cntr = 0
      @last_snd = nil
      @program = load_program(prog)
    end

    def run
      while @prog_cntr >= 0 && @prog_cntr < @program.length
        instr, p1, p2, t1, t2 = @program[@prog_cntr]
        case instr
        when "snd"
          @last_snd = (t1 == :a ? @registers[p1] : p1)
          @prog_cntr += 1
        when "set"
          @registers[p1] = (t2 == :a ? @registers[p2] : p2)
          @prog_cntr += 1
        when "add"
          @registers[p1] += (t2 == :a ? @registers[p2] : p2)
          @prog_cntr += 1
        when "mul"
          @registers[p1] = @registers[p1] * (t2 == :a ? @registers[p2] : p2)
          @prog_cntr += 1
        when "mod"
          @registers[p1] = @registers[p1] % (t2 == :a ? @registers[p2] : p2)
          @prog_cntr += 1
        when "rcv"
          return @last_snd if (t1 == :a ? @registers[p1] : p1) > 0
          @prog_cntr += 1
        when "jgz"
          if (t1 == :a ? @registers[p1] : p1) > 0
            @prog_cntr += p2
          else
            @prog_cntr += 1
          end
        end
      end
    end

    private

    def load_program(program)
      program.split("\n").map { |l| l.split }.each do |e|
        if e[1][0].ord < 97
          e[1] = e[1].to_i
          e[3] = :i
        else
          e[3] = :a
        end
        if !e[2].nil?
          if e[2][0].ord < 97
            e[2] = e[2].to_i
            e[4] = :i
          else
            e[4] = :a
          end
        end
      end
    end

  end

end
