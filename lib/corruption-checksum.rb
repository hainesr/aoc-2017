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

  def row_div(row)
    row.each do |x|
      row.each do |y|
        next if x == y
        return x / y if x % y == 0
      end
    end
  end

end
