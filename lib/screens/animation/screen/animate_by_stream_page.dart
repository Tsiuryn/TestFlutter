import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/dart/async_task/stream/animation_stream.dart';

class AnimateByStreamPage extends StatefulWidget {
  static const id = 'AnimateByStreamPage';

  const AnimateByStreamPage({Key? key}) : super(key: key);

  @override
  _AnimateByStreamPageState createState() => _AnimateByStreamPageState();
}

class _AnimateByStreamPageState extends State<AnimateByStreamPage> {
  late AnimationStream _animationStream;
  late StreamSubscription _streamSubscription;
  double width = 30;

  @override
  void initState() {
    _animationStream = AnimationStream<int>();

    _streamSubscription = _animationStream.stream.listen((event) {
      print(event);
      setState(() {
        width++;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimateByStreamPage'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                color: Colors.red,
                width: width,
                height: width,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              for (int i = 0; i < 100; i++) {
                _animationStream.sendData(i);
                await Future.delayed(const Duration(milliseconds: 100));
              }
            },
            child: Text('start animate'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationStream.cancel();
    _streamSubscription.cancel();
    super.dispose();
  }
}
