# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC17

INPUT = File.join(File.dirname(__FILE__), 'input.txt')

num = 0
File.foreach(INPUT) do |line|
  num += 1 if check_passphrase(line)
end

puts "Part 1: #{num}"
