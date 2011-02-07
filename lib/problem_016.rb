require 'integer'

class Problem016

 def run
    (2**1000).digits.inject { |sum,v| sum + v }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem016.new.run}"
end
