#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Part
    attr_reader :done
    attr_reader :asleep
    attr_reader :num_snd

    def initialize(id, prog, queues)
      @id = id
      @snd_to = 1 - @id
      @queues = queues
      @registers = Hash.new(0)
      @registers["p"] = @id
      @prog_cntr = 0
      @num_snd = 0
      @program = load_program(prog)
      @asleep = false
      @done = false
    end

    def step
      instr, p1, p2 = @program[@prog_cntr]
      case instr
      when "snd"
        @queues[@snd_to].push get_value(p1)
        @num_snd += 1
        @prog_cntr += 1
      when "set"
        @registers[p1] = get_value(p2)
        @prog_cntr += 1
      when "add"
        @registers[p1] += get_value(p2)
        @prog_cntr += 1
      when "mul"
        @registers[p1] = @registers[p1] * get_value(p2)
        @prog_cntr += 1
      when "mod"
        @registers[p1] = @registers[p1] % get_value(p2)
        @prog_cntr += 1
      when "rcv"
        rcv = @queues[@id].delete_at(0)
        if rcv.nil?
          return :wait
        else
          @registers[p1] = rcv
          @prog_cntr += 1
        end
      when "jgz"
        if get_value(p1) > 0
          @prog_cntr += get_value(p2)
        else
          @prog_cntr += 1
        end
      end

      return :done if @prog_cntr < 0 || @prog_cntr >= @program.length
      :ok
    end

    private

    def get_value(i)
      i.ord < 97 ? i.to_i : @registers[i]
    end

    def load_program(program)
      program.split("\n").map { |l| l.split }
    end

  end

  class Duet

    def initialize(prog)
      @queues = [[], []]
      @p0 = Part.new(0, prog, @queues)
      @p1 = Part.new(1, prog, @queues)
    end

    def run
      status = [[], []]
      while true
        status[0].push @p0.step
        status[1].push @p1.step

        break if (status[0][-2..-1] == [:wait, :wait]) && (status[1][-2..-1] == [:wait, :wait])

        break if status == [:done, :done] || status == [:wait, :done] || status == [:done, :wait]
      end

      [@p0.num_snd, @p1.num_snd]
    end

  end

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
