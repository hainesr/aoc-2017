#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = "hxtvlmkl"
blocks = defrag_blocks_init(INPUT)

puts "Part 1: #{defrag_blocks_used(blocks)}"
puts "Part 2: #{defrag_blocks_regions(blocks)}"
