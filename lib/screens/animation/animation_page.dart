import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/screens/animation/screen/anim_controller_page.dart';
import 'package:test_flutter/screens/animation/screen/animated_container.dart';
import 'package:test_flutter/screens/animation/screen/animator_page.dart';

class AnimationPage extends StatefulWidget {
  static final id = 'Animation';

  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  List<Widget> _buildList(BuildContext context) =>[
    btn(context, 'Animated container page', AnimatedContainerApp.id),
    btn(context, 'Animated controller page', AnimControllerPage.id),
    btn(context, 'Animator package', AnimatorPage.id),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: MainListWidget(
        listWidget: _buildList(context),
      )
    );
  }
}
