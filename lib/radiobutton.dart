import 'package:flutter/material.dart';

class RadioButtonEx extends StatefulWidget {
  @override
  _RadioButtonExState createState() => _RadioButtonExState();
}

class _RadioButtonExState extends State<RadioButtonEx> {
  int selectedRadioButton = 0;

  void handleRadioButton(int value) {
    setState(() {
      selectedRadioButton = value;
      print(selectedRadioButton);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radio Button example",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Radio Button Example"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                child:
                    Text("You have selected $selectedRadioButton radio button"),
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                children: <Widget>[
                  Radio(
                      activeColor: Colors.green,
                      value: 0,
                      groupValue: selectedRadioButton,
                      onChanged: handleRadioButton),
                  Text("Button 1"),
                  Radio(
                      activeColor: Colors.red,
                      value: 1,
                      groupValue: selectedRadioButton,
                      onChanged: handleRadioButton),
                  Text("Button 2"),
                  Radio(
                      activeColor: Colors.deepPurple,
                      value: 2,
                      groupValue: selectedRadioButton,
                      onChanged: handleRadioButton),
                  Text("Button 3"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
