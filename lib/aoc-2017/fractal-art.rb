#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Pattern
    attr_reader :size

    def initialize(grid)
      @size = grid.length
      @grid = grid
    end

    def count_on
      @grid.join.count('#')
    end

    def count_off
      @grid.join.count('.')
    end

    def flip_h
      Pattern.new(@grid.map(&:reverse))
    end

    def flip_v
      Pattern.new(@grid.reverse)
    end

    def rotate_90
      Pattern.new(@grid.map(&:chars).transpose.map(&:join).map(&:reverse))
    end

    def rotate_180
      Pattern.new(@grid.map(&:reverse).reverse)
    end

    def rotate_270
      Pattern.new(@grid.map(&:reverse).map(&:chars).transpose.map(&:join))
    end

    def enhance(rules, iterations = 1)
      iterations.times do
        patterns = divide
        grids = []

        patterns.each do |pat|
          m = rules.match(pat)
          grids.push m unless m.nil?
        end

        join(grids)
      end
    end

    def to_a
      @grid
    end

    def to_s(fmt = :pretty)
      return @grid.join('/') if fmt == :flat
      @grid.join("\n")
    end

    def self.create(input)
      Pattern.new(input.split('/'))
    end

    private

    def join(grids)
      return @grid if grids.length == 0

      if grids.length == 1
        @grid = grids[0].split('/')
      else
        slice_size = Math.sqrt(grids.length).to_i
        slices = grids.map { |g| g.split('/') }.each_slice(slice_size).to_a
        @grid = slices.map { |s| s.transpose }.map do |s|
          s.map(&:join)
        end.flatten(1)
      end

      @size = @grid.length
      @grid
    end

    def divide
      div = (@grid.length % 2 == 0) ? 2 : 3
      len = @grid.length / div
      nps = []

      (0...len).map do |i|
        (0...len).map do |j|
          np = (0...div).map do |k|
            (0...div).map { |l| @grid[k + i*div][l + j*div] }.join
          end
          nps.push Pattern.new(np)
        end
      end

      nps
    end

  end

  class PatternRules

    def initialize(rules)
      @rules = rules
    end

    def self.load_rules(input)
      rules = {}

      input.split("\n").map { |r| r.split(" => ") }.map do |r|
        key = Pattern.create(r[0])
        value = r[1]
        rules[key.to_s(:flat)] = value
        rules[key.rotate_90.to_s(:flat)] = value
        rules[key.rotate_180.to_s(:flat)] = value
        rules[key.rotate_270.to_s(:flat)] = value
        rules[key.flip_h.to_s(:flat)] = value
        rules[key.flip_v.to_s(:flat)] = value
        rules[key.flip_h.rotate_90.to_s(:flat)] = value
        rules[key.flip_v.rotate_90.to_s(:flat)] = value
      end

      PatternRules.new(rules)
    end

    def size
      @rules.size
    end

    def match(pattern)
      @rules[pattern.to_s(:flat)]
    end

  end


end
