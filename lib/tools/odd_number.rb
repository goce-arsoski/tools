module Tools
  class OddNumber
    def initialize(array)
      @array = array
    end

    def first_odd_number
      count_to_array.first
    end

    def all_odd_numbers
      count_to_array
    end

    private

    def count_to_hash
      @array.uniq.map { |t| [t, @array.count(t)] }.to_h
    end

    def count_to_array
      odd_numbers = []
      count_to_hash.each { |k, v| v.odd? && odd_numbers << k }
      odd_numbers
    end
  end
end
