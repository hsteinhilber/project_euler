class Problem012
  include Enumerable

  def each
    counter = 1; result = 1
    while true
      yield result
      result += (counter += 1)
    end
  end

  class ::Integer 

    def divisor_count
      return 1 if self == 1
      limit = Math.sqrt(self)
      (2..limit).inject(limit == limit.floor ? 1 : 2) do |count,d|
        count + (self % d == 0 ? 2 : 0)
      end
    end
  end

  def run
    find { |n| n.divisor_count > 500 }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem012.new.run}"
end
