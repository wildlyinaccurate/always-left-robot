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

# The render method prints multiple lines to the terminal, so we need a way to
# clear all of those lines before we print them again. Most terminal emulators
# support special ANSI escape codes, which help us clear the screen.
#
# \r   - move the cursor to the beginning of the line
# \e[A - move the cursor up one line
# \e[J - clear from the cursor to the bottom of the screen
#
# We move up "maze.length + 1" lines because we print one line for each row in
# the maze, and one extra line with some information.
def clear_screen(maze)
  print "\r" + ("\e[A" * (maze.length + 1)) + "\e[J"
end
