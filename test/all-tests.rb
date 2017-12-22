#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'test/unit'
require 'aoc-2017'

class TestAOC2017 < Test::Unit::TestCase
  include AOC2017

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
    assert_equal(stream_score("{}")[0], 1)
    assert_equal(stream_score("{{{}}}")[0], 6)
    assert_equal(stream_score("{{},{}}")[0], 5)
    assert_equal(stream_score("{{{},{},{{}}}}")[0], 16)
    assert_equal(stream_score("{<a>,<a>,<a>,<a>}")[0], 1)
    assert_equal(stream_score("{{<ab>},{<ab>},{<ab>},{<ab>}}")[0], 9)
    assert_equal(stream_score("{{<!!>},{<!!>},{<!!>},{<!!>}}")[0], 9)
    assert_equal(stream_score("{{<a!>},{<a!>},{<a!>},{<ab>}}")[0], 3)
    assert_equal(stream_score("{<{},{},{{}}>}")[0], 1)
    assert_equal(stream_score("{<<<<>}")[0], 1)
  end

  def test_stream_garbage_ammount
    assert_equal(stream_score("{}")[1], 0)
    assert_equal(stream_score("{{{}}}")[1], 0)
    assert_equal(stream_score("{<random characters>}")[1], 17)
    assert_equal(stream_score("{<<<<>}")[1], 3)
    assert_equal(stream_score("{<{!>}>}")[1], 2)
    assert_equal(stream_score("{<!!>}")[1], 0)
    assert_equal(stream_score("{<!!!>>}")[1], 0)
    assert_equal(stream_score('{<{o"i!a,<{i<a>}')[1], 10)
  end

  #
  # Day 10.
  #

  def test_knot_hash
    knot = KnotHash.new(5)
    assert_equal(knot.k_hash(3), [2, 1, 0, 3, 4])
    assert_equal(knot.k_hash(4), [4, 3, 0, 1, 2])
    assert_equal(knot.k_hash(1), [4, 3, 0, 1, 2])
    assert_equal(knot.k_hash(5), [3, 4, 2, 1, 0])
    assert_equal(knot.checksum, 12)
  end

  def test_full_knot_hash
    knot = KnotHash.new
    assert_equal(knot.full_hash, "a2582a3a0e66e6e86e3812dcb672a272")

    knot = KnotHash.new
    assert_equal(knot.full_hash("AoC 2017"), "33efeb34ea91902bb2f59c9920caa6cd")

    knot = KnotHash.new
    assert_equal(knot.full_hash("1,2,3"), "3efbe78a8d82f29979031a4aa0b16a9d")

    knot = KnotHash.new
    assert_equal(knot.full_hash("1,2,4"), "63960835bcdc130f0b66d7ff4f6a5a8e")
  end

  #
  # Day 11.
  #

  def test_hex_distance
    assert_equal(hex_distance(["ne", "ne", "ne"]), 3)
    assert_equal(hex_distance(["ne", "ne", "sw", "sw"]), 0)
    assert_equal(hex_distance(["ne", "ne", "s", "s"]), 2)
    assert_equal(hex_distance(["se", "sw", "se", "sw", "sw"]), 3)
  end

  def test_hex_distance_max
    assert_equal(hex_distance(["ne", "ne", "ne"], :max), 3)
    assert_equal(hex_distance(["ne", "ne", "sw", "sw"], :max), 2)
    assert_equal(hex_distance(["ne", "ne", "s", "s"], :max), 2)
    assert_equal(hex_distance(["se", "sw", "se", "sw", "sw"], :max), 3)
  end

  #
  # Day 12.
  #

  TEST_PIPES =
  "0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5"

  def test_pipes
    pipes = read_pipes(TEST_PIPES)

    assert_equal(pipes[0], [2])
    assert_equal(pipes[1], [1])
    assert_equal(pipes[6], [4, 5])

    assert_equal(get_program_group(pipes, 0), [0, 2, 3, 4, 5, 6])
    assert_equal(get_program_group(pipes, 6), [0, 2, 3, 4, 5, 6])
    assert_equal(get_program_group(pipes, 1), [1])

    assert_equal(get_all_program_groups(pipes), [[0, 2, 3, 4, 5, 6], [1]])
  end

  #
  # Day 13.
  #

  TEST_SCANNERS = "0: 3\n1: 2\n4: 4\n6: 4"

  def test_packet_scanners
    scanners = read_scanners(TEST_SCANNERS)

    assert_equal(scanners[0], 3)
    assert_equal(scanners[1], 2)
    assert_equal(scanners[6], 4)
    assert_equal(scanners[2], nil)
  end

  def test_scanner_position
    assert(scanner_position_0(2, 0))
    assert(scanner_position_0(3, 0))
    assert(scanner_position_0(6, 0))
    assert(scanner_position_0(17, 0))
    assert(scanner_position_0(20, 0))

    refute(scanner_position_0(nil, 0))
    refute(scanner_position_0(2, 1))
    refute(scanner_position_0(3, 1))
    refute(scanner_position_0(6, 1))
    refute(scanner_position_0(17, 1))

    assert(scanner_position_0(3, 4))
    assert(scanner_position_0(4, 6))
    assert(scanner_position_0(5, 8))
  end

  def test_traverse_firewall
    scanners = read_scanners(TEST_SCANNERS)

    assert_equal(traverse_firewall(scanners), 24)
    assert_equal(safe_firewall_traverse_time(scanners), 10)
  end

  #
  # Day 14.
  #

  TEST_DEFRAG = "flqrgnkx"

  def test_defrag_blocks_used
    blocks = defrag_blocks_init(TEST_DEFRAG)

    assert_equal(defrag_blocks_used(blocks), 8108)
    assert_equal(defrag_blocks_regions(blocks), 1242)
  end

  #
  # Day 15.
  #

  def test_generator
    a = Generator.new(16807, 65)
    b = Generator.new(48271, 8921)

    assert_equal(a.value, 1092455)
    assert_equal(b.value, 430625591)
    assert_equal(a.value, 1181022009)
    assert_equal(b.value, 1233683848)
    assert_equal(a.value, 245556042)
    assert_equal(b.value, 1431495498)
    assert_equal(a.value, 1744312007)
    assert_equal(b.value, 137874439)
    assert_equal(a.value, 1352636452)
    assert_equal(b.value, 285222916)
  end

  def test_compare
    a = Generator.new(16807, 65)
    b = Generator.new(48271, 8921)

    refute(Generator.compare(a.value, b.value))
    refute(Generator.compare(a.value, b.value))
    assert(Generator.compare(a.value, b.value))
    refute(Generator.compare(a.value, b.value))
    refute(Generator.compare(a.value, b.value))
  end

  def test_generator_2
    a = Generator.new(16807, 65, 4)
    b = Generator.new(48271, 8921, 8)

    assert_equal(a.value, 1352636452)
    assert_equal(b.value, 1233683848)
    assert_equal(a.value, 1992081072)
    assert_equal(b.value, 862516352)
    assert_equal(a.value, 530830436)
    assert_equal(b.value, 1159784568)
    assert_equal(a.value, 1980017072)
    assert_equal(b.value, 1616057672)
    assert_equal(a.value, 740335192)
    assert_equal(b.value, 412269392)
  end

  #
  # Day 16.
  #

  def test_promenade_moves
    prom = Promenade.new(5)

    assert_equal(prom.line, "abcde")

    prom.spin(1)
    assert_equal(prom.line, "eabcd")

    prom.exchange(3, 4)
    assert_equal(prom.line, "eabdc")

    prom.partner('e', 'b')
    assert_equal(prom.line, "baedc")
  end

  def test_promenade_dance
    prom = Promenade.new(5)
    moves = "s1,x3/4,pe/b"

    prom.dance(moves)
    assert_equal(prom.line, "baedc")

    prom.dance(moves)
    assert_equal(prom.line, "ceadb")
  end

  def test_promenade_cycle
    prom = Promenade.new(5)
    moves = "s1,x3/4,pe/b"
    line = prom.line

    cycle = prom.get_dance_cycle(moves)
    assert_equal(cycle[-1], line)
  end

  #
  # Day 17.
  #

  def test_spinlock_step
    spinlock = Spinlock.new(3)

    assert_equal(spinlock.position, 0)
    assert_equal(spinlock.buffer, [0])

    spinlock.step
    assert_equal(spinlock.position, 1)
    assert_equal(spinlock.buffer, [0, 1])

    spinlock.step
    assert_equal(spinlock.position, 1)
    assert_equal(spinlock.buffer, [0, 2, 1])

    spinlock.step
    assert_equal(spinlock.position, 2)
    assert_equal(spinlock.buffer, [0, 2, 3, 1])

    spinlock.step
    assert_equal(spinlock.position, 2)
    assert_equal(spinlock.buffer, [0, 2, 4, 3, 1])
  end

  def test_spinlock_to_2017
    spinlock = Spinlock.new(3)

    spinlock.step_to_2017
    assert_equal(spinlock.buffer[spinlock.position + 1], 638)
  end

  #
  # Day 18.
  #

  TEST_PROGRAM =
  "set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2"

  def test_broken_duet
    duet = BrokenDuet.new(TEST_PROGRAM)
    assert_equal(duet.run, 4)
  end

  TEST_PROGRAM_2 =
  "snd 1
