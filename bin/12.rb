#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(12)

input = File.read(INPUT).chomp
pipes = read_pipes(input)

puts "Part 1: #{get_program_group(pipes, 0).length}"
puts "Part 2: #{get_all_program_groups(pipes).length}"
