require 'integer'

module Problem036
  class << self

    def add_palindromes(range)
      range.select { |n| n.palindrome? && n.palindrome?(2) }.reduce(0, :+)
    end
    
    def run
      add_palindromes(1...1_000_000)
    end
  end
end

if __FILE__ == $0
  puts "Result: #{Problem036.run}"
end
