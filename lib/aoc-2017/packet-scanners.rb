#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

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

  def safe_firewall_traverse_time(scanners)
    wait = 0
    stop = false

    while(!stop)
      wait += 1

      (scanners.keys.max + 1).times do |layer|
        time = layer + wait
        depth = scanners[layer]
        break if scanner_position_0(depth, time)
        stop = (layer == scanners.keys.max) # Stop if we get to the last layer.
      end
    end

    wait
  end

end
