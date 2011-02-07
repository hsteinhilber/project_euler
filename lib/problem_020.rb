require 'integer'

class Problem020

  def run
    100.fact.digits.inject(0) { |sum,n| sum + n }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem020.new.run}"
end
