require 'tools/version'
require 'tools/allergies'
require 'tools/antipodes'
require 'tools/armstrong'
require 'tools/luhn'
require 'tools/raindrops'
require 'tools/resistors'
require 'tools/chocolate_dilemma'
require 'tools/oddnumber'

module Tools
  class Antipodes
    attr_reader :array, :half
    def initialize(array)
      @array = array
      @half = @array.length / 2
    end

    def antipodes_result
      array.length < 2 ? array : (0..half - 1).map { |i| (left[i] + right[i]) / 2.0 }
    end

    private

    def left
      array.first(half)
    end

    def right
      array.last(half).reverse
    end
  end
end
