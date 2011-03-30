class Problem018

  TRIANGLE = [
                                           [ 75 ],
                                         [ 95, 64 ],
                                       [ 17, 47, 82 ],
                                     [ 18, 35, 87, 10 ],
                                   [ 20,  4, 82, 47, 65 ],
                                 [ 19,  1, 23, 75,  3, 34 ],
                               [ 88,  2, 77, 73,  7, 63, 67 ],
                             [ 99, 65,  4, 28,  6, 16, 70, 92 ],
                           [ 41, 41, 26, 56, 83, 40, 80, 70, 33 ],
                         [ 41, 48, 72, 33, 47, 32, 37, 16, 94, 29 ],
                       [ 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14 ],
                     [ 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57 ],
                   [ 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48 ],
                 [ 63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31 ],
               [  4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 ]
             ]

  def initialize()
    @cache = {}
  end

  def add_triangle(triangle, row = 0, col = 0)
    raise "Invalid row or column" if col > row or col < 0
    return 0 if row >= triangle.length
    return triangle[row][col] if row == triangle.length - 1
    return @cache[row][col] if @cache.include? row and @cache[row].include? col

    left = add_triangle(triangle, row + 1, col)
    right = add_triangle(triangle, row + 1, col + 1)

    @cache[row] ||= {}
    @cache[row][col] ||= triangle[row][col] + (left > right ? left : right)
  end

  def run
    add_triangle TRIANGLE
  end
end

if $0 == __FILE__
  puts "Result: #{Problem018.new.run}"
end
