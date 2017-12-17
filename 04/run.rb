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

p1 = 0
p2 = 0
File.foreach(INPUT) do |line|
  p1 += 1 if check_passphrase(line)
  p2 += 1 if check_passphrase(line, true)
end

puts "Part 1: #{p1}"
puts "Part 2: #{p2}"
