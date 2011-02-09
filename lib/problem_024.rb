class Problem024

  def factorial(n)
    return 1 if n <= 1
    n * factorial(n - 1)
  end

  def perm(index, digits)
    return digits if digits.length == 1
    f = factorial(digits.length - 1)
    q,r = index/f,index%f
    return digits[q] + perm(r, digits[0...q] + digits[q+1...digits.length])
  end

  def run
    perm(999_999, "0123456789")
  end
end

if $0 == __FILE__
  puts "Result: #{Problem024.new.run}"
end