snd 2
snd p
rcv a
rcv b
rcv c
rcv d"

  def test_duet
    duet = Duet.new(TEST_PROGRAM_2)
    assert_equal(duet.run[1], 3)
  end

  #
  # Day 19.
  #

  TEST_NETWORK = [
    "     |          ",
    "     |  +--+    ",
    "     A  |  C    ",
    " F---|----E|--+ ",
    "     |  |  |  D ",
    "     +B-+  +--+ ",
    "                "
  ].join("\n")

   def test_tubes
     net = Network.new(TEST_NETWORK)

     assert_equal(net.find_entrance, 5)
     letters, steps = net.follow
     assert_equal(letters, "ABCDEF")
     assert_equal(steps, 38)
   end

   #
   # Day 20.
   #

   TEST_PARTICLE_1 = "p=< 3,0,0>, v=< 2,0,0>, a=<-1,0,0>"
   TEST_PARTICLE_2 = "p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>"
   TEST_SWARM = "p=<-6,0,0>, v=< 3,0,0>, a=< 0,0,0>\np=<-4,0,0>, v=< 2,0,0>, a=< 0,0,0>\np=<-2,0,0>, v=< 1,0,0>, a=< 0,0,0>\np=< 3,0,0>, v=<-1,0,0>, a=< 0,0,0>"

   def test_point
     assert_equal(Point.new(-1, 0, 0).manhattan, 1)
     assert_equal(Point.new(4, 0, 3).manhattan, 7)
     pnt = Point.new(4, -1, -2)
     pnt.add(Point.new(-1, 10, 0))
     assert_equal([pnt.x, pnt.y, pnt.z], [3, 9, -2])
   end

   def test_particle
     part = Particle.create(TEST_PARTICLE_1)

     assert_equal(part.position.x, 3)
     assert_equal(part.position.y, 0)
     assert_equal(part.position.z, 0)

     assert_equal(part.velocity.x, 2)
     assert_equal(part.velocity.y, 0)
     assert_equal(part.velocity.z, 0)

     assert_equal(part.acceleration.x, -1)
     assert_equal(part.acceleration.y, 0)
     assert_equal(part.acceleration.z, 0)

     part.update

     assert_equal(part.position.x, 4)
     assert_equal(part.position.y, 0)
     assert_equal(part.position.z, 0)

     assert_equal(part.velocity.x, 1)
     assert_equal(part.velocity.y, 0)
     assert_equal(part.velocity.z, 0)

     part.update

     assert_equal(part.position.x, 4)
     assert_equal(part.position.y, 0)
     assert_equal(part.position.z, 0)

     assert_equal(part.velocity.x, 0)
     assert_equal(part.velocity.y, 0)
     assert_equal(part.velocity.z, 0)
   end

   def test_swarm
     input = [TEST_PARTICLE_1, TEST_PARTICLE_2].join("\n")
     swarm = Swarm.create(input)

     assert_equal(swarm.particles.length, 2)
     assert_equal(swarm.closest_to_origin, 0)
   end

   def test_collisions
     swarm = Swarm.create(TEST_SWARM)

     swarm.update
     assert_equal(swarm.particles.length, 4)

     swarm.update
     assert_equal(swarm.particles.length, 1)
   end

end
