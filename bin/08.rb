#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(8)

input = File.read(INPUT)
computer = Computor.process_input(input)

puts "Part 1: #{computer.max_value}"
puts "Part 2: #{computer.running_max}"
