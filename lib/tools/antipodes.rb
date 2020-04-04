module Tools
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
