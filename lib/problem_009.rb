class Problem009

  def find_triplet
    max = Math.sqrt(500).floor
    2.upto(max) do |m|
      1.upto(m-1) do |n|
        a = m**2 - n**2
        b = 2*m*n
        c = m**2 + n**2
        return [a, b, c] if a + b + c == 1000
      end
    end
  end

  def run
    find_triplet.reduce(1, :*)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem009.new.run}"
end
