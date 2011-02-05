class Problem017

  class ::Integer
    TEENS = ['','one','two','three','four','five',
      'six','seven','eight','nine','ten','eleven','twelve',
      'thirteen','fourteen','fifteen','sixteen','seventeen',
      'eighteen','ninteen']
    LARGER = ['','','twenty','thirty','forty','fifty','sixty','seventy',
      'eighty','ninety']
    def to_words
      result = ''

      tens = self / 10
      teens = self % 10 + (tens == 1 ? 10 : 0)
      tens = 0 if tens == 1

      result = LARGER[tens]
      result += '-' if tens > 1 and teens > 0
      result += TEENS[teens]

      return result
    end
  end

  def run
  end
end

if $0 == __FILE__
  puts "Result: #{Problem017.new.run}"
end
