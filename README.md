# Always Left Robot

> This clever little robot will get itself out of any maze by always turning left.

## Usage

### Interactive mode

In interactive mode, the robot will wait for you to press the Enter key before making its next move.

```
ruby game.rb levels/1.txt
```

### Automatic mode

In automatic mode, the robot will wait a short amount of time (100ms) between each move, and will not require any input from you.

```
ruby game.rb levels/1.txt --auto
```

## Generating levels

Use the [Maze Generator](http://www.delorie.com/game-room/mazes/genmaze.cgi) with the width & height of each cell set to 2. Make sure you mark the start (`S`) and finish (`F`) points!

## Coding challenges

Are you learning how to code? Here are some challenges for you:

1. Modify the robot so that it only turns right.
2. !

## Tests

This code comes with some basic unit tests, which can be run with the following commands:

```
ruby tests/run_tests.rb
```

> Do you get a `Gem::LoadError` when running that, like "Could not find 'minitest'"? Try running `gem install minitest` first.

## Credit

[Patricia (@Miggles45)](https://github.com/Miggles45) came up with the idea for this, and helped with the initial coding.
