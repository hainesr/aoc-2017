#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'aoc-2017'

include AOC2017

INPUT = get_input_file(20)
input = File.read(INPUT).chomp
swarm = Swarm.create(input)

puts "Part 1: #{swarm.closest_to_origin}"

swarm.find_equilibrium(20)
puts "Part 2: #{swarm.particles.length}"
