module Tools
  class ChocolateDilemma
    def initialize(first, second)
      @first = first
      @second = second
    end

    def fairness?
      total(@first) == total(@second)
    end

    private

    def total(person)
      total = 0
      (0..person.length - 1).map { |i| total += person[i].reduce(:*) }
      total
    end
  end
end
