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

input = File.read(INPUT)
computer = Computor.process_input(input)

puts "Part 1: #{computer.max_value}"
puts "Part 2: #{computer.running_max}"
