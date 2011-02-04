class Problem014
  @@known_lengths = {}

  def sequence(start)
    Enumerator.new do |yielder|
      n = start
      while n > 1
        yielder << n
        if n.even?
          n /= 2
        else
          n = (3 * n + 1)
        end
      end
      yielder << 1
    end
  end

  def chain_length(start)
    return @@known_lengths[start] if @@known_lengths.include? start

    count = 0
    sequence(start).each do |term|
      return @@known_lengths[start] = count + 1 if term == 1
      return @@known_lengths[start] = @@known_lengths[term] + count if @@known_lengths.include? term
      count += 1
    end
  end

  def chain_lengths
    Enumerator.new do |yielder|
      start = 2
      yielder << [start, chain_length(start)] && start += 1 while true
    end
  end

  def run
    chain_lengths.take_while { |p| p[0] < 1_000_000 }.max_by { |p| p[1] }[0]
  end
end

if $0 == __FILE__
  puts "Result: #{Problem014.new.run}"
end
