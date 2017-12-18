#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

spinlock = Spinlock.new(382)
spinlock.step_to_2017

puts "Part 1: #{spinlock.buffer[spinlock.position + 1]}"
puts "Part 2: #{Spinlock.simulate_50M(382)}"
