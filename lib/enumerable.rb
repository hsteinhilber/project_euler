module Enumerable

  def skip(n, &block)
    enum = Enumerator.new do |yielder|
      each_with_index do |value,index|
        next if index < n
        yielder << value
      end
    end
    enum.each &block if block_given?
    return enum
  end
end
