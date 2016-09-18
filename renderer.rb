def render(maze, robot)
  clear_screen(maze)

  maze.each_index do |y|
    maze[y].each_index do |x|
      print maze[y][x] unless robot.coords == [x, y]
      print robot.render if robot.coords == [x, y]
    end

    print "\n"
  end

  print "Robot co-ordinates: [#{robot.coords.join(', ')}] | turns: #{robot.turns_since_last_move}"
end

def clear_screen(maze)
  print "\r" + ("\e[A" * (maze.length + 1)) + "\e[J"
end
