#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def check_passphrase(passphrase)
    pp = passphrase.split
    pp == pp.uniq
  end

end
