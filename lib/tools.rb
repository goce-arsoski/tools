require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      @sum = 0
    end

    def valid?
      str1 = @str.scan(/\w/).join('')
      str2 = @str.scan(/\W/).join('')
      return false if str2[0] == '-' || str2[0] == '$' || str2[0] == '£'
      if str1.match(/['a'.upto('z')]/) || str1.length <= 2
        return false
      else
        @aux = @str.scan(/\w/).join(', ').split(' ').reverse
        @aux.each_with_index do |num, idx|
          @aux[idx] = num.to_i
          aux1 = num.to_i
          if idx % 2 !=0 && aux1 <= 9
            aux1 *= 2
            @aux[idx] = aux1
          end

          if idx % 2 !=0 && aux1 > 9
            aux1 -= 9
            @aux[idx] = aux1
          end

        end
          @aux.each { |x| @sum += x }
          if @sum % 10 == 0 
            return true
          else 
            return false
          end
      end
    end
  end
end