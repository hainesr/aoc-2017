#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(22)
input = File.read(INPUT).chomp

virus = Sporifica.new(input, 12, 12)
virus.run(10_000)
puts "Part 1: #{virus.infections}"

virus = Sporifica.new(input, 12, 12)
virus.run(10_000_000, :evolved)
puts "Part 2: #{virus.infections}"
