require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      #@sum = arrays_sum
      @double_every_second_array = []
      @every_second_array_2 = []
    end

    def valid?
      return false if @str.length <= 1 || @str.chars.first == ' '

      @stripped = @str.delete(' ')
      return false if @stripped.match(/["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]/)

      return false if @stripped.match(/["!", "\"", "#", "$", "£", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "{", "|", "}", "~"]/)

      (arrays_sum % 10).zero? ? true : false
    end

    private

    def every_second_array
      @reversed_strip = @stripped.reverse
      @reversed_array = @reversed_strip.chars   # we can do this with split('')
      every_second_range = (1..@reversed_array.length-1).step(2)
      every_second_array = every_second_range.map { |i| @reversed_array[i] }
      every_second_array.map do |num|
        a = num.to_i * 2
        a -= 9 if a >= 10
        @double_every_second_array << a
      end

      @double_every_second_array
    end

    def every_second_array_2
      every_second_range_2 = (0..@reversed_array.length-1).step(2)
      every_second_array_2 = every_second_range_2.map { |i| @reversed_array[i] }
      every_second_array_2.map do |num|
        a = num.to_i
        @every_second_array_2 << a
      end

      @every_second_array_2
    end

    def arrays_sum
      every_second_array.sum + every_second_array_2.sum
    end
  end

  class Raindrops
    def initialize(num)
      @num = num
      @factors = calculate_factors
    end

    def calculate_factors
      results = []

      (1..@num).to_a.each do |elem|
        results << elem if (@num % elem).zero?
      end

      results
    end

    def raindrop_speak
      result = ''

      @factors.each do |i|
        result += 'Pling' if i == 3

        result += 'Plang' if i == 5

        result += 'Plong' if i == 7
      end

      result != '' ? result : @num.to_s
    end
  end
end
