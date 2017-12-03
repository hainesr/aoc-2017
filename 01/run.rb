#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC17

INPUT = File.join(File.dirname(__FILE__), "input.txt")

# Read input; split it up; remove the newline; convert to integers...
input = File.read(INPUT).split('')[0...-1].map { |c| c.to_i }

puts "Part 1: #{reverse_captcha(input)}"
puts "Part 2: #{reverse_captcha(input, (input.length / 2))}"