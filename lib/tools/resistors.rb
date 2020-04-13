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

  class Resistors
    COLORS = {
      black: {
        value: 0,
        multiplier: 10**0,
        tolerance: 20
      },
      brown: {
        value: 1,
        multiplier: 10**1,
        tolerance: 1
      },
      red: {
        value: 2,
        multiplier: 10**2,
        tolerance: 2
      },
      orange: {
        value: 3,
        multiplier: 10**3
      },
      yellow: {
        value: 4,
        multiplier: 10**4
      },
      green: {
        value: 5,
        multiplier: 10**5,
        tolerance: 0.5
      },
      blue: {
        value: 6,
        multiplier: 10**6,
        tolerance: 0.25
      },
      violet: {
        value: 7,
        multiplier: 10**7,
        tolerance: 0.1
      },
      gray: {
        value: 8,
        multiplier: 10**8,
        tolerance: 0.05
      },
      white: {
        value: 9,
        multiplier: 10**9
      },
      gold: {
        multiplier: 10**-1,
        tolerance: 5
      },
      silver: {
        multiplier: 10**-2,
        tolerance: 10
      }
    }

    def initialize(resistor)
      @first_digit, @second_digit, @multiplier, @tolerance = resistor
    end

    def specification
      "#{resistance} ohms +/- #{tolerance}%"
    end

    def resistance
      (first_second(@first_digit) * 10 + first_second(@second_digit)) * multiplier
    end

    private

    def first_second(color)
      COLORS[color.downcase.to_sym][:value]
    end

    def multiplier
      @multiplier.nil? ? @multiplier = 1 : COLORS[@multiplier.downcase.to_sym][:multiplier]
    end

    def tolerance
      @tolerance.nil? ? @tolerance = 20 : COLORS[@tolerance.downcase.to_sym][:tolerance]
    end
  end

  class Armstrong
    def initialize(number)
      @number = number
    end

    def valid?
      sum == number
    end

    private

    def sum
      digits.sum { |digit| digit**size }
    end

    def number
      @number.abs
    end

    def digits
      number.digits
    end

    def size
      digits.size
    end
  end

  class Antipodes
    def initialize(antipodes)
      @antipodes = antipodes
      @half = @antipodes.length / 2
    end

    def division_by_two
      return @antipodes if @antipodes.length < 2

      return [left.sum / 2.0 + right.sum / 2.0] if @antipodes.length < 4

      [sum[0].sum / 2.0, sum[1].sum / 2.0]
    end

    private

    def sum
      [left, right].transpose
    end

    def left
      @antipodes.first(@half)
    end

    def right
      @antipodes.last(@half).reverse
    end
  end
end
