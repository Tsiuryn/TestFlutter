
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}

class RotateWidgetPage extends StatefulWidget {
  static const id = 'RotateWidgetPage';
  const RotateWidgetPage({Key? key}) : super(key: key);

  @override
  State<RotateWidgetPage> createState() => _RotateWidgetPageState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _RotateWidgetPageState extends State<RotateWidgetPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 4000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SpinningContainer(controller: _controller)));
  }
}
