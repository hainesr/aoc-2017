#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC17

  def corruption_checksum(spreadsheet, method = :diff)
    spreadsheet.reduce(0) do |sum, row|
      sum += send("row_" + method.to_s, row)
    end
  end

  def row_diff(row)
    row.max - row.min
  end

end
