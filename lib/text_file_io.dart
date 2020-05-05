import 'dart:io';

import 'package:demo2020/constants.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TextIO extends StatefulWidget {
  @override
  _TextIOState createState() => _TextIOState();
}

/*
  Please add the library from here

  https://pub.dev/packages/path_provider

  after that import the statement

  import 'package:path_provider/path_provider.dart';

 */
class _TextIOState extends State<TextIO> {
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.TITLE_READ_WRITE_TEXT_FILE,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Constants.TITLE_READ_WRITE_TEXT_FILE),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: contentController,
                decoration: InputDecoration(hintText: "Enter content"),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        writeFile(contentController.text);
                      },
                    ),
                    FutureBuilder(
                      future: readFile(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData != null) {
                          return Text(snapshot.data);
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/data.txt');
  }

  Future<File> writeFile(String content) async {
    final file = await _localFile;

    return file.writeAsString('$content');
  }

  Future<String> readFile() async {
    final file = await _localFile;

    try {
      String data = await file.readAsString();

      return data;
    } catch (e) {
      return "Nothing saved yet!";
    }
  }
}
