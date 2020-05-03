import 'package:flutter/material.dart';

class BottomNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Example"),
        ),
        body: Container(
          child: Center(
            child: Text("Bottom Navigation Example"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_vert), title: Text("More")),
        ]),
      ),
    );
  }
}
