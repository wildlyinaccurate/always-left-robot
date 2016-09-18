class Robot
  UP = '^'
  DOWN = 'v'
  LEFT = '<'
  RIGHT = '>'

  # [x, y]
  attr_accessor :coords
  attr_accessor :turns_since_last_move

  def initialize(coords, direction)
    @coords = coords
    @direction = direction
    @turns_since_last_move = 0
  end

  def move_to(coords)
    @turns_since_last_move = 0
    @coords = coords
  end

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

  def right_coords
    case @direction
    when UP
      [x + 1, y]
    when RIGHT
      [x, y + 1]
    when DOWN
      [x - 1, y]
    when LEFT
      [x, y - 1]
    end
  end

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

  def turn_right
    @turns_since_last_move = @turns_since_last_move + 1

    @direction = case @direction
    when UP
      RIGHT
    when RIGHT
      DOWN
    when DOWN
      LEFT
    when LEFT
      UP
    end
  end

  def render
    @direction
  end

private
  def x
    @coords[0]
  end

  def y
    @coords[1]
  end
end
