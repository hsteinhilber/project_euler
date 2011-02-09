require 'prime_generator'

class Problem026

  def recurring_decimals(num) 
    (10**2000 / num).to_s.match(/(\d+?)\1+/).captures[0]
  end

  def run
    PrimeGenerator.new.take_while { |n| n < 1000 }.max_by { |n| recurring_decimals(n).length }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem026.new.run}"
end
