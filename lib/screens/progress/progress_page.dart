import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  static const String id = 'progress_page';

  const ProgressPage({Key key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Column(
          children: [
            Image(
              image: AssetImage('assets/constraint/poster.jpeg'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                child: Text("Show/Hide progress bar "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  setState(() {
                    if(_visible){
                      _visible = false;
                    }else{
                      _visible = true;
                    }
                  });
                }),
          ],
        ),
        Center(
          child: _visible? CircularProgressIndicator(
            backgroundColor: Colors.amberAccent,
            strokeWidth: 2,
            semanticsLabel: 'Download',
          ): null ,
        )
      ],
    ));
  }
}
