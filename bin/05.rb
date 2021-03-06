#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(5)

input = File.read(INPUT).split("\n").map { |x| x.to_i }
in2 = Array.new(input)

puts "Part 1: #{count_jumps(input)}"
puts "Part 2: #{count_jumps_ng(in2)}"
