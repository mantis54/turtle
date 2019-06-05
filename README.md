# turtle
A recreation of Python Turtle using Dart and Flutter for Web
[Try it here!](https://mantis54.github.io/turtle/)

## Commands
More commands will be added in the future with more options for control

| Command | Alternative | Arguments | Description |
| ------- | ----------- | --------- | ----------- |
| forward | fd | d | Moves forward and draws a line d units away |
| backward | bk | d | Moves backward and draws a line d units away |
| right | r| d | Turns the pointer d degrees to the right |
| left | l | d | Turns the pointer l degrees to the left |
| rotate | rot | d | Sets the pointer's rotation to d degrees |
| circle | c | r | Draws a circle of radius r tangent to the current location and rotation |
| goto | | x y | Moves the pointer to point (x, y) |
| for | | r | Begins a for loop that repeats all following commands r number of times |
| end | ! | | Signifies the end of a for loop |

## Known Issues
- Text field retains old input after submitting command
  - Most likely an engine error
- Commands are not error checked
- Screen does not resize properly for mobile devices
