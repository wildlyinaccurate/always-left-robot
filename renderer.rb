def render(maze, robot)
  clear_screen(maze)

  maze.each_index do |y|
    maze[y].each_index do |x|
      robot_is_here = robot.coords == [x, y]
      print robot_is_here ? robot.render : maze[y][x]
    end

    print "\n"
  end

  print "Robot co-ordinates: [#{robot.coords.join(', ')}] | turns since last move: #{robot.turns_since_last_move}"
end

def clear_screen(maze)
  print "\r" + ("\e[A" * (maze.length + 1)) + "\e[J"
end
