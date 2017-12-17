#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

module AOC2017

  def inverse_captcha(numbers, distance = 1)
    length = numbers.length
    numbers = numbers + numbers[0...distance]

    acc = 0
    length.times do |i|
      if numbers[i] == numbers[i + distance]
        acc += numbers[i]
      end
    end

    acc
  end

end
