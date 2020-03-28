require "tools/version"

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

  class Allergies
    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }

    def initialize(score)
      @score = score
    end

    def overscore
      score = @score
      return false if score % 256 == 0

      score -= 256 while score > 256
      score
    end

    def allergic_to?(allergen)
      overscore

      allergic_list = calculation.reverse.map { |num| ALLERGENS[num] }
      allergic_list.include? allergen
    end

    def allergies_list
      allergies = []
      ALLERGENS.each do |key, _|
        allergies << key if @score >= key
      end
      allergies
    end

    def calculation
      list = []
      score = @score
      allergies_list.reverse.each do |num|
        if score >= num
          score -= num
          list << num
        end
      end
      list
    end
  end
end
