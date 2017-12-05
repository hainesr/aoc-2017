#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def count_jumps(instrs)
    i = 0
    steps = 0

    while i >= 0 && i < instrs.length
      j = instrs[i]
      instrs[i] = j + 1
      i += j
      steps += 1
    end

    steps
  end

  def count_jumps_ng(instrs)
    i = 0
    steps = 0

    while i >= 0 && i < instrs.length
      j = instrs[i]
      instrs[i] = (instrs[i] >= 3) ? j - 1 : j + 1
      i += j
      steps += 1
    end

    steps
  end

end
