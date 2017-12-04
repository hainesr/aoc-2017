#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def check_passphrase(passphrase, anagrams = false)
    pp = passphrase.split

    if anagrams
      pp.map! { |w| w.split('').sort }
    end

    pp == pp.uniq
  end

end
