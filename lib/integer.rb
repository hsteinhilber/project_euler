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
end


