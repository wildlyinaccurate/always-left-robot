require_relative '../maze'
require_relative '../robot'
require_relative '../step'

def simple_maze
  <<eof
+-+-+
S   |
+-+-|
eof
end

class StepTest < Minitest::Test
  def test_robot_moves_forward
    maze = Maze.parse(simple_maze)
    robot = Robot.new([0, 1], Robot::RIGHT)

    next_step(maze, robot)
    assert_equal [1, 1], robot.coords
  end

  def test_robot_gets_out_of_corner
    maze = Maze.parse(simple_maze)
    robot = Robot.new([3, 1], Robot::UP)

    # It should rotate first
    next_step(maze, robot)
    next_step(maze, robot)
    assert_equal [2, 1], robot.coords
  end
end
