import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/dart/async_task/stream/test_stream.dart';
import 'package:test_flutter/screens/stream/second_stream_page.dart';

class FirstStreamPage extends StatefulWidget {
  static const id = 'FirstStreamPage';
  const FirstStreamPage({Key? key}) : super(key: key);

  @override
  _FirstStreamPageState createState() => _FirstStreamPageState();
}

class _FirstStreamPageState extends State<FirstStreamPage> {
  var text = 'Hello';
  var myStream = MyStreamTest();
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();

    subscription = myStream.stream.listen((event) {
      print('From second page ----- $event');
      setState(() {
        text = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstStreamPage'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(text),
            btn(context, 'Go to Second stream page', SecondStreamPage.id)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    subscription?.cancel();

    super.dispose();
  }
}
