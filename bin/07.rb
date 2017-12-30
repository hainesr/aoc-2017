#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(7)

input = File.read(INPUT)

puts "Part 1: #{get_bottom_program(input)}"
puts "Part 2: #{balance_tower(create_program_tower(input))}"
