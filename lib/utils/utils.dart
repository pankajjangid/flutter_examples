import 'dart:math' as Math;
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';


class StringUtil {
  static bool equalIgnoreCase(String s1, String s2) =>
      (s1?.toLowerCase() == s2?.toLowerCase());
  static bool isNullOrEmpty(String s) => s == null || s.isEmpty;
  static bool notNullOrEmpty(String s) => !isNullOrEmpty(s);
}

class Util {
// converter (to/from String)
  static String dateTimeToString(DateTime t) => t.toUtc().toIso8601String();
  static DateTime stringToDateTime(String s) => DateTime.parse(s).toUtc();

  static String durationToString(Duration d) => d?.inMicroseconds?.toString();
  static Duration stringToDuration(String s) =>
      Duration(microseconds: int.parse(s));

  /// generators
  final Math.Random _random = new Math.Random();
  Color generateRandomColor() =>
      Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
}

/// I actually use import 'package:logging/logging.dart';
class Log {
  static fine(String message) => print("fine: $message");
  static warning(String message) => print("warning: $message");
  static error(String message) => print("error: $message");
  static severe(String message) => print("severe: $message");
}

class CustomWidget {
  static getTheme() => ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      );

  static AppBar getAppbar( String title) => AppBar(
        title: Text(title),

      );

      
  static AppBar getAppbarWithBack( BuildContext context ,  title) => AppBar(
        title: Text(title),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:() =>Navigator.of(context).pop(),),

      );

  static showToast(String title){
    Fluttertoast.showToast(
                            msg: title,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
  }
}



