class Problem029

  def combinations(max)
    result = []
    (2..max).each do |a|
      (2..max).each do |b|
        result << a ** b
      end
    end
    result
  end

  def run
    combinations(100).uniq.count
  end
end
           
if $0 == __FILE__
  puts "Result: #{Problem029.new.run}"
end
