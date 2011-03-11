class Problem014

  def initialize
    @known_lengths = { 1 => 1 }
  end

  def sequence(n)
    return nil if n <= 1
    n.even? ? n / 2 : 3*n + 1
  end

  def chain_length(start)
    return @known_lengths[start] if @known_lengths.include? start
    @known_lengths[start] = chain_length(sequence(start)) + 1
  end

  def chain_lengths
    Enumerator.new do |yielder|
      start = 2
      yielder << [start, chain_length(start)] && start += 1 while start < 1_000_000
    end
  end

  def run
    chain_lengths.max_by { |start,length| length }[0]
  end
end

if $0 == __FILE__
  puts "Result: #{Problem014.new.run}"
end
