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
      body: Center(
        child: _MyColumnWithObjects()
      ),
    );
  }
}

class _MyColumnWithObjects extends StatelessWidget {
  const _MyColumnWithObjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.green,
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hello world Hello world Hello world'),
                  Text('Hello world'),
                  Text('Hello world'),
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(height: constraints.minHeight,color: Colors.red,);
                  }),

                ],
              ),
              Container(height: constraints.minHeight, child: VerticalDivider(thickness: 3, color: Colors.black,),)
            ],
          ),
        );
      }
    );
  }
}

