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
    double c_width = MediaQuery.of(context).size.width*0.8;
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

          MaterialButton(
              child: Text("show dialog"),
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              onPressed: () {
                _showLogoutDialog(c_width);
              }),
        ]));
  }

  void _showLogoutDialog(double width) {
    // if(event != null){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.download, size: 50,),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Attention!',
                              ),
                              Text(
                                'Hello hello Hello hello Hello hello Hello hello Hello hello Hello hello Hello hello ',
                              ),
                            ],
                          ),
                        ),





                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),

                ],
              ),
            ),

          ],
        ));
    // }
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
