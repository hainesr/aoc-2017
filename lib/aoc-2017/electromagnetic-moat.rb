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

    private

    def build_tree(set, comp, val = 0)
      node = ComponentTree.new(comp)

      o = (comp[0] == val) ? comp[1] : comp[0]
      set.select{ |c| c.include?(o) }.each do |r|
        s = set.reject { |c| c == r }
        node.children << build_tree(s, r, o)
      end

      node
    end

  end

  class ComponentTree

    attr_reader :value
    attr_accessor :children

    def initialize(v)
      @value = v
      @children = []
    end

    def strongest
      @value.sum + (@children.map { |c| c.nil? ? 0 : c.strongest }.max || 0)
    end

  end

end
