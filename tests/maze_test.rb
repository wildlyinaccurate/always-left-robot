#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../maze'

def test_maze
  <<eof
+--+--+
      |
+--+  +
|  |  |
+  +  +
|
+--+--+
eof
end

class MazeTest < Minitest::Test
  def test_parse_creates_a_maze
    assert_instance_of Maze, Maze.parse(test_maze)
  end

  def test_parse_creates_grid
    maze = Maze.parse(test_maze)

    assert_equal 5, maze.cols
    assert_equal 7, maze.rows
  end
end
