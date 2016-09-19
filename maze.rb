class Maze
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  # Build an array of maze rows, each containing an array of columns
  def self.parse(maze_str)
    Maze.new(maze_str.split("\n").map { |row| row.chars })
  end

  # Find any marker in the maze
  def marker_coords(marker)
    row = @grid.find_index { |x| x.include?(marker) }
    col = @grid[row].index(marker)

    [col, row]
  end

  # An "S" marks the start of the maze
  def start_coords
    marker_coords('S')
  end

  # An "F" marks the finish of the maze
  def finish_coords
    marker_coords('F')
  end

  def is_space(coords)
    x = coords[0]
    y = coords[1]
    marker = @grid[y][x]

    [' ', 'S', 'F'].include?(marker)
  end

  # A wall is any marker that is not a space
  def is_wall(coords)
    !is_space(coords)
  end
end
