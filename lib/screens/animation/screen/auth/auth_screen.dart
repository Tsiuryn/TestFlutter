import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/screens/animation/screen/auth/constants.dart';
import 'package:test_flutter/screens/animation/screen/auth/widgets/login_form.dart';
import 'package:test_flutter/screens/animation/screen/auth/widgets/sign_up_form.dart';
import 'package:test_flutter/screens/animation/screen/auth/widgets/socal_buttons.dart';

class AuthScreenAnimation extends StatefulWidget {
  static const id = 'AuthScreenAnimation';

  const AuthScreenAnimation({Key? key}) : super(key: key);

  @override
  State<AuthScreenAnimation> createState() => _AuthScreenAnimationState();
}

class _AuthScreenAnimationState extends State<AuthScreenAnimation>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration, reverseDuration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _updateView(){
    setState((){
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _animationController.forward() : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: defaultDuration,
                width: size.width * 0.88,
                height: size.height,
                left: _isShowSignUp ? -size.width * 0.76 : 0,
                child: Container(
                  color: login_bg,
                  child: LoginForm(),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                height: size.height,
                width: size.width * 0.88,
                left: _isShowSignUp ? size.width * 0.12 : size.width * 0.88,
                child: Container(
                  color: signup_bg,
                  child: SignUpForm(),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                top: size.height * 0.1,
                // 10%
                left: 0,
                right: _isShowSignUp ? -size.width * 0.08 : size.width * 0.08,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white60,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: !_isShowSignUp ? SvgPicture.asset(
                      'assets/auth/animation_logo.svg',
                      color: login_bg ,
                    ) : SvgPicture.asset(
                      'assets/auth/animation_logo.svg',
                      color: signup_bg ,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                width: size.width,
                bottom: size.height * 0.01,
                right: _isShowSignUp ? -size.width * 0.08 : size.width * 0.08,
                child: SocalButtns(),
              ),
              AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _isShowSignUp ? size.height / 2 - 160 : size.height * 0.25,
                  left: _isShowSignUp ? 0 : size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    style: TextStyle(
                      fontSize: _isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                       onTap: _isShowSignUp ?_updateView : null ,
                        child: Container(
                          width: 160,
                          padding: EdgeInsets.symmetric(vertical: defpaultPadding * 0.75),
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: Text(
                            'Log In'.toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  )),
              AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isShowSignUp ? size.height / 2 - 160 : size.height * 0.3,
                  right: _isShowSignUp ?size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    style: TextStyle(
                      fontSize: !_isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    child: Transform.rotate(
                      angle: (90 -_animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: _isShowSignUp ? null :_updateView,
                        child: Container(
                          width: 160,
                          padding: EdgeInsets.symmetric(vertical: defpaultPadding * 0.75),
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: Text(
                            'Sign up'.toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          );
        }
      ),
    ));
  }
}
