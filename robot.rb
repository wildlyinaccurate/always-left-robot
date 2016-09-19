class Robot
  # We can keep track of where the robot is within the maze by storing its
  # co-ordinates. We'll use a simple [x, y] (or [column, row]) format.
  # Computers like to start counting at 0, so the co-ordinates [0, 2] mean that
  # the robot is in the first column and the third row of the maze.
  attr_accessor :coords

  # Keeping track of how many times the robot has turned since it last moved
  # forward will help us make sure it doesn't get stuck in one place!
  attr_accessor :turns_since_last_move

  # Our robot will need to know how to turn! These represent the direction the
  # robot is facing.
  UP = '^'
  DOWN = 'v'
  LEFT = '<'
  RIGHT = '>'

  # Whenever a new robot is created, it needs some initial co-ordinates and a
  # direction.
  def initialize(coords, direction)
    @coords = coords
    @direction = direction
    @turns_since_last_move = 0
  end

  # Moving is pretty simple. We can just update the robot's co-ordinates to the
  # new ones. We also reset the number of turns the robot has made since it
  # last moved.
  def move_to(coords)
    @coords = coords
    @turns_since_last_move = 0
  end

  # Before we decide whether the robot should move forward, we need to know
  # what's in front of it! We can calculate the co-ordinates of the square in
  # front of the robot based on the direction it is facing.
  def foward_coords
    case @direction
    when UP
      [x, y - 1]
    when RIGHT
      [x + 1, y]
    when DOWN
      [x, y + 1]
    when LEFT
      [x - 1, y]
    end
  end

  # Similar to forward_coords, knowing what is to the robot's left can be useful
  # when making decisions about what to do.
  def left_coords
    case @direction
    when UP
      [x - 1, y]
    when RIGHT
      [x, y - 1]
    when DOWN
      [x + 1, y]
    when LEFT
      [x, y + 1]
    end
  end

  # Whenever the robot turns left, all we need to do is set its new direction.
  # We also keep track of the number of turns it has made.
  def turn_left
    @turns_since_last_move = @turns_since_last_move + 1
    @direction = case @direction
    when UP
      LEFT
    when RIGHT
      UP
    when DOWN
      RIGHT
    when LEFT
      DOWN
    end
  end

  # We need a way to render our robot to the screen. Helpfully, the direction
  # value is already something like ">" for right or "^" for up, so we can just
  # use that!
  def render
    @direction
  end

private
  # These are little helper methods that make parts of our code easier to read.
  def x
    @coords[0]
  end

  def y
    @coords[1]
  end
end
