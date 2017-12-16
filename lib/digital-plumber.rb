#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def read_pipes(input)
    pipes = {}

    input.split("\n").map { |l| l.split }.map do |p|
      pipes[p[0].to_i] = p[2..-1].map { |i| i.chomp(',').to_i }
    end

    pipes
  end

  def get_program_group(pipes, root, group = [])
    group += [root] unless group.include?(root)

    pipes[root].each do |pipe|
      group += get_program_group(pipes, pipe, group) unless group.include?(pipe)
    end

    group.uniq.sort
  end

  def get_all_program_groups(pipes)
    groups = []
    programs = []

    pipes.each do |key, value|
      next if programs.include?(key)
      programs.push(key)
      programs += value
      groups.push(get_program_group(pipes, key))
    end

    groups.uniq
  end

end
