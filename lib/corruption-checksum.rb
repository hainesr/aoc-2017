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
      sum += send("_row_" + method.to_s, row)
    end
  end

  def _row_diff(row)
    row.max - row.min
  end

  def _row_div(row)
    row.each do |x|
      row.each do |y|
        next if x == y
        return x / y if x % y == 0
      end
    end
  end

end
