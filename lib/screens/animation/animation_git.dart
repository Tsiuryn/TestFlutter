import 'package:flutter/material.dart';
import 'package:test_flutter/app/routers/animation_routes.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';

/// https://github.com/asmodeoux/flutter_animations
class AnimationGit extends StatelessWidget {
  const AnimationGit({Key? key}) : super(key: key);
  static const id = 'AnimationGit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Samples'),
      ),
      body: MainListWidget(
        listWidget: [
          ...basicDemos.map((demo) => btn(context, demo.name, demo.route)),
          ...miscDemos.map((demo) => btn(context, demo.name, demo.route))
        ],
      ),

    );
  }
}
