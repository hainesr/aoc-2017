#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  def get_full_block(blocks)
    index = 0
    n = blocks[index]

    blocks.each_index do |i|
      if blocks[i] > n
        n = blocks[i]
        index = i
      end
    end

    index
  end

  def redistribute_block(blocks, index)
    # Don't alter blocks in place.
    b = Array.new(blocks)
    n = b[index]
    b[index] = 0

    while n > 0
      index = (index < (b.length - 1)) ? index + 1 : 0
      b[index] += 1
      n -= 1
    end

    b
  end

  def reallocate_memory(blocks, count = :first_repeat)
    history = [blocks]
    steps = 1

    while true
      blocks = redistribute_block(blocks, get_full_block(blocks))

      if history.index(blocks)
        if count == :loop
          return reallocate_memory(blocks)
        else
          break
        end
      end

      history.push blocks
      steps += 1
    end

    steps
  end

end
