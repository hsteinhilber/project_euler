class Problem017

  LETTERS = {
    1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4, 10 => 3,
    11 => 6, 12 => 6, 13 => 8, 14 => 8, 15 => 7, 16 => 7, 17 => 9, 18 => 8, 19 => 8,
    20 => 6, 30 => 6, 40 => 5, 50 => 5, 60 => 5, 70 => 7, 80 => 6, 90 => 6, 0 => 0
  }

  ONE_THOUSAND = 11
  HUNDRED = 7
  AND = 3
 
  def letters_for(n)
    sum = 0
    sum += ONE_THOUSAND and n %= 1000 if n >= 1000
    sum += LETTERS[n / 100] + HUNDRED and n %= 100 if n >= 100
    sum += AND if sum > 0 and n > 0
    sum += LETTERS[n - n%10] + LETTERS[n%10] and n = 0 if n >= 20
    sum += LETTERS[n]
  end

  def sum_to(max) 
    (1..max).reduce(0) { |sum, n| sum + letters_for(n) }
  end

  def run
    sum_to(1_000)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem017.new.run}"
end
