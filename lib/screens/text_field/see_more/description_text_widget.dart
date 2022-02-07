import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/see_more/widget_size.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {

  bool flag = true;
  double height = 100;
  int countLine = 2;
  late var textWidget;
  var globalKey = GlobalKey();

  @override
  void initState() {
    textWidget = Text(widget.text, overflow: TextOverflow.ellipsis, maxLines: countLine, key: globalKey,);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      // height: _getWidgetSize() != null ? _getWidgetSize()!.height + 8 : 50,
      child: Column(
        children: <Widget>[
          textWidget,
          SizedBox(height: 8,),
          InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
                setState(() {
                  if(flag){
                    countLine = 100;
                    height = _getWidgetSize()!.height;
                  }else{
                    countLine = 2;
                    height = _getWidgetSize()!.height;
                  }
                  flag = !flag;
                  height = height;

                });
            },
          ),
        ],
      ),
    );
  }

  Size? _getWidgetSize (){

    return globalKey.currentContext?.size;
  }
}