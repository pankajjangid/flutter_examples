import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Login"),
          ),
          body: Home()),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentText = "Hello";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSubmitClick() {}
  @override
  void initState() {
    //email_controller.addListener(printValue);
    // password_controller.addListener(printValue);

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)
            ,child: Container(
              height: 100.0,
              width: 100.0,
              child: Image.network("https://png.pngtree.com/png-clipart/20190515/original/pngtree-instagram-icon-logo-png-image_3560507.jpg"),
            )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      hintText: "Email"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      hintText: "Password"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                child: Text("Forgot password"),)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: MaterialButton(
                    onPressed: onSubmitClick, child: Text("Submit"),
                    textColor: Colors.white,
                    color: Colors.red,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
