require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      @sum = 0
    end

    def valid?
      return false if @str.length <= 1

      true
    end
  end
end