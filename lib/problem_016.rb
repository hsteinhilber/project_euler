class Problem016

  class ::Integer
    def digits
      self.to_s.split('').map { |s| s.to_i }
    end
  end

  def run
    (2**1000).digits.inject { |sum,v| sum + v }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem016.new.run}"
end
