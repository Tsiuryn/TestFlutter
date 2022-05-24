import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _checkboxVal = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            onChanged: (bool? value) {
              setState(() {
                if (value != null) {
                  this._checkboxVal = value;
                }
              });
            },
            value: _checkboxVal,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _checkboxVal == true ? _checkboxVal = false : _checkboxVal = true;
                });
              },
              child: Padding(
                child: Text('Hello'),
                padding: EdgeInsets.all(8),
              )),
        ],
      ),
    );
  }
}
