#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(13)

input = File.read(INPUT).chomp
scanners = read_scanners(input)

puts "Part 1: #{traverse_firewall(scanners)}"
puts "Part 2: #{safe_firewall_traverse_time(scanners)}"
