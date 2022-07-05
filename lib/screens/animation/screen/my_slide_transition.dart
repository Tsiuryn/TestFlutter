import 'package:flutter/material.dart';

class MySlideTransition extends StatefulWidget {
  static const id = 'MySlideTransition';
  const MySlideTransition({Key? key}) : super(key: key);

  @override
  State<MySlideTransition> createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutCubic,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isStarted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySlideTransition'),
      ),
      body: Column(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(size: 150.0),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          OutlinedButton(
              onPressed: () {
                // setState(() {
                startAnimated();
                // });
              },
              child: Text('Start Animation'))
        ],
      ),
    );
  }

  void startAnimated() {
    if (isStarted) {
      _controller.animateTo(1);
    } else {
      _controller.animateBack(0);
    }
    isStarted = !isStarted;
  }
}
