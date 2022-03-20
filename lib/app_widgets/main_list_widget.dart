import 'package:flutter/material.dart';

class MainListWidget extends StatelessWidget {
  final List<Widget> listWidget;
  const MainListWidget({Key? key, required this.listWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        key: const Key('mainPageList'),
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: listWidget,
      ),
    );
  }
}
