require_relative '../robot'

class RobotTest < Minitest::Test
  def test_forward_coords
    robot = Robot.new([0, 0], Robot::RIGHT)
    assert_equal [1, 0], robot.foward_coords

    robot = Robot.new([2, 1], Robot::UP)
    assert_equal [2, 0], robot.foward_coords
  end

  def test_left_coords
    robot = Robot.new([0, 0], Robot::DOWN)
    assert_equal [1, 0], robot.left_coords
  end

  def test_turn_left
    robot = Robot.new([1, 1], Robot::RIGHT)

    robot.turn_left
    assert_equal [1, 0], robot.foward_coords

    robot.turn_left
    assert_equal [0, 1], robot.foward_coords
  end

  def test_render
    robot = Robot.new([0, 0], Robot::UP)

    assert_equal '^', robot.render

    robot.turn_left
    assert_equal '<', robot.render

    robot.turn_left
    assert_equal 'v', robot.render

    robot.turn_left
    assert_equal '>', robot.render
  end
end
