def render(maze, robot)
  clear_screen(maze)

  maze.each_index do |y|
    maze[y].each_index do |x|
      if robot.coords == [x, y]
        print robot.render
      else
        print maze[y][x]
      end
    end

    print "\n"
  end

  puts "Robot co-ordinates: [#{robot.coords.join(', ')}] | turns since last move: #{robot.turns_since_last_move}"
end

def clear_screen(maze)
  print "\r" + ("\e[A" * (maze.length + 1)) + "\e[J"
end
