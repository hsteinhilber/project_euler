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
      result = 2
      root = Math.sqrt(self)
      limit = root.floor
      result -= 1 if limit == root # number is a perfect square
      (2..limit).each do |factor|
        result += 2 if self % factor == 0
      end
      return result
    end
  end

  def run
    find { |n| n.factors >= 500 }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem012.new.run}"
end
