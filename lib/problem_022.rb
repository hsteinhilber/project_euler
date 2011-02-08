class Problem022

  def score(name) 
    name.downcase.sum - ('a'.sum - 1) * name.length
  end

  def score_list(list)
    i = 0
    list.inject(0) { |sum,name| sum + score(name) * (i += 1) }
  end

  def load_file(file)
    file.read.scan(/\w+/).sort
  end

  def run
    File.open('data/names.txt') do |file|
      return score_list(load_file(file))
    end
  end
end

if $0 == __FILE__
  puts "Result: #{Problem022.new.run}"
end
