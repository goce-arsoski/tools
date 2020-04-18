module Tools
  class PokemonDamageCalculator
    SUPER_EFFECTIVE = 2
    NEUTRAL = 1
    NOT_VERY_EFECTIVE = 0.5

    def initialize(attack_type, defense_type, attack, defense)
      @attack_type = attack_type
      @defense_type = defense_type
      @attack = attack
      @defense = defense
    end

    def calculate_damage
      (50 * (@attack / @defense) * effectiveness).to_i
    end

    def effectiveness
      return fire(@defense_type) if @attack_type == 'fire'

      return water(@defense_type) if @attack_type == 'water'

      return electric(@defense_type) if @attack_type == 'electric'

      return grass(@defense_type) if @attack_type == 'grass'
    end

    private

    def fire(fire)
      case fire
      when 'fire'
        NOT_VERY_EFECTIVE
      when 'water'
        NOT_VERY_EFECTIVE
      when 'electric'
        NEUTRAL
      when 'grass'
        SUPER_EFFECTIVE
      end
    end

    def water(water)
      case water
      when 'fire'
        SUPER_EFFECTIVE
      when 'water'
        NOT_VERY_EFECTIVE
      when 'electric'
        NOT_VERY_EFECTIVE
      when 'grass'
        NOT_VERY_EFECTIVE
      end
    end

    def electric(electric)
      case electric
      when 'fire'
        NEUTRAL
      when 'water'
        SUPER_EFFECTIVE
      when 'electric'
        NOT_VERY_EFECTIVE
      when 'grass'
        NEUTRAL
      end
    end

    def grass(grass)
      case grass
      when 'fire'
        NOT_VERY_EFECTIVE
      when 'water'
        SUPER_EFFECTIVE
      when 'electric'
        NEUTRAL
      when 'grass'
        NOT_VERY_EFECTIVE
      end
    end
  end
end
