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

input = File.read(INPUT).chomp.split(',')

puts "Part 1: #{hex_distance(input)}"
