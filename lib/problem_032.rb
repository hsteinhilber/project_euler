require 'integer'

class Problem032

  def is_pandigital?(*numbers)
    digits = numbers.inject([]) { |digits,n| digits + n.digits }
    digits.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def products
    Enumerator.new do |yielder|
      (1234..9876).each do |p|
        p.divisors.take_while { |d| d < 99 }.each do |m|
          n = p / m
          yielder << [m, n, p] if is_pandigital?(m,n,p)
        end
      end
    end
  end

  def run
    products.map { |m,n,p| p }.uniq.reduce(:+)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem032.new.run}"
end
