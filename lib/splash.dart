import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startTime() async{
    var duration = Duration(seconds: 2);
     return Timer(duration, goToHome);
  }

  void goToHome(){

    Navigator.of(context).pop();
  }
  @override
  void initState() {
    
    super.initState();

    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Container(

        color: Colors.green,
        child: Center(
        child: Image.asset('images/flutterwithlogo.png'),
      ),
      ),
    );
  }
}