import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'btn_style.dart';

class CalcBtn extends StatelessWidget {
  final String mainText;
  final String secondText;
  final Function onPress;
  final Function? onLongPress;
  final CalcBtnStyle btnStyle;
  final int flex;

  CalcBtn(this.mainText,
      {required Function onPress,
      String? secondText,
      Function? onLongPress,
      int? flex,
      CalcBtnStyle? btnStyle})
      : this.btnStyle = btnStyle ?? CalcBtnStyle(),
        this.secondText = secondText ?? '',
        this.onLongPress = onLongPress,
        this.flex = flex ?? 1,
        this.onPress = onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        color: btnStyle.backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: btnStyle.strokeColor, width: btnStyle.strokeWidth),
            borderRadius:
                BorderRadius.all(Radius.circular(btnStyle.cornerRadius))),
        child: InkWell(
          borderRadius:
              BorderRadius.all(Radius.circular(btnStyle.cornerRadius)),
          onTap: () {
            onPress(mainText);
          },
          splashColor: btnStyle.rippleColor,
          child: Center(
            child: FittedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (secondText.isNotEmpty)
                      Text(
                        secondText,
                        style: btnStyle.secondTextStyle,
                      ),
                    Text(
                      mainText,
                      style: btnStyle.mainTextStyle,
                    ),
                    if (secondText.isNotEmpty)
                      SizedBox(
                        height: 4.0,
                      )
                  ],
                ),
                fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
