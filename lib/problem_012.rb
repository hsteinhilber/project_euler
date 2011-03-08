class Problem012
  include Enumerable

  def each
    counter = 1
    result = 1
    while true
      yield result
      counter += 1
      result += counter
    end
  end

  class ::Integer 

    def factors
      return 1 if self == 1
      limit = Math.sqrt(self)
      (2..limit).inject(limit == limit.floor ? 1 : 2) do |result,factor|
        result += (self % factor == 0 ? 2 : 0)
      end
    end
  end

  def run
    find { |n| n.factors >= 500 }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem012.new.run}"
end
