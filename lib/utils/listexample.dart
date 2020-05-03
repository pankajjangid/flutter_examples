import 'dart:convert';

import 'package:demo2020/constants.dart';
import 'package:demo2020/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomList extends StatefulWidget {
  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  String api = "https://jsonplaceholder.typicode.com/users";
  List data;
  String result = "";

  Future<String> getUsers() async {
    var response = await http.get(
        //encode the url if there is any sapce
        Uri.encodeFull(api),
        // only accept headers
        headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var convertToJson = jsonDecode(response.body);
      data = convertToJson;
      result = response.body;
    });

    return "SUCCESS";
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomWidget.getAppbarWithBack(
            context, Constants.TITLE_API_CALLING),
        body: Container(
          child: Center(
            child: result.isNotEmpty
                ? ListView.builder(
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Card(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(data[index]['name']),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
