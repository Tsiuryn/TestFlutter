import 'package:flutter/material.dart';

class SizeTransitionPage extends StatefulWidget {
  static const id = 'SizeTransitionPage';

  SizeTransitionPage({Key? key}) : super(key: key);

  @override
  _SizeTransitionPageState createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizeTransitionPage'),
      ),
      body: _buildBody(),

    );
  }

  Widget _buildBody() {
    return Test1(AnimationDirection.fromDownToUp);
  }
}

enum AnimationDirection {
  fromUpToDown, fromDownToUp
}

class Test1 extends StatefulWidget {
  final AnimationDirection animationDirection;


  Test1(this.animationDirection);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    final tween = widget.animationDirection == AnimationDirection.fromUpToDown ?
    Tween(begin: 0.0, end: 1.0) : Tween(begin: 1.0, end: 0.0);

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    _expandAnimation =
        tween.animate(_animationController);
  }

  void _update (){
    setState(() {
      showFlag = !showFlag;
    });
  }

  bool showFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(100),
        child: Stack(
          children: [
            Visibility(
              visible: showFlag && widget.animationDirection == AnimationDirection.fromDownToUp,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
            Visibility(
              visible: showFlag,
              maintainState: true,
              child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: _expandAnimation,
                child: Container(
                  width: 200,
                  height: 200,
                  color: widget.animationDirection == AnimationDirection.fromDownToUp ? Colors.white : Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(showFlag){


            await _animationController.reverse();
            _update();
          }else{
            _update();
            await _animationController.forward();
          }
        },
        child: Icon(Icons.menu),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
