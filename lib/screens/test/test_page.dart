import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  static const id = 'TestPage';

  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var _time = 10;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test page'),
        ),
        body: Column(children: [
          Text('Seconds $_time'),
          MaterialButton(
              child: Text("Start timer"),
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              onPressed: () {
                  // _startTimer((){
                  //   setState(() {
                  //
                  //   });
                  // });
              }),
        ]));
  }

  void _startTimer(Function callback){
    const sec = Duration(seconds: 1);
    _timer = Timer.periodic(sec, (Timer timer){
      _time --;
      callback();
      if(_time <= 1) _timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

}
