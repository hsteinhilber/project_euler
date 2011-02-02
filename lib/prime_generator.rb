require 'enumerable'

class PrimeGenerator
  include Enumerable

  def each
    composites = {}
    def composites.combine!(hash) 
      merge!(hash) do |key,x,y|
        x.push(y.shift) while y.any?; x
      end
    end

    n = 2
    while true
      unless composites.has_key?(n)
        composites.combine!(n**2 => [n])
        yield n
      else
        factors = composites[n]
        factors.each { |factor| composites.combine!(n + factor => [factor]) }
        composites.delete(n)
      end
      n += 1
    end
  end
end
