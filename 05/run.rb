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

input = File.read(INPUT).split("\n").map { |x| x.to_i }

puts "Part 1: #{count_jumps(input)}"
