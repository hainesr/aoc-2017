#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(6)

input = File.read(INPUT).split("\t").map { |x| x.to_i }

puts "Part 1: #{reallocate_memory(input)}"
puts "Part 2: #{reallocate_memory(input, :loop)}"
