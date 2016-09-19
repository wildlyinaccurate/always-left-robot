# This is where we write our logic and tell the robot what it should do.
def next_step(maze, robot)
  # First, we take stock of what is around the robot.
  next_coords = robot.foward_coords
  wall_ahead = maze.is_wall(next_coords)
  passage_on_left = !maze.is_wall(robot.left_coords)

  # If the robot has turned around twice since it last moved, then it is facing
  # backwards. This is important, because we don't want the robot to just move
  # forwards and the backwards again!
  turns = robot.turns_since_last_move
  facing_backwards = turns == 2

  # Now for the logic: if the robot is facing a wall, or it's facing backwards,
  # or there's an open passage to its left, then we'll get it to turn left.
  if wall_ahead or facing_backwards or (turns == 0 and passage_on_left)
    robot.turn_left

  # Otherwise, it can just move forward!
  else
    robot.move_to(next_coords)
  end
end
