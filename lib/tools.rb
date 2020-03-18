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

      @stripped = @str.delete(' ')
      return false if @stripped.match(/["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]/)

      return false if @stripped.match(/["!", "\"", "#", "$", "£", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "{", "|", "}", "~"]/)

      sum % 10 == 0? true : false
    end

    private

    def every_second_array
      @reversed_strip = @stripped.reverse
      @reversed_array = @reversed_strip.chars   # moze i so split('')
      every_second_range = (1..@reversed_array.length-1).step(2)
      every_second_array = every_second_range.map { |i| @reversed_array[i] }
      every_second_array.map do |num|
        a = num.to_i*2
        a -= 9 if a >= 10

        @double_every_second_array << a
      end
      return @double_every_second_array
    end

    def every_second_array_2
      every_second_range_2 = (0..@reversed_array.length-1).step(2)
      every_second_array_2 = every_second_range_2.map { |i| @reversed_array[i] }
      every_second_array_2.map do |num|
        a = num.to_i
        @every_second_array_2 << a
      end
      return @every_second_array_2
    end

    def sum
      @sum = every_second_array.sum + every_second_array_2.sum
    end
  end

  class Raindrops
    def initialize(num)
      @num = num
      @aux1 = ''
    end

    def check
      factor
      raindrop_speak
    end

    def factor
      num = @num
      i = 1
      @aux = []
      while i <= num
        @aux << i if (num % i).zero?

        i += 1
      end
      puts "#{@num}'s factors are: #{@aux.join(", ")}"
    end

    def raindrop_speak
      aux = @aux
      num = @num.to_s
      aux.each do |i|
        @aux1 += 'Pling' if i == 3

        @aux1 += 'Plang' if i == 5

        @aux1 += 'Plong' if i == 7
      end
      @aux1 != ''? @aux1 : @aux1 = num
      return @aux1
    end
  end
end
