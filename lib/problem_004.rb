require 'integer'

class Problem004

  def multiples(range)
    Enumerator.new do |yielder|
      range.each do |i|
        (range.first..i).each do |j|
          yielder << i * j
        end
      end
    end
  end

  def run
    multiples(100..999).select { |x| x.palindrome? }.max
  end
end

if $0 == __FILE__
  puts "Result: #{Problem004.new.run}"
end
