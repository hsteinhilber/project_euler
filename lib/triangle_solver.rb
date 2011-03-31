module TriangleSolver
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

end
