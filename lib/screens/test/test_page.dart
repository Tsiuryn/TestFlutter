import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test_flutter/app_widgets/main_button.dart';

import 'widgets/my_widget_size.dart';

class TestPage extends StatefulWidget {
  static const id = 'TestPage';

  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var _time = 10;
  Timer? _timer;

  final btnKey = GlobalKey(debugLabel: 'BtnGlobalKey');
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;
    return Scaffold(
        appBar: AppBar(
          title: Text('Test page'),
        ),
        body: Center(
          child: Column(children: [
            Text('Seconds $_time'),
            MaterialButton(
                child: Text("Start timer"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  _startTimer(() {
                    setState(() {});
                  });
                }),
            MaterialButton(
                key: btnKey,
                child: Text("show dialog"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  _showLogoutDialog(c_width);
                }),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) => Container(
                      width: 60,
                      height: 60,
                      color: Colors.red,
                      child: Text('${constraints.minWidth}'),
                    )),

            btn(context, 'MyWidgetSize', MyWidgetSize.id),
          ]),
        ));
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
                                _dialogDescription(context),
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
  }

  String _dialogDescription(BuildContext context) {
    final btnWidget = btnKey.currentContext;
    Size zero = Size.zero;
    Offset pos = Offset.zero;
    if (btnWidget != null) {
      // widget is visible
      final box = btnWidget.findRenderObject() as RenderBox;
      pos = box.localToGlobal(Offset.zero);
      zero = box.size;
    }

    return '''
    ${zero}
    ${pos}
    ''';
  }

  void _startTimer(Function callback) {
    const sec = Duration(seconds: 1);
    _timer = Timer.periodic(sec, (Timer timer) {
      _time--;
      callback();
      if (_time < 1) _timer?.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}

