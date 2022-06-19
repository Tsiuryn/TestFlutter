import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/screens/custom/pages/indicator_widget.dart';
import 'package:test_flutter/screens/custom/pages/my_overlay_widget.dart';
import 'package:test_flutter/screens/custom/pages/polygon.dart';
import 'package:test_flutter/screens/custom/pages/visualize_polygon.dart';
import 'package:test_flutter/screens/custom/pages/visualizer.dart';
import 'pages/circle.dart';
import 'pages/lines.dart';

class CustomPage extends StatefulWidget {
  static final String id = 'CustomPage';
  const CustomPage({Key? key}) : super(key: key);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  List<Widget> _createListBtn(BuildContext context) {
    return <Widget>[
      btn(context, 'Lines', Lines.id),
      btn(context, 'Polygon', Polygon.id),
      btn(context, 'Visualize Polygon', VisualizePolygon.id),
      btn(context, 'Widget with indicator', MyIndicatorPage.id),
      btn(context, 'Circle', Circle.id),
      btn(context, 'Overlay widget', MyOverlayWidget.id),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CustomPage.id),
        ),
        body: MainListWidget(
          listWidget: _createListBtn(context),
        ));
  }
}
