#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC17

INPUT = File.join(File.dirname(__FILE__), 'input.txt')

input = File.read(INPUT).chomp.split(',').map { |c| c.to_i }
knot = KnotHash.new

input.each { |i| knot.k_hash(i) }

puts "Part 1: #{knot.checksum}"
