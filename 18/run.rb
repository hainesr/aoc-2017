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
input = File.read(INPUT).chomp

duet = BrokenDuet.new(input)
puts "Part 1: #{duet.run}"

duet = Duet.new(input)
puts "Part 2: #{duet.run[1]}"
