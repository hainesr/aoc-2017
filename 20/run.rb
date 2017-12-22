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

swarm = Swarm.create(input)

puts "Part 1: #{swarm.closest_to_origin}"
