import 'package:flutter/material.dart';
import 'package:test_flutter/constraint/constraint_page.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        ConstraintPage.id: (context) => ConstraintPage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = 'my_app_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
                child: Text("Constraint layout"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: (){
                  Navigator.pushNamed(context, ConstraintPage.id);
            }),
          )
        ],
      )
    );
  }
}
