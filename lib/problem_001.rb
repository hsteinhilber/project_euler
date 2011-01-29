
class Problem001
  def run
    sum_values(1000)
  end

  def values(max) 
    (1...max).each do |n|
      yield n if n % 3 == 0 || n % 5 == 0
    end
  end

  def sum_values(max)
    sum = 0
    values(max) { |n| sum += n }
    sum
  end
end
