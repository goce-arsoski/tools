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
    LIMIT =256
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

    def allergic_to?(allergen)
      score_allergens.include?(allergen)
    end

    def score_allergens
      allergen_keys.map { |key| ALLERGENS[key] }
    end

     private

    def score
      @score -= LIMIT while @score >= LIMIT
      @score
    end

    def keys
      ALLERGENS.keys.select { |key| key <= score }.sort.reverse
    end

    def allergen_keys
      sc = score
      keys.select { |elem| sc >= elem && sc -= elem }
    end
  end

  class Resistor
    COLORS_RESISTANCE = %w[black brown red orange yellow green blue violet gray white]
    COLORS_TOLERANCE = {
      'gray' => 0.05,
      'violet' => 0.1,
      'blue' => 0.25,
      'green' => 0.5,
      'brown' => 1,
      'red' => 2,
      'gold' => 5,
      'silver' => 10,
      '' => 20
    }

    def initialize(resistor)
      @resistor = resistor
    end

    def info
      "#{resistance} ohms +/-#{tolerance}%"
    end

    def resistance
      (colors_resistance(@resistor[0]) * 10 + colors_resistance(@resistor[1])) * 10**colors_resistance(@resistor[2])
    end

    def colors_resistance(color)
      COLORS_RESISTANCE.each_with_index do |num, idx|
        return idx if num == color
      end
    end

    def tolerance
      COLORS_TOLERANCE.each do |key, value|
        return COLORS_TOLERANCE[''] if @resistor[3].nil?
        return value if key == @resistor[3]
      end
    end
  end
end
