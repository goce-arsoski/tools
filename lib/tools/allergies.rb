module Tools
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
end
