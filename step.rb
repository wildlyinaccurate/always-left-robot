def next_step(maze, robot)
  next_coords = robot.foward_coords
  wall_ahead = maze.is_wall(next_coords)
  turns = robot.turns_since_last_move

  facing_backwards = turns == 2
  passage_on_left = !maze.is_wall(robot.left_coords)
  finish_on_right = maze.finish_coords == robot.right_coords

  if finish_on_right
    robot.turn_right
  elsif wall_ahead or facing_backwards or (turns == 0 and passage_on_left)
    robot.turn_left
  else
    robot.move_to(next_coords)
  end
end
