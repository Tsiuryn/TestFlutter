import 'package:flutter/material.dart';

class DividerExamplePage extends StatefulWidget {
  static const id = 'DividerExamplePage';

  const DividerExamplePage({Key? key}) : super(key: key);

  @override
  State<DividerExamplePage> createState() => _DividerExamplePageState();
}

class _DividerExamplePageState extends State<DividerExamplePage> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DividerExamplePage'),
      ),
      body: Center(child: _MyColumnWithObjects()),
    );
  }
}

class _MyColumnWithObjects extends StatelessWidget {
  const _MyColumnWithObjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
          _MyWidgets(),
        ],
      ),
    );
  }
}

class _MyWidgets extends StatelessWidget {
  const _MyWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hello world Hello world Hello world'),
                  Text('Hello world'),
                  Text('Hello world'),
                ],
              ),
            ),
            Container(
              child: VerticalDivider(
                thickness: 3,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hello world Hello world Hello world'),
                  Text('Hello world'),
                  Text('Hello world'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
