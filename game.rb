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

while robot.coords != finish do
  render(maze.grid, robot)
  wait
  next_step(maze, robot)
end

render(maze.grid, robot)

print "\n\n"
puts "🎉  🎉  🎉  THE ROBOT DID IT!!!  🎉  🎉  🎉"
