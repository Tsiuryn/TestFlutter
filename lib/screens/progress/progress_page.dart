import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  static const String id = 'progress_page';

  const ProgressPage({Key key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _visibleProgress = false;
  bool _visiblePercent = false;

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
                    if (_visibleProgress) {
                      _visibleProgress = false;
                    } else {
                      _visibleProgress = true;
                    }
                  });
                }),
            MaterialButton(
                child: Text("Show/Hide persent indicator "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  setState(() {
                    if (_visiblePercent) {
                      _visiblePercent = false;
                    } else {
                      _visiblePercent = true;
                    }
                  });
                }),
          ],
        ),
        Center(
          child: _visibleProgress ? ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                    borderRadius: new BorderRadius.all(Radius.circular(8))
                ),
                child: Center(
                  child:CircularProgressIndicator(
                          backgroundColor: Colors.amberAccent,
                          strokeWidth: 5,
                          semanticsLabel: 'Download',
                        ),
                ),
              ),
            ),
          ) : null,
        ),
        Center(
          child: _visiblePercent
              ? CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 10.0,
                  percent: 1,
                  animation: true,
                  animationDuration: 5000,
                  header: new Text("Icon header"),
                  center: new Icon(
                    Icons.person_pin,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                )
              : null,
        )
      ],
    ));
  }
}
