import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/text_field_widget.dart';

class TextFieldPage extends StatefulWidget {
  static const id = 'TextFieldPage';
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFieldPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget('Summary'),
            SizedBox(height: 24,),
            TextFieldWidget('Add some text'),
          ],
        ),
      ),
    );
  }
}
