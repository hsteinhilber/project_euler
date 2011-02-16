class Problem028

  def sum_diagonals(side)
    raise "side must be an odd number" if side.even?
    next_corner = 1
    (2...side).step(2).inject(1) do |sum,n|
      4.times { sum += (next_corner += n) }
      sum
    end
  end

  def run
    sum_diagonals(1001)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem028.new.run}"
end
