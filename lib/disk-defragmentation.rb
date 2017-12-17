#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def defrag_blocks_init(key)
    blocks = []

    128.times do |i|
      row_key = "%s-%d" % [key, i]
      knot = KnotHash.new.full_hash(row_key)
      blocks.push ("%0128b" % knot.to_i(16)).chars.map { |c| c.to_i }
    end

    blocks
  end

  def defrag_blocks_used(blocks)
    blocks.reduce(0) do |sum, list|
      sum += list.reduce(0) do |s, i|
        s += i
      end
    end
  end

end
