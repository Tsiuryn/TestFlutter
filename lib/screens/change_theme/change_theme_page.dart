import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/change_theme/themes.dart';

class ChangeThemePage extends StatefulWidget {
  static const id = 'ChangeThemePage';
  const ChangeThemePage({Key? key}) : super(key: key);

  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  var _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeThemePage'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 150, width: 150, color: ownTheme(context).errorShade),
          CupertinoSwitch(
              value: _checked,
              onChanged: (checked) {
                setState(() {
                  _checked = checked;
                });
              })
        ],
      ),
    );
  }
}
