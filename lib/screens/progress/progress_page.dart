import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  static const String id = 'progress_page';

  const ProgressPage({Key? key}) : super(key: key);

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
                child: Text("Show/Hide percent indicator "),
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

      ],
    ));
  }
}
