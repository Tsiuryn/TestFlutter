import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lines extends StatefulWidget {
  static final String id = 'CustomPage_Lines';
  const Lines({Key? key}) : super(key: key);

  @override
  _LinesState createState() => _LinesState();
}

class _LinesState extends State<Lines> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinesShapePainter(),
      child: Container(),
    );
  }
}

class LinesShapePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);

    var path2 = Path();
    path2.moveTo(size.width / 2, 0);
    path2.lineTo(size.width / 2, size.height);
    canvas.drawPath(path2, paint);

    var path3 = Path();
    path3.moveTo(0, 0);
    path3.lineTo(size.width, size.height);
    canvas.drawPath(path3, paint);

    var path4 = Path();
    path4.moveTo(size.width, 0);
    path4.lineTo(0, size.height);
    canvas.drawPath(path4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
