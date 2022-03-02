import 'package:animator/animator.dart';
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
        child: ChangesIndicator(width: 50,),
      ),
    );
  }
}

class ChangesIndicator extends StatelessWidget {
  final double width;
  final Color color;

  const ChangesIndicator({
    Key? key,
    this.width = 15,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double begin = width;
    double end = width + (width * 0.5);
    return SizedBox(
      width: end,
      child: Animator<double>(
        duration: const Duration(milliseconds: 700),
        cycles: 0,
        curve: Curves.easeInCubic,
        tween: Tween<double>(begin: begin, end: end),
        builder: (context, animatorState, child) {
          return CustomPaint(
            foregroundPainter: UniCircle(
              indicatorColor: Colors.red,
              width: animatorState.value,
            ),
          );
        },
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
