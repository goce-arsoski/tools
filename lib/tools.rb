require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      @sum = 0
      @double_every_second_array = []
      @every_second_array_2 = []
    end

    def valid?
      return false if @str.length <= 1 || @str.chars.first == ' '

      stripped = @str.delete(' ')
      return false if stripped.match(/["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]/)

      return false if stripped.match(/["!", "\"", "#", "$", "£", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "{", "|", "}", "~"]/)

      reversed_strip = stripped.reverse
      reversed_array = reversed_strip.chars   # moze i so split('')
      every_second_range = (1..reversed_array.length-1).step(2)
      every_second_array = every_second_range.map { |i| reversed_array[i] }
      every_second_array.map do |num|
        a = num.to_i*2
        if a >= 10
          a -= 9
        end

        @double_every_second_array << a
      end
      every_second_range_2 = (0..reversed_array.length-1).step(2)
      every_second_array_2 = every_second_range_2.map { |i| reversed_array[i] }
      every_second_array_2.map do |num|
        a = num.to_i
        @every_second_array_2 << a
      end
      if sum % 10 == 0
        return true
      else
        return false
      end
    end

    private

    def sum
      @sum = @double_every_second_array.sum + @every_second_array_2.sum
    end
  end
end