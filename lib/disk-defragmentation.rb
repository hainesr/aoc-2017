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

  def defrag_blocks_regions(blocks)
    seen = []
    num = 0
    128.times do |i|
      128.times do |j|
        next if blocks[i][j] == 0
        next if seen.include?([i, j])
        num += 1
        _blocks_dfs(blocks, i, j, seen)
      end
    end

    num
  end

  def _blocks_dfs(blocks, i, j, seen)
    return if blocks[i][j] == 0
    return if seen.include?([i, j])

    seen.push [i, j]

    _blocks_dfs(blocks, i - 1, j, seen) if i > 0
    _blocks_dfs(blocks, i + 1, j, seen) if i < 127
    _blocks_dfs(blocks, i, j - 1, seen) if j > 0
    _blocks_dfs(blocks, i, j + 1, seen) if j < 127
  end

end
