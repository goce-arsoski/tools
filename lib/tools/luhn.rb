module Tools
  class Luhn
    def initialize(str)
      @stripped = str.delete(' ')
    end

    def valid?
      return false if /\D/.match(@stripped)

      return false if @stripped.length <= 1

      (calculation % 10).zero?
    end

    private

    def reversed_array
      @stripped.reverse.chars
    end

    def checksum
      every_second_digit_from_right.map do |num|
        double = num * 2
        double >= 10 ? double - 9 : double
      end
    end

    def every_second_digit_from_right
      indexes(1).map { |i| reversed_array[i].to_i }
    end

    def rest_of_the_elements
      indexes.map { |i| reversed_array[i].to_i }
    end

    def indexes(idx = 0)
      (idx..reversed_array.length - 1).step(2)
    end

    def calculation
      (checksum + rest_of_the_elements).sum
    end
  end
end
