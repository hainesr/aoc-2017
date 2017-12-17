#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = File.join(File.dirname(__FILE__), 'input.txt')

input = File.read(INPUT).chomp

promenade = Promenade.new(16)
promenade.dance(input)
puts "Part 1: #{promenade.line}"

promenade = Promenade.new(16)
cycle = promenade.get_dance_cycle(input)
cycle_stop = 1_000_000_000 % cycle.length
puts "Part 2: #{cycle[cycle_stop - 1]}"
