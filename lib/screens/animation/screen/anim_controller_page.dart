import 'package:flutter/material.dart';

class AnimControllerPage extends StatefulWidget {
  static const id = 'AnimControllerPage';

  const AnimControllerPage({Key? key}) : super(key: key);

  @override
  _AnimControllerPageState createState() => _AnimControllerPageState();
}

class _AnimControllerPageState extends State<AnimControllerPage> {
  bool _isVisible = true;

  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimControllerPage'),
      ),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: 300,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 16, bottom: 16),
                child: Column(
                  children: [
                    MyInputWidget(labelText: 'Name'),
                    MyInputWidget(labelText: 'Password'),
                    LayoutBuilder(builder: (context, constraints) {
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: _opacity,
                        onEnd: () {
                          if (_isVisible) {
                            setState(() {
                              _isVisible = _opacity == 1;
                            });
                          }
                        },
                        child: Visibility(
                          visible: _isVisible,
                          child: MyInputWidget(labelText: 'Email'),
                        ),
                      );
                    }),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (!_isVisible) {
                              _isVisible = _opacity == 0;
                            }
                            _opacity = _opacity == 1 ? 0 : 1;
                          });
                        },
                        child: Text('Show/hide email field'))
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      )),
    );
  }
}

class MyInputWidget extends StatelessWidget {
  final String labelText;

  const MyInputWidget({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.blue)),
      ),
    );
  }
}
