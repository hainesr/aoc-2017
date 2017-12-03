#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def corruption_checksum(spreadsheet)
    spreadsheet.reduce(0) do |sum, row|
      sum += (row.max - row.min)
    end
  end

end
