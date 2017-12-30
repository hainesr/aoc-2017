#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(23)
input = File.read(INPUT).chomp

copro = CoPro.new(input)
copro.run
puts "Part 1: #{copro.multiplies}"

puts "Part 2: #{copro_part_2}"
