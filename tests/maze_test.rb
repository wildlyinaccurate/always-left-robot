require_relative '../maze'

def test_maze
  Maze.parse <<eof
+-+-+-+
S |   |
+ + + +
| | | |
+ + + +
|   | F
+-+-+-+
eof
end

class MazeTest < Minitest::Test
  def test_start_coords
    assert_equal [0, 1], test_maze.start_coords
  end

  def test_finish_coords
    assert_equal [6, 5], test_maze.finish_coords
  end
end
