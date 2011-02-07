class Problem017

  class ::Integer
    WORDS = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
    }

    def to_words
      thousands = self / 1000
      hundreds = (self % 1000) / 100
      tens = (self % 100 / 10) * 10 
      ones = (self % 10) + (tens == 10 ? 10 : 0)
      tens = 0 if tens == 10

      result = ''
      result << WORDS[thousands] + ' thousand' if thousands > 0
      result << WORDS[hundreds] + ' hundred' if hundreds > 0
      result << ' and ' if hundreds > 0 and (tens > 0 or ones > 0)
      result << WORDS[tens] if tens > 0
      result << '-' if tens > 0 and ones > 0
      result << WORDS[ones] if ones > 0

      return result
    end
  end

  def count_letters(words)
    words.split('').count { |c| c =~ /[a-zA-Z]/ }
  end

  def sum_to(max) 
    1.upto(max).inject(0) { |sum,n| sum + count_letters(n.to_words) }
  end

  def run
    sum_to(1_000)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem017.new.run}"
end
