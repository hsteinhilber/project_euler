require 'enumerable'

class PrimeGenerator
  include Enumerable

  def each
    composites = {}
    n = 2
    while true
      if composites.has_key?(n)
        factors = composites[n]
        factors.each { |factor| composites.merge!(n + factor => [factor]) { |key,left,right| left + right } }
        composites.delete(n)
      else
        composites.merge!(n**2 => [n]) { |key,left,right| left + right }
        yield n
     end
      n += 1
    end
  end
end
