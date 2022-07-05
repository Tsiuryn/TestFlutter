import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/dart/async_task/stream/test_stream.dart';

class SecondStreamPage extends StatefulWidget {
  static const id = 'SecondStreamPage';

  const SecondStreamPage({Key? key}) : super(key: key);

  @override
  _SecondStreamPageState createState() => _SecondStreamPageState();
}

class _SecondStreamPageState extends State<SecondStreamPage> {
  var text = '';
  var myStream = MyStreamTest();
  var controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      text = controller.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondStreamPage'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'InputText',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              OutlinedButton(
                  onPressed: () {
                    myStream.sendData(text);
                  },
                  child: Text('Send information to previous page')),
              SizedBox(
                height: 100,
              ),
              MyContainer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('dispose');
    subscription.cancel();

    super.dispose();
  }
}

class MyContainer extends StatefulWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  var _text = 'Hello';
  var myStream = MyStreamTest();
  StreamSubscription? subscription;

  @override
  void initState() {
    subscription = myStream.stream.listen((event) {
      setState(() {
        _text = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      color: Colors.grey,
      child: Center(child: Text(_text)),
    );
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
