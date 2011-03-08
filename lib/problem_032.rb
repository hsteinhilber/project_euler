require 'integer'

class Problem032

  def is_pandigital?(*numbers)
    digits = numbers.inject([]) { |digits,n| digits + n.digits }
    digits.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def products
    Enumerator.new do |yielder|
      min, max = 1234,9876
      1.upto(99) do |m|
        min, max = 123, 987 if m > 9
        min.upto(max) do |n|
          yielder << [m, n, m*n] if is_pandigital?(m,n,m*n)
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
