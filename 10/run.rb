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
numbers = input.split(',').map { |c| c.to_i }

knot = KnotHash.new
numbers.each { |i| knot.k_hash(i) }
puts "Part 1: #{knot.checksum}"

knot = KnotHash.new
puts "Part 2: #{knot.full_hash(input)}"
