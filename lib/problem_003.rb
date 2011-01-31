class Problem003

  def prime_factors(value)
    prime = 2
    result = []
    while value >= prime ** 2
      if value % prime == 0
        result << prime
        value /= prime
      else
        prime += 1
      end
    end
    result << value
  end

  def run
    prime_factors(600_851_475_143).max
  end
end

if $0 == __FILE__
  puts "Result: #{Problem003.new.run}"
end
