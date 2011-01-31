class Problem005

  def prime_factors(value) 
    prime = 2
    result = {}
    while value >= prime ** 2
      if value % prime == 0
        result.merge!(prime => 0) if not result.has_key?(prime)
        result[prime] += 1
        value /= prime
      else
        prime += 1
      end
    end
    result.merge!(value => 0) if not result.has_key?(value)
    result[value] += 1
    return result
  end

  def lcm(range)
    factors = {}
    range.each do |n|
      factors.merge!(prime_factors(n)) do |key,x,y|
        x > y ? x : y
      end
    end
    factors.inject(1) { |product,pair| product * (pair[0] ** pair[1]) }
  end

  def run
    lcm(1..20)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem005.new.run}"
end
