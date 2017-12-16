#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def read_scanners(input)
    Hash[input.split("\n").map { |line| line.split(': ').map { |s| s.to_i } }]
  end

  def scanner_position_0(depth, time)
    depth.nil? ? false : (time % ((depth * 2) - 2)) == 0
  end

  def traverse_firewall(scanners)
    score = 0

    (scanners.keys.max + 1).times do |time|
      depth = scanners[time]
      if scanner_position_0(depth, time)
        score += depth * time
      end
    end

    score
  end

end
