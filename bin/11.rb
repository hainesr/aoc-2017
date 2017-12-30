#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(11)

input = File.read(INPUT).chomp.split(',')

puts "Part 1: #{hex_distance(input)}"
puts "Part 2: #{hex_distance(input, :max)}"
