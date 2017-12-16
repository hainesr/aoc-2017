#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def defrag_blocks_used(key)
    used = 0

    128.times do |i|
      row_key = "%s-%d" % [key, i]
      knot = KnotHash.new.full_hash(row_key)

      # We only need to know how many blocks are used, so a LUT is fine.
      knot.chars.each do |c|
        used += case c.to_i(16)
        when 0 then 0
        when 1, 2, 4, 8 then 1
        when 3, 5, 6, 9, 10, 12 then 2
        when 7, 11, 13, 14 then 3
        when 15 then 4
        end
      end
    end

    used
  end

end
