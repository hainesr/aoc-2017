#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(25)
input = File.read(INPUT).chomp

tm = TuringMachine.new(input)
tm.run

puts "Part 1: #{tm.checksum}"
