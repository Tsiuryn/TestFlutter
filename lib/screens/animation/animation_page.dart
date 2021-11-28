import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/animation/screen/animated_container.dart';

class AnimationPage extends StatelessWidget {
  static final id = 'Animation';

  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: (){
              Navigator.pushNamed(context, AnimatedContainerApp.id);
            },
            child: Text('Animated container'),
          )
        ],
      ),
    );
  }
}
