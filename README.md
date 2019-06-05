# turtle
A recreation of Python Turtle using Dart and Flutter for Web
[Try it here!](https://mantis54.github.io/turtle/)

## Commands
More commands will be added in the future with more options for control

### Drawing Commands
| Command | Alternative | Arguments | Description |
| ------- | ----------- | --------- | ----------- |
| forward | fd | distance | Moves forward and draws a line d units away |
| backward | bk | distance | Moves backward and draws a line d units away |
| right | r| degrees | Turns the pointer d degrees to the right |
| left | l | degrees | Turns the pointer l degrees to the left |
| circle | c | radius | Draws a circle of radius r tangent to the current location and rotation |
| color |  | name<br/>r g b | Sets the color of the line to be drawn. Can either be a color name or the RGB values for the desired colors. Currently only **red, blue, green, yellow, orange, and black** are supported. If a color not on this list is specified, the color will default to black.

### Movement Commands
| Command | Alternative | Arguments | Description |
| ------- | ----------- | --------- | ----------- |
| rotate | rot | d | Sets the pointer's rotation to d degrees |
| goto | | x y | Moves the pointer to point (x, y) |
| home | | | Returns the pointer to the center of the screen and resets its rotation |


### Logic Commands
| Command | Alternative | Arguments | Description |
| ------- | ----------- | --------- | ----------- |
| for | | r | Begins a for loop that repeats all following commands r number of times |
| end | ! | | Signifies the end of a for loop |
## Known Issues
- Text field retains old input after submitting command
  - Most likely an engine error
- Commands are not error checked
- Screen does not resize properly for mobile devices
