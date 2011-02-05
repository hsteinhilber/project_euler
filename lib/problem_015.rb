class Problem015

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
  end

  def run
    40.comb(20)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem015.new.run}"
end
