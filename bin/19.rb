#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(19)
input = File.read(INPUT).chomp

net = Network.new(input)
letters, steps = net.follow

puts "Part 1: #{letters}"
puts "Part 2: #{steps}"
