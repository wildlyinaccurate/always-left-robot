require_relative 'maze'
require_relative 'robot'
require_relative 'renderer'
require_relative 'step'

if ARGV.length == 0
  puts "You need to provide a level file, e.g. ruby game.rb levels/1.txt"
  exit
end

level = File.read(ARGV[0])
maze = Maze.parse(level)
robot = Robot.new(maze.start_coords, Robot::RIGHT)
finish = maze.finish_coords

def wait
  if ARGV[1] == '--auto'
    sleep 0.1
  else
    $stdin.gets
  end
end

# This is the main game loop. You will find a loop similar to this in almost
# every game. All it does is render the current state of the game, and then run
# the next_step method which progresses the game's state one "step". It also
# uses the wait method above to control the speed of the game.
while robot.coords != finish do
  render(maze.grid, robot)
  wait
  next_step(maze, robot)
end

render(maze.grid, robot)

print "\n\n"
puts "🎉  🎉  🎉  THE ROBOT DID IT!!!  🎉  🎉  🎉"
