module Tools
  class Antipodes
    def initialize(antipodes)
      @antipodes = antipodes
      @half = @antipodes.length / 2
    end

    def antipodes_res
      return @antipodes if @antipodes.length < 2

      (0..@half - 1).map { |i| (left[i] + right[i]) / 2.0 }
    end

    private

    def left
      @antipodes.first(@half)
    end

    def right
      @antipodes.last(@half).reverse
    end
  end
end
