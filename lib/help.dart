import 'package:flutter_web/material.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          isThreeLine: true,
          title: Text('Commands'),
          subtitle: Text(
              'All commands follow the following format:\ncommand(alternatives) args'),
        ),
        ExpansionTile(
          title: Text('Drawing Commands'),
          children: <Widget>[
            ListTile(
              isThreeLine: false,
              title: Text('forward(fd) d'),
              subtitle: Text(
                  'Moves forward and draws a line to the point at d units away'),
            ),
            ListTile(
              title: Text('backward(bk) d'),
              subtitle: Text(
                  'Moves backward and draws a line to the point at d units away'),
            ),
            ListTile(
              title: Text('circle(c) r'),
              subtitle:
                  Text('Draws a circle with radius r from the current point'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('color c/r g b'),
              subtitle: Text(
                  'Sets the color of the lines to be drawn.\nSet the color with supported color name c or RGB values r g and b.'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Movement Commands'),
          children: <Widget>[
            ListTile(
              title: Text('right(r) d'),
              subtitle: Text('Turns the pointer d degrees to the right'),
            ),
            ListTile(
              title: Text('left(l) d'),
              subtitle: Text('Turns the pointer d degrees to the left'),
            ),
            ListTile(
              title: Text('rotate(rot) d'),
              subtitle: Text('Sets the pointers rotation to d degrees'),
            ),
            ListTile(
              title: Text('goto x y'),
              subtitle: Text('Moves the pointer to point (x, y)'),
            ),
            ListTile(
              title: Text('home(h)'),
              subtitle: Text(
                  'Moves the pointer to the center of the screen and resets the rotation'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Logic Commands'),
          children: <Widget>[
            ListTile(
              title: Text('for r'),
              subtitle: Text(
                  'Creates a for loop that repeats the following commands r times'),
            ),
            ListTile(
              title: Text('end(!)'),
              subtitle: Text('Signifies the end of a for loop'),
            ),
          ],
        ),
      ],
    );
  }
}
