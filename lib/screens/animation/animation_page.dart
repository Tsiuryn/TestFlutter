import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/screens/animation/animation_git.dart';
import 'package:test_flutter/screens/animation/screen/anim_controller_page.dart';
import 'package:test_flutter/screens/animation/screen/anim_size_page.dart';
import 'package:test_flutter/screens/animation/screen/animate_by_stream_page.dart';
import 'package:test_flutter/screens/animation/screen/animated_container.dart';
import 'package:test_flutter/screens/animation/screen/animator_page.dart';
import 'package:test_flutter/screens/animation/screen/auth/auth_screen.dart';
import 'package:test_flutter/screens/animation/screen/my_slide_transition.dart';
import 'package:test_flutter/screens/animation/screen/rotate_widget_page.dart';
import 'package:test_flutter/screens/animation/screen/size_transition_page.dart';
import 'package:test_flutter/screens/animation/screen/tesla/screens/tesla_home_screen.dart';

import 'screen/my_positioned_transition.dart';

class AnimationPage extends StatefulWidget {
  static final id = 'Animation';

  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  List<Widget> _buildList(BuildContext context) => [
        btn(
          context,
          'Animated container page',
          AnimatedContainerApp.id,
        ),
        btn(
          context,
          'Animated controller page',
          AnimControllerPage.id,
        ),
        btn(
          context,
          'Animator package',
          AnimatorPage.id,
        ),
        btn(
          context,
          'Animate by stream',
          AnimateByStreamPage.id,
        ),
        btn(
          context,
          'Rotate Widget Page',
          RotateWidgetPage.id,
        ),
        btn(
          context,
          'My Positioned Transition',
          MyPositionedTransition.id,
        ),
        btn(
          context,
          'My Slide Transition',
          MySlideTransition.id,
        ),
        btn(
          context,
          'Size transition page',
          SizeTransitionPage.id,
        ),
        btn(
          context,
          'Animated size page',
          AnimSizePage.id,
        ),
        btn(
          context,
          'AnimationGit',
          AnimationGit.id,
        ),
        btn(
          context,
          'TeslaHomeScreen',
          TeslaHomeScreen.id,
        ),
        btn(
          context,
          'AuthScreenAnimation',
          AuthScreenAnimation.id,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: MainListWidget(
          listWidget: _buildList(context),
        ));
  }
}
