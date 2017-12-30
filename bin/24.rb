#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(24)
input = File.read(INPUT).chomp

components = ComponentSet.new(input)
puts "Part 1: #{components.strongest_bridge}"
puts "Part 2: #{components.strongest_longest_bridge}"
