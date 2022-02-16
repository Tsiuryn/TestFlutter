import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomPage.id),
      ),
      body: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  MaterialButton(
                      child: Text('Lines'),
                      onPressed: () => Navigator.pushNamed(context, Lines.id)),
                  MaterialButton(
                      child: Text('Polygon'),
                      onPressed: () => Navigator.pushNamed(context, Polygon.id)),
                  MaterialButton(
                      child: Text('Visualize Polygon'),
                      onPressed: () => Navigator.pushNamed(context, VisualizePolygon.id)),
                  MaterialButton(
                      child: Text('Widget with indicator'),
                      onPressed: () => Navigator.pushNamed(context, MyIndicatorPage.id)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  MaterialButton(
                      child: Text('Circle'),
                      onPressed: () => Navigator.pushNamed(context, Circle.id)),
                  MaterialButton(
                      child: Text('Visualizer'),
                      onPressed: () => Navigator.pushNamed(context, Visualizer.id)),
                  MaterialButton(
                      child: Text('Overlay widget'),
                      onPressed: () => Navigator.pushNamed(context, MyOverlayWidget.id)),

                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
