class Problem033

  def fractions
    Enumerator.new do |yielder|
      (1..9).each do |n|
        (1..9).each do |d|
          (1..9).each do |p|
            fraction = Rational(n,d)
            next if fraction >= 1
            yielder << [n*10+p,d*10+p] if Rational(n*10+p,d*10+p) == fraction
            yielder << [n*10+p,p*10+d] if Rational(n*10+p,p*10+d) == fraction
            yielder << [p*10+n,d*10+p] if Rational(p*10+n,d*10+p) == fraction
            yielder << [p*10+n,p*10+d] if Rational(p*10+n,p*10+n) == fraction
          end
        end
      end
    end
  end

  def run
    fractions.map { |n,d| Rational(n,d) }.reduce(1, :*).denominator
  end
end

if $0 == __FILE__
  puts "Result: #{Problem033.new.run}"
end
