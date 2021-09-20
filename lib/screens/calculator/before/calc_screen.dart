import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  static const String id = 'CalcScreen';

  const CalcScreen({Key key}) : super(key: key);

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 10,
                child: Container(
                  color: Colors.greenAccent,
                )),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                CalcBtn(
                '1',
                secondText: 'cos φ',
                onPress: (value) {
                  print(value);
                },
              ),
              CalcBtn(
                '1',
                secondText: 'cos φ',
                onPress: (value) {
                  print(value);
                },
              ),
              CalcBtn(
                '1',
                secondText: 'cos φ',
                onPress: (value) {
                  print(value);
                },
              ),
              CalcBtn(
                '1',
                secondText: 'cos φ',
                onPress: (value) {
                  print(value);
                },),

              CalcBtn(
                '1',
                secondText: 'cos φ',
                onPress: (value) {
                  print(value);
                },)


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalcBtn extends StatelessWidget {
  final String mainText;
  final String secondText;
  final Function onPress;
  final Function onLongPress;
  final CalcBtnStyle btnStyle;
  final int flex;

  CalcBtn(this.mainText, {Function onPress, String secondText, this.onLongPress, int flex, CalcBtnStyle btnStyle})
      : this.btnStyle = btnStyle ?? CalcBtnStyle(),
        this.secondText = secondText ?? '',
        this.flex = flex ?? 1,
        this.onPress = onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        color: btnStyle.backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: btnStyle.strokeColor, width: btnStyle.strokeWidth),
            borderRadius: BorderRadius.all(Radius.circular(btnStyle.cornerRadius))),
        child: InkWell(
          onTap: () {
            onPress(mainText);
          },
          splashColor: Colors.red,
          child: Center(
            child: FittedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (secondText.isNotEmpty)
                      Text(
                        secondText,
                        style: TextStyle(fontSize: 15),
                      ),
                    Text(
                      mainText,
                      style: btnStyle.mainTextStyle,
                    ),
                  ],
                ),
                fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}

class CalcBtnStyle {
  Color backgroundColor;
  Color strokeColor;
  Color rippleColor;
  double strokeWidth;
  double cornerRadius;
  TextStyle mainTextStyle;

  CalcBtnStyle({Color backgroundColor, Color strokeColor, double strokeWidth, double cornerRadius, TextStyle mainTextStyle, Color rippleColor})
      : this.backgroundColor = backgroundColor ?? Colors.grey,
        this.strokeColor = strokeColor ?? Colors.black,
        this.strokeWidth = strokeWidth ?? 1,
        this.rippleColor = rippleColor ?? Colors.blueGrey,
        this.mainTextStyle = mainTextStyle ?? myTextStyle,
        this.cornerRadius = cornerRadius ?? 4;
}

var myTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Amalia',
  fontWeight: FontWeight.bold,
  fontSize: 25,
);
