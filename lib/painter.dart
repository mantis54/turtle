import 'dart:math';

import 'package:flutter_web/material.dart';

class TurtlePainter extends CustomPainter {
  List<String> commands;

  TurtlePainter({this.commands});
  double x;
  double y;
  double originX;
  double originY;
  double rad;
  bool inLoop = false;
  int maxReps;
  List<List<String>> loopedCommands;

  @override
  void paint(Canvas canvas, Size size) {
    x = size.width / 2;
    y = size.height / 2;
    originX = x;
    originY = y;
    rad = 0;
    var split = parseCommands();

    for (var i = 0; i < split.length; i++) {
      var command = split[i];
      executeCommand(command, canvas);
    }
    drawTurtle(canvas);
  }

  void executeCommand(List<String> command, Canvas canvas) {
    if (inLoop && (command[0] != '!' && command[0] != 'end')) {
      loopedCommands.add(command);
    } else {
      switch (command[0]) {
        case 'forward':
        case 'fd':
          draw(double.parse(command[1]), canvas);
          break;
        case 'backward':
        case 'bk':
          draw(double.parse(command[1]) * -1, canvas);
          break;
        case 'rot':
        case 'rotate':
          var rota = double.parse(command[1]) * pi / 180;
          rad = rota;
          break;
        case 'right':
        case 'r':
          var rota = double.parse(command[1]) * pi / 180;
          rad += rota;
          break;
        case 'left':
        case 'l':
          var rota = double.parse(command[1]) * pi / 180;
          rad -= rota;
          break;
        case 'goto':
          move(double.parse(command[1]), double.parse(command[2]));
          break;
        case 'for':
          maxReps = int.parse(command[1]);
          loopedCommands = [];
          inLoop = true;
          break;
        case 'end':
        case '!':
          inLoop = false;
          for (int i = 0; i < maxReps; i++) {
            for (var c in loopedCommands) {
              executeCommand(c, canvas);
            }
          }
          break;
        case 'home':
        case 'h':
          canvas.drawLine(Offset(x, y), Offset(originX, originY), Paint());
          x = originX;
          y = originY;
          rad = 0;
          break;
        case 'c':
        case 'circle':
          var r = double.parse(command[1]);
          var newX = x + r * cos(rad + 1.5708);
          var newY = y + r * sin(rad + 1.5708);
          canvas.drawCircle(
              Offset(newX, newY), r, Paint()..style = PaintingStyle.stroke);
          break;
        default:
      }
    }
  }

  void drawTurtle(Canvas canvas) {
    Path path = Path();
    double leftRads = (30 * pi / 180) + rad;
    double rightRads = -(30 * pi / 180) + rad;
    var p1 = Offset(-10 * cos(leftRads) + x, -10 * sin(leftRads) + y);
    var p2 = Offset(-10 * cos(rightRads) + x, -10 * sin(rightRads) + y);
    var p3 = Offset(-5 * cos(rad) + x, -5 * sin(rad) + y);
    path.moveTo(x, y);
    path.addPolygon([Offset(x, y), p1, p3, p2], true);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    canvas.drawPath(path, Paint()..color = Colors.white);

    // canvas.drawLine(Offset(x, y), p1, Paint());
    // canvas.drawLine(Offset(x, y), p2, Paint());
    // canvas.drawLine(p1, p3, Paint());
    // canvas.drawLine(p2, p3, Paint());
  }

  void draw(double dist, Canvas canvas) {
    var newX = dist * cos(rad) + x;
    var newY = dist * sin(rad) + y;
    canvas.drawLine(Offset(x, y), Offset(newX, newY), Paint());
    x = newX;
    y = newY;
  }

  void move(double xi, double yj) {
    if (xi != null && yj != null) {
      x = xi;
      y = yj;
    }
  }

  List<List<String>> parseCommands() {
    var result = <List<String>>[];
    for (var c in commands) {
      var split = c.split(' ');
      result.add(split);
    }
    return result;
  }

  @override
  bool shouldRepaint(TurtlePainter oldDelegate) {
    return oldDelegate.commands != commands;
  }

  @override
  bool shouldRebuildSemantics(TurtlePainter oldDelegate) {
    return oldDelegate.commands != commands;
  }
}
