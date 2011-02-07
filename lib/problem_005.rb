require 'integer'

class Problem005

  def lcm(range)
    factors = {}
    range.each do |n|
      factors.merge!(n.prime_factors) do |key,x,y|
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
