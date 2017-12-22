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

net = Network.new(input)
letters, steps = net.follow

puts "Part 1: #{letters}"
puts "Part 2: #{steps}"