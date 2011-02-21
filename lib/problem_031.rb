class Problem031

  def next_coin(value)
    return 100 if value == 200
    return 50 if value == 100
    return 20 if value == 50
    return 10 if value == 20
    return 5 if value == 10
    return 2 if value == 5
    1
  end
  
  def count_coin_combinations(total, value) 
    return 1 if total == 0 or value == 1
    result = 0
    total.step(0,-value) do |new_total|
      result += count_coin_combinations(new_total, next_coin(value))
    end
    return result
  end

  def run
    count_coin_combinations(200,200)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem031.new.run}"
end
