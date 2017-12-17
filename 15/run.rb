#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

GEN_A = Generator.new(16807, 516)
GEN_B = Generator.new(48271, 190)

num = 0
40_000_000.times do
  num += 1 if Generator.compare(GEN_A.value, GEN_B.value)
end

puts "Part 1: #{num}"
