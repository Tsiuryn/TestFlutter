import 'package:flutter/material.dart';
import 'package:test_flutter/screens/animation/basics/01_animated_container.dart';
import 'package:test_flutter/screens/animation/basics/02_page_route_builder.dart';
import 'package:test_flutter/screens/animation/basics/03_animation_controller.dart';
import 'package:test_flutter/screens/animation/basics/04_tweens.dart';
import 'package:test_flutter/screens/animation/basics/05_animated_builder.dart';
import 'package:test_flutter/screens/animation/basics/06_custom_tween.dart';
import 'package:test_flutter/screens/animation/basics/07_tween_sequence.dart';
import 'package:test_flutter/screens/animation/basics/08_fade_transition.dart';
import 'package:test_flutter/screens/animation/misc/animated_list.dart';
import 'package:test_flutter/screens/animation/misc/animated_positioned.dart';
import 'package:test_flutter/screens/animation/misc/animated_switcher.dart';
import 'package:test_flutter/screens/animation/misc/card_swipe.dart';
import 'package:test_flutter/screens/animation/misc/carousel.dart';
import 'package:test_flutter/screens/animation/misc/curved_animation.dart';
import 'package:test_flutter/screens/animation/misc/expand_card.dart';
import 'package:test_flutter/screens/animation/misc/focus_image.dart';
import 'package:test_flutter/screens/animation/misc/hero_animation.dart';
import 'package:test_flutter/screens/animation/misc/physics_card_drag.dart';
import 'package:test_flutter/screens/animation/misc/repeating_animation.dart';

class AnimationGit extends StatelessWidget {
  const AnimationGit({Key? key}) : super(key: key);
  static const id = 'AnimationGit';

  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(fontSize: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}


class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({required this.name, required  this.route, required  this.builder});
}

final basicDemos = [
  Demo(
      name: 'AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => AnimatedContainerDemo()),
  Demo(
      name: 'PageRouteBuilder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),
  Demo(
      name: 'Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => AnimationControllerDemo()),
  Demo(
      name: 'Tweens',
      route: TweenDemo.routeName,
      builder: (context) => TweenDemo()),
  Demo(
      name: 'AnimatedBuilder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => AnimatedBuilderDemo()),
  Demo(
      name: 'Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => CustomTweenDemo()),
  Demo(
      name: 'Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo()),
  Demo(
      name: 'Fade Transition',
      route: FadeTransitionDemo.routeName,
      builder: (context) => FadeTransitionDemo()),
];

final miscDemos = [
  Demo(
      name: 'Expandable Card',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Card Swipe',
      route: CardSwipeDemo.routeName,
      builder: (context) => CardSwipeDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationDemo()),
  Demo(
      name: 'Spring Physics',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()),
  Demo(
      name: 'AnimatedList',
      route: AnimatedListDemo.routeName,
      builder: (context) => AnimatedListDemo()),
  Demo(
      name: 'AnimatedPositioned',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => AnimatedPositionedDemo()),
  Demo(
      name: 'AnimatedSwitcher',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => AnimatedSwitcherDemo()),
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => HeroAnimationDemo()),
  Demo(
      name: 'Curved Animation',
      route: CurvedAnimationDemo.routeName,
      builder: (context) => CurvedAnimationDemo()),
];

final basicDemoRoutes =
Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

