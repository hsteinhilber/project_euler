class ::Integer

  def fact
    return 1 if self <= 1
    self * (self - 1).fact
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
    prime = 2
    result = {}
    value = self
    while value >= prime ** 2
      if value % prime == 0
        result.merge!(prime => 0) if not result.has_key?(prime)
        result[prime] += 1
        value /= prime
      else
        prime += 1
      end
    end
    result.merge!(value => 0) if not result.has_key?(value)
    result[value] += 1
    return result
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
    limit = Math.sqrt(self).floor
    return false if limit**2 == self
    5.step(limit,2).each { |n| return false if self % n == 0 }
    true
  end
end


