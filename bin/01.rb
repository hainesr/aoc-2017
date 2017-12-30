#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(01)

# Read input; split it up; remove the newline; convert to integers...
input = File.read(INPUT).split('')[0...-1].map { |c| c.to_i }

puts "Part 1: #{inverse_captcha(input)}"
puts "Part 2: #{inverse_captcha(input, (input.length / 2))}"
