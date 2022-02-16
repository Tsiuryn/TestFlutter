import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const defaultIconPath = 'assets/icons/ic_documents_tab.svg';

class MyIndicatorPage extends StatefulWidget {
  static const id = 'MyIndicatorPage';

  const MyIndicatorPage({Key? key}) : super(key: key);

  @override
  _MyIndicatorPageState createState() => _MyIndicatorPageState();
}

class _MyIndicatorPageState extends State<MyIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyIndicatorPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWithIndicator(
              iconPath: defaultIconPath,
              iconColor: Colors.black,
              indicatorColor: Colors.yellow,
              isActive: true,
              size: Size(24, 24),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithIndicator extends StatelessWidget {
  final String? iconPath;
  final Color iconColor;
  final Color indicatorColor;
  final bool isActive;
  final Size size;

  const IconWithIndicator({
    Key? key,
    this.iconPath,
    this.iconColor = Colors.black38,
    this.indicatorColor = Colors.red,
    this.isActive = true,
    Size? size,
  }) : this.size = size ?? const Size(50, 50),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          iconPath == null ? Icon(Icons.access_alarm_rounded, color: iconColor, size: size.width,) : SvgPicture.asset(
            iconPath!,
            width: size.width,
            color: iconColor,
          ),
          Visibility(
            visible: isActive,
            child: CustomPaint(
              size: Size(size.width/2, size.height/2),
              painter: CircleIndicator._(indicatorColor),
            ),
          )
        ],
      ),
    );
  }
}

class CircleIndicator extends CustomPainter{
  final Color indicatorColor;

  CircleIndicator._(this.indicatorColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var white_path = Path();
    white_path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: _getRadius(size),
    ));
    canvas.drawPath(white_path, paint);

    var red_path = Path();
    red_path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: _getRedCircleRadius(size),
    ));
    paint.color = indicatorColor;
    canvas.drawPath(red_path, paint);


  }

  double _getRadius(Size size){
    return size.width < size.height ? size.width / 2: size.height / 2;
  }

  double _getRedCircleRadius(Size size){
    double radius = _getRadius(size);
    double quarter = radius / 4;
    return radius - quarter;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
