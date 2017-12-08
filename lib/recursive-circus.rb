#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def get_bottom_program(tower)

    # Get the list of program names from the input.
    programs = tower.split("\n").map { |l| l.split("->") }.flatten.map { |s| s.split(" ") }.flatten.delete_if { |p| p.include?('(') }.map { |p| p.chomp(',') }

    # Now it's just the one that only appears once in the program list.
    programs.group_by{ |e| e }.select { |k, v| v.size == 1 }.keys[0]
  end

end
