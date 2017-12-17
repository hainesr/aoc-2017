#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Tower
    attr_accessor :children
    attr_reader :name, :weight

    def initialize(name, weight)
      @name = name
      @weight = weight
      @children = []
    end

    def branch_weight
      @children.map do |c|
        c.branch_weight
      end.reduce(@weight, :+)
    end

    # This returns a tuple: [common_weight, unique_node]
    def common_child_weights
      weights = @children.map do |c|
        c.branch_weight
      end

      common_weight = (weights.count(weights[0]) == 1 ? weights[1] : weights[0])

      unique = nil
      @children.each do |c|
        if c.branch_weight != common_weight
          unique = c
          break
        end
      end

      [common_weight, unique]
    end

  end

  def unbalanced_program(tower)
    ub = tower.clone
    prev = nil
    while not (ub = ub.common_child_weights[1]).nil?
      prev = ub.clone
    end
    prev
  end

  def balance_tower(tower)
    tower_common_weight, unique_node = tower.common_child_weights
    unbalanced_program(tower).weight + (tower_common_weight - unique_node.branch_weight)
  end

  def create_program_tower(input)
    root = get_bottom_program(input)
    structure = get_program_tree(input)
    weights = get_program_weights(input)

    build_program_tower(root, structure, weights)
  end

  def build_program_tower(node, data, weights)
    tower = Tower.new(node, weights[node])
    data.fetch(node, []).each do |c|
      tower.children << build_program_tower(c, data, weights)
    end
    tower
  end

  def get_bottom_program(tower)

    # Get the list of program names from the input.
    programs = tower.split("\n").map { |l| l.split("->") }.flatten.map { |s| s.split(" ") }.flatten.delete_if { |p| p.include?('(') }.map { |p| p.chomp(',') }

    # Now it's just the one that only appears once in the program list.
    programs.group_by{ |e| e }.select { |k, v| v.size == 1 }.keys[0]
  end

  def get_program_weights(tower)
    pairs = tower.split("\n").map do |line|
      last = line.index(')')
      line[0..last]
    end

    weights = {}
    pairs.each do |pair|
      p = pair.split
      weights[p[0]] = p[1][1..-2].to_i
    end

    weights
  end

  def get_program_tree(tower)
    lines = {}
    tower.split("\n").keep_if { |line| line.include?('->') }.map { |line| line.split(' -> ') }.map do |line|
      last = line[0].index(' ')
      lines[line[0][0...last]] = line[1].split.map { |l| l. chomp(',') }
    end

    lines
  end

end
