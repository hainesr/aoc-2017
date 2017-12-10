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

  #
  # Day 5.
  #

  def test_count_jumps
    assert_equal(count_jumps([0, 3, 0, 1, -3]), 5)

    assert_equal(count_jumps_ng([0, 3, 0, 1, -3]), 10)
  end

  #
  # Day 6.
  #

  def test_get_full_block
    assert_equal(get_full_block([0, 2, 7, 0]), 2)
    assert_equal(get_full_block([2, 4, 1, 2]), 1)
    assert_equal(get_full_block([3, 1, 2, 3]), 0)
    assert_equal(get_full_block([0, 2, 3, 4]), 3)
    assert_equal(get_full_block([1, 3, 4, 1]), 2)
  end

  def test_redistribute_block
    assert_equal(redistribute_block([0, 2, 7, 0], 2), [2, 4, 1, 2])
    assert_equal(redistribute_block([2, 4, 1, 2], 1), [3, 1, 2, 3])
    assert_equal(redistribute_block([3, 1, 2, 3], 0), [0, 2, 3, 4])
    assert_equal(redistribute_block([0, 2, 3, 4], 3), [1, 3, 4, 1])
    assert_equal(redistribute_block([1, 3, 4, 1], 2), [2, 4, 1, 2])
  end

  def test_reallocate_memory
    assert_equal(reallocate_memory([0, 2, 7, 0]), 5)
    assert_equal(reallocate_memory([0, 2, 7, 0], :loop), 4)
  end

  #
  # Day 7.
  #

  TEST_TOWER =
  "pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)"

  def test_get_bottom_program
    assert_equal(get_bottom_program(TEST_TOWER), "tknk")
  end

  def test_get_program_tree
    structure = get_program_tree(TEST_TOWER)
    assert_equal(structure["fwft"], ["ktlj", "cntj", "xhth"])
    assert_equal(structure["tknk"], ["ugml", "padx", "fwft"])
    assert_nil(structure["cntj"])
  end

  def test_get_program_weights
    weights = get_program_weights(TEST_TOWER)
    assert_equal(weights["pbga"], 66)
    assert_equal(weights["tknk"], 41)
    assert_equal(weights["fwft"], 72)
    assert_equal(weights["ebii"], 61)
  end

  def test_branch_weights_and_test_balance_tower
    tower = create_program_tower(TEST_TOWER)

    # Test correct tower and sub-tower weights.
    assert_equal(tower.branch_weight, 778)
    assert_equal(tower.children[1].branch_weight, 243)

    # test correct tower and sub-tower common child weights, and unique nodes.
    tcw, un = tower.common_child_weights
    assert_equal(tcw, 243)
    assert_equal(un.name, "ugml")

    tcw, un = tower.children[1].common_child_weights
    assert_equal(tcw, 66)
    assert_equal(un, nil)

    # Test correct unbalanced program and correct weight to balance the tower.
    assert_equal(unbalanced_program(tower).name, "ugml")
    assert_equal(balance_tower(tower), 60)
  end

  #
  # Day 8.
  #

  TEST_INSTRUCTIONS =
  "b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10"

  def test_zero_max_value
    comp = Computor.new
    assert_equal(comp.max_value, 0)
  end

  def test_process_instructions
    comp = Computor.process_input(TEST_INSTRUCTIONS)
    assert_equal(comp.max_value, 1)
    assert_equal(comp.running_max, 10)
  end

  #
  # Day 9.
  #

  def test_stream_score
    assert_equal(stream_score("{}"), 1)
    assert_equal(stream_score("{{{}}}"), 6)
  end
end
