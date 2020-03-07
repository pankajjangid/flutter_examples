
import 'package:demo2020/login.dart';
import 'package:demo2020/utils/utils.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'utils/config.dart';

class ExampleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> exampleList = Constants.exampleList;

    return MaterialApp(
      debugShowCheckedModeBanner: Config,
      title: "Flutter example",
      theme: CustomWidget.getTheme(),
      home: ExampleHome(
        exampleList: exampleList,
      ),
    );
  }
}

class ExampleHome extends StatelessWidget {
  ExampleHome({Key key, this.exampleList});
  final List<String> exampleList;
  

  void onListClick(String title,BuildContext context) {
    //  print(title);

    switch (title) {
      case Constants.TITLE_SPLASH:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        break;
        
      case Constants.TITLE_LOGIN:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomWidget.getAppbar(Constants.TITLE_HOME),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: Constants.exampleList.length,
              itemBuilder: (context, index) {
                String name = Constants.exampleList[index];

                return Card(
                    child: ListTile(
                  title: Text(name),
                  onTap: () => onListClick(name,context),
                ));
              })),
    );
  }
}
