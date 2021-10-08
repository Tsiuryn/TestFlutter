import 'package:flutter/material.dart';
import 'package:test_flutter/screens/custom/polygon.dart';
import 'package:test_flutter/screens/custom/visualize_polygon.dart';
import 'package:test_flutter/screens/custom/visualizer.dart';
import 'circle.dart';
import 'lines.dart';

class CustomPage extends StatefulWidget {
  static final String id = 'CustomPage';
  const CustomPage({Key key}) : super(key: key);

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

                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
