#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class ComponentSet

    def initialize(input)
      @set = input.split("\n").map { |c| c.split('/').map(&:to_i) }
      @bridges = []
      @set.select{ |c| c.include?(0) }.each do |r|
        set = @set.reject { |c| c == r }
        @bridges.push build_tree(set, r)
      end
    end

    def strongest_bridge
      @bridges.map { |b| b.strongest }.max
    end

    def longest_bridge
      @bridges.map { |b| b.longest }.max + 1
    end

    def strongest_longest_bridge
      depth = longest_bridge - 1
      @bridges.map { |b| b.strongest(depth) }.max
    end

    private

    def build_tree(set, comp, val = 0, depth = 0, str = 0)
      ns = str + comp.sum
      node = ComponentTree.new(comp, depth, ns)

      o = (comp[0] == val) ? comp[1] : comp[0]
      set.select{ |c| c.include?(o) }.each do |r|
        s = set.reject { |c| c == r }
        node.children << build_tree(s, r, o, depth + 1, ns)
      end

      node
    end

  end

  class ComponentTree

    attr_reader :value
    attr_accessor :children, :depth

    def initialize(v, d, s)
      @value = v
      @depth = d
      @strength = s
      @children = []
    end

    def strongest(d = nil, s = [])
      if @children == []
        if d.nil?
          s += [@strength]
        elsif d == @depth
          s += [@strength]
        else
          s += [0]
        end
      else
        s += @children.map { |c| c.strongest(d, s) }
      end

      s.max
    end

    def longest(d = [])
      d += @children == [] ? [@depth] : @children.map { |c| c.longest(d) }
      d.max
    end

  end

end
