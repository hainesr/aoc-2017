#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(2)

input = []
File.foreach(INPUT) do |line|
  input.push line.split("\t").map { |x| x.to_i }
end

puts "Part 1: #{corruption_checksum(input)}"
puts "Part 2: #{corruption_checksum(input, :div)}"
