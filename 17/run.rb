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

while spinlock.step != 2018 do; end

puts "Part 1: #{spinlock.buffer[spinlock.position + 1]}"
