class ::Integer

  def fact
    (1..self).reduce(1, :*)
  end

  def perm(k)
    self.fact / (self - k).fact
  end

  def comb(k)
    self.perm(k) / k.fact
  end

  def digits
    self.to_s.split('').map { |s| s.to_i }
  end

  def prime_factors 
    value = self
    factors, prime = [], 1
    while value > 1 and prime += 1
      factors << prime and value /= prime while value % prime == 0
      prime = value - 1 if (prime**2) > value
    end
    factors.reduce({}) { |result,factor| result[factor] ||= 0; result[factor] += 1; result }
  end

  def divisors
    return [] if self <= 1
    limit = Math.sqrt(self).floor
    (2..limit).select { |n| self % n == 0 }.inject([1]) do |result,n|
      result << n << self / n
    end.uniq.sort
  end

  def prime?
    return false if self <= 1
    return true if self == 2
    return false if self % 2 == 0
    return true if self < 9
    return false if self % 3 == 0
    factor = 3
    return false if self % factor == 0 while factor += 2 and self >= factor ** 2
    true
  end
end


