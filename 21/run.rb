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

rules = PatternRules.load_rules(input)

pattern = Pattern.create(".#./..#/###")
pattern.enhance(rules, 5)
puts "Part 1: #{pattern.count_on}"

pattern = Pattern.create(".#./..#/###")
pattern.enhance(rules, 18)
puts "Part 2: #{pattern.count_on}"
