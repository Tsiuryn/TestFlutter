import 'dart:convert';

import 'package:flutter/material.dart';

class AnimSizePage extends StatefulWidget {
  static const String id = 'AnimSizePage';

  const AnimSizePage({Key? key}) : super(key: key);

  @override
  State<AnimSizePage> createState() => _AnimSizePageState();
}

class _AnimSizePageState extends State<AnimSizePage> {
  bool showMenu = false;

  void _updateMenu() {
    setState(() {
      showMenu = !showMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimSizePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            shape: Border.all(
              color: Colors.black,
              width: 1,
            ),
            elevation: 4,
            child: AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text('Title 1'),
                  Text('Title 2'),
                  Text('Title 3'),
                  Visibility(
                    visible: showMenu,
                    child: Column(
                      children: [
                        Text('Title 4'),
                        Text('Title 5'),
                        Text('Title 6'),
                        Text('Title 6'),
                        Text('Title 6'),
                        Text('Title 6'),
                        Text('Title 6'),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _updateMenu,
                  child: Text('Show menu'),
                ),
              ),
              Switch(
                  value: showMenu,
                  onChanged: (value) {
                    _updateMenu();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
