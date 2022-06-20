import 'package:flutter/material.dart';

class AnimatorPage extends StatefulWidget {
  static const String id = 'AnimatorPage';

  const AnimatorPage({Key? key}) : super(key: key);

  @override
  State<AnimatorPage> createState() => _AnimatorPageState();
}

class _AnimatorPageState extends State<AnimatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('AnimatorPage'), ChangesIndicator(width: 10)],
        ),
      ),
      body: Center(
        child: ChangesIndicator(
          width: 50,
        ),
      ),
    );
  }
}

class ChangesIndicator extends StatefulWidget {
  final double width;
  final Color color;

  const ChangesIndicator({
    Key? key,
    this.width = 15,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  State<ChangesIndicator> createState() => _ChangesIndicatorState();
}

class _ChangesIndicatorState extends State<ChangesIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  double animatedWidth = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800), lowerBound: 0.5)
          ..forward();

    // _animation =
    //     Tween<double>(begin: 0, end: 1.0).animate(_animationController);

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn, reverseCurve: Curves.bounceIn);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.addListener(() {
      setState(() {
        animatedWidth = _animationController.value * widget.width;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: UniCircle(
        indicatorColor: Colors.red,
        width: animatedWidth,
      ),
    );
  }
}

class UniCircle extends CustomPainter {
  final Color indicatorColor;
  final double width;

  UniCircle({
    required this.indicatorColor,
    this.width = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = indicatorColor
      ..style = PaintingStyle.fill;
    var activePath = Path();
    activePath.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: width / 2,
    ));

    canvas.drawPath(activePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
