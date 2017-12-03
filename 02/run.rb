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

input = []
File.foreach(INPUT) do |line|
  input.push line.split("\t").map { |x| x.to_i }
end

puts "Part 1: #{corruption_checksum(input)}"
puts "Part 2: #{corruption_checksum(input, :div)}"
