#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  class Point
    attr_reader :x, :y, :z

    def initialize(x, y, z)
      @x = x
      @y = y
      @z = z
    end

    def self.create(line)
      x, y, z = line.split(',').map { |i| i.to_i }
      Point.new(x, y, z)
    end

    def manhattan
      @x.abs + @y.abs + @z.abs
    end

    def add(other)
      @x += other.x
      @y += other.y
      @z += other.z
    end

    def to_array
      [@x, @y, @z]
    end

  end

  class Particle
    attr_reader :position, :velocity, :acceleration

    def initialize(pos, vel, acc)
      @position = pos
      @velocity = vel
      @acceleration = acc
    end

    def self.create(line)
      pos, vel, acc = line.split(', ').map do |n|
        Point.create(n[3..-2])
      end

      Particle.new(pos, vel, acc)
    end

    def update
      @velocity.add(@acceleration)
      @position.add(@velocity)
    end

  end

  class Swarm
    attr_reader :particles

    def initialize(particles)
      @particles = particles
    end

    def self.create(input)
      ps = []
      input.split("\n").map do |line|
        ps.push Particle.create(line)
      end

      Swarm.new(ps)
    end

    # As time tends to infinity acceleration will dominate. Sort by the
    # manhattan distance of acceleration, then velocity, then position.
    # Use _with_index to pass in the particle index, which is passed through
    # as the second item of the result (hence [1] at the end).
    def closest_to_origin
      @particles.each_with_index.min_by do |part, index|
        [part.acceleration, part.velocity, part.position].map do |x|
          x.manhattan
        end
      end[1]
    end

    # Move all the particles according to the rules, then remove groups that
    # all have the same position.
    def update
      @particles.each { |part| part.update }
      @particles = @particles.group_by do |part|
        part.position.to_array
      end.select { |_, v| v.length == 1 }.values.flatten
    end

  end

end
