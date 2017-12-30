#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

GEN_A_1 = Generator.new(16807, 516)
GEN_B_1 = Generator.new(48271, 190)
GEN_A_2 = Generator.new(16807, 516, 4)
GEN_B_2 = Generator.new(48271, 190, 8)

num = 0
40_000_000.times do
  num += 1 if Generator.compare(GEN_A_1.value, GEN_B_1.value)
end

puts "Part 1: #{num}"

num = 0
5_000_000.times do
  num += 1 if Generator.compare(GEN_A_2.value, GEN_B_2.value)
end

puts "Part 2: #{num}"
