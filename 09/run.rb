#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = File.join(File.dirname(__FILE__), 'input.txt')

input = File.read(INPUT)

score, garbage = stream_score(input)
puts "Part 1: #{score}"
puts "Part 2: #{garbage}"
