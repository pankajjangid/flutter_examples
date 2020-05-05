import 'package:demo2020/login.dart';
import 'package:demo2020/splash.dart';
import 'package:demo2020/text_file_io.dart';
import 'package:demo2020/utils/listexample.dart';
import 'package:demo2020/utils/utils.dart';
import 'package:flutter/material.dart';

import './bottom_navigation.dart';
import './radiobutton.dart';
import './utils/config.dart';
import 'constants.dart';

class ExampleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> exampleList = Constants.exampleList;

    return MaterialApp(
      debugShowCheckedModeBanner: Config.DEBUG_MODE,
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

  void onListClick(String title, BuildContext context) {
    //  print(title);

    switch (title) {
      case Constants.TITLE_SPLASH:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Splash()));

        break;

      case Constants.TITLE_LOGIN:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));

        break;

      case Constants.TITLE_API_CALLING:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CustomList()));

        break;

      case Constants.TITLE_BOTTOM_NAVIGATION:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigationExample()));
        break;

      case Constants.TITLE_RADIO_BUTTON:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RadioButtonEx()));
        break;
      case Constants.TITLE_READ_WRITE_TEXT_FILE:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TextIO()));
        break;
      case Constants.TITLE_ALERT_DIALOG:
        showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return AlertDialog(
                title: (Text("Title")),
                content: Text("This is the demo content"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        CustomWidget.showToast("You click on yes");
                      },
                      child: Text("Yes")),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        CustomWidget.showToast("You click on No");
                      },
                      child: Text("No"))
                ],
              );
            });

        break;

      case Constants.TITLE_CUSTOM_DIALOG:
        showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Demo Title",
                        textScaleFactor: 1.3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "You can put your content over here",
                          textScaleFactor: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes"),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("No"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
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
                  onTap: () => onListClick(name, context),
                ));
              })),
    );
  }
}
