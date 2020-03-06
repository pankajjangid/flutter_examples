import 'package:flutter/material.dart';
import 'dart:math';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DemoPage(title: "Home"),
    );
  }
}

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _DemoPageState();
  }
}

class _DemoPageState extends State<DemoPage> {
  int counter = 0;
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.teal,
    Colors.purpleAccent
  ];

  int index = 0;
  Color currentColor;
  Color currentTextColor;

  void changeColor() {
    setState(() {
      index = Random().nextInt(colors.length);
      currentColor = colors[index];
      currentTextColor = colors[Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        color: currentColor,
        child:  Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              counter.toString(),
              
              style: TextStyle(fontSize: 25.0,color: currentTextColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: MaterialButton(
                onPressed: () {
                  changeColor();
                  setState(() {
                    counter = counter + 1;
                  });
                },
                color: Colors.red[400],
                child: Text("Click me"),
                textColor: Colors.white),
          )
        ],
      )),),
    );
  }
}
