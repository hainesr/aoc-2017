#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC17

INPUT = File.join(File.dirname(__FILE__), 'input.txt')

input = File.read(INPUT)

puts "Part 1: #{get_bottom_program(input)}"
puts "Part 2: #{balance_tower(create_program_tower(input))}"
