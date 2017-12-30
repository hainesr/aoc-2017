#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'rubygems'
require 'bundler/setup'

require 'aoc-2017/inverse-captcha'
require 'aoc-2017/corruption-checksum'
require 'aoc-2017/spiral-memory'
require 'aoc-2017/high-entropy-passphrases'
require 'aoc-2017/twisty-trampolines'
require 'aoc-2017/memory-reallocation'
require 'aoc-2017/recursive-circus'
require 'aoc-2017/registers'
require 'aoc-2017/streams'
require 'aoc-2017/knot-hash'
require 'aoc-2017/hex-ed'
require 'aoc-2017/digital-plumber'
require 'aoc-2017/packet-scanners'
require 'aoc-2017/disk-defragmentation'
require 'aoc-2017/dueling-generators'
require 'aoc-2017/permutation-promenade'
require 'aoc-2017/spinlock'
require 'aoc-2017/duet'
require 'aoc-2017/tubes'
require 'aoc-2017/particle-swarm'
require 'aoc-2017/fractal-art'
require 'aoc-2017/sporifica-virus'
require 'aoc-2017/copro-conflagration'
require 'aoc-2017/electromagnetic-moat'
require 'aoc-2017/halting-problem'

module AOC2017

  def get_input_file(day)
    file = "%02d.txt" % day
    File.join(File.dirname(__FILE__), "..", "etc", file)
  end

end
