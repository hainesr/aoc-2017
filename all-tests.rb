#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'test/unit'
require 'aoc-2017'

class TestAOC17 < Test::Unit::TestCase
  include AOC17

  #
  # Day 1.
  #

  def test_captcha_part_1
    assert_equal(inverse_captcha([1, 1, 2, 2]), 3)
    assert_equal(inverse_captcha([1, 1, 1, 1]), 4)
    assert_equal(inverse_captcha([1, 2, 3, 4]), 0)
    assert_equal(inverse_captcha([9, 1, 2, 1, 2, 1, 2, 9]), 9)
  end

  def test_captcha_part_2
    assert_equal(inverse_captcha([1, 2, 1, 2], 2), 6)
    assert_equal(inverse_captcha([1, 2, 2, 1], 2), 0)
    assert_equal(inverse_captcha([1, 2, 3, 4, 2, 5], 3), 4)
    assert_equal(inverse_captcha([1, 2, 3, 1, 2, 3], 3), 12)
    assert_equal(inverse_captcha([1, 2, 1, 3, 1, 4, 1, 5], 4), 4)
  end

  #
  # Day 2.
  #

  def test_corruption_part_1
    assert_equal(corruption_checksum([[5, 1, 9, 5], [7, 3, 5], [2, 4, 6, 8]]), 18)
    assert_equal(corruption_checksum([[0, -1], [10, 10], [-1, -1]]), 1)
  end

  def test_corruption_part_2
    assert_equal(corruption_checksum([[5, 9, 2, 8], [9, 4, 7, 3], [3, 8, 6, 5]], :div), 9)
  end

  #
  # Day 3.
  #

  def test_side_length
    assert_equal(side_length(1), 1)
    assert_equal(side_length(9), 3)
    assert_equal(side_length(12), 5)
    assert_equal(side_length(23), 5)
  end

  def test_spiral_memory
    assert_equal(get_spiral_distance(1), 0)
    assert_equal(get_spiral_distance(12), 3)
    assert_equal(get_spiral_distance(23), 2)
    assert_equal(get_spiral_distance(1024), 31)
  end

  #
  # Day 4.
  #

  def test_check_passphrase
    assert(check_passphrase("aa bb cc dd ee"))
    refute(check_passphrase("aa bb cc dd aa"))
    assert(check_passphrase("aa bb cc dd aaa"))

    assert(check_passphrase("abcde fghij", true))
    refute(check_passphrase("abcde xyz ecdab", true))
    assert(check_passphrase("a ab abc abd abf abj", true))
    assert(check_passphrase("iiii oiii ooii oooi oooo", true))
    refute(check_passphrase("oiii ioii iioi iiio", true))
  end

end
