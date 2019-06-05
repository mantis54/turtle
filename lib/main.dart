import 'dart:math';
import 'package:flutter_web/material.dart';
import 'package:turtle/painter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Turtle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> commands;
  TextEditingController controller;
  String command;

  @override
  void initState() {
    super.initState();
    commands = [];
    command = '';
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Turtle'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: <Widget>[
                      ListTile(
                        isThreeLine: true,
                        title: Text('Commands'),
                        subtitle: Text(
                            'All commands follow the following format:\ncommand(alternatives) args'),
                      ),
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
                        title: Text('right(r) d'),
                        subtitle:
                            Text('Turns the pointer d degrees to the right'),
                      ),
                      ListTile(
                        title: Text('left(l) d'),
                        subtitle:
                            Text('Turns the pointer d degrees to the left'),
                      ),
                      ListTile(
                        title: Text('rotate(rot) d'),
                        subtitle:
                            Text('Sets the pointers rotation to d degrees'),
                      ),
                      ListTile(
                        title: Text('circle(c) r'),
                        subtitle: Text(
                            'Draws a circle with radius r from the current point'),
                      ),
                      ListTile(
                        title: Text('goto x y'),
                        subtitle: Text('Moves the pointer to point (x, y)'),
                      ),
                      ListTile(
                        title: Text('home(h)'),
                        subtitle: Text(
                            'Draws a line back to the center of the screen and resets the rotation'),
                      ),
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
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                commands = [];
                controller.clear();
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .65,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ClipRect(
                child: CustomPaint(
                  painter: TurtlePainter(commands: commands),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            // color: Colors.black12,
            width: MediaQuery.of(context).size.width * .95,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: commands.length,
                    itemBuilder: (context, index) {
                      return Text(commands[commands.length - index - 1]);
                    },
                  ),
                ),
                // Divider(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 2, 2),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            helperText:
                                'Don\'t forget to manually clear the TextField',
                          ),
                          controller: controller,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          commands.add(controller.text);
                          // controller = TextEditingController();
                          command = '';
                          // controller.clear();
                        });
                        print(controller.text);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
