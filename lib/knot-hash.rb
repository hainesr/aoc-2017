#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  class KnotHash
    attr_reader :string

    HASH_LOOPS = 64
    XOR_GROUPS = 16
    SEQ_SUFFIX = [17, 31, 73, 47, 23]

    def initialize(size = 256)
      @string = Array.new(size) { |i| i }
      @size = size
      @start = 0
      @skip = 0
    end

    def k_hash(length)
      if length > 1
        @string.rotate!(@start)
        r = @string[0...length]
        r.reverse!
        @string[0...length] = r
        @string.rotate!(@start * -1)
      end

      @start += (length + @skip)
      @start = (@start >= @size) ? @start -= @size : @start
      @skip += 1

      @string
    end

    def checksum
      @string[0] * @string[1]
    end

    def full_hash(input = "")
      lengths = input.chars.map { |c| c.ord } + SEQ_SUFFIX

      HASH_LOOPS.times do
        lengths.each { |l| k_hash(l) }
      end

      dense_hash
    end

    private

    def dense_hash
      dh = []
      XOR_GROUPS.times do |i|
        dh[i] = 0

        XOR_GROUPS.times do |j|
          dh[i] ^= @string[(XOR_GROUPS * i) + j]
        end

        dh[i] = "%02x" % dh[i]
      end

      dh.join
    end

  end

end
