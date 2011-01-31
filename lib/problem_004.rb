class Problem004
  attr_accessor :minimum, :maximum
  include Enumerable

  def each
    values = []
    maximum.downto(minimum).each do |i|
      i.downto(minimum).each do |j|
        values << i * j
      end
    end
    values.sort.reverse.each { |n| yield n }
  end

  class ::Integer
    def palindrome?
      text = self.to_s
      text == text.reverse
    end
  end

  def run
    self.minimum = 100
    self.maximum = 999
    find { |x| x.palindrome? }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem004.new.run}"
end
