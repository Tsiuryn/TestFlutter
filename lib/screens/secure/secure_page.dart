import 'package:flutter/material.dart';

/// Скрывает изображение экрана в фоне приложения
class SecurePage extends StatefulWidget {
  static const id = 'SecurePage';

  const SecurePage({Key? key}) : super(key: key);

  @override
  _SecurePageState createState() => _SecurePageState();
}

class _SecurePageState extends State<SecurePage> with WidgetsBindingObserver {
  bool isClosePage = false;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    isClosePage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('SecurePage'),
          ),
          body: Center(
            child: Text(
              'This is secure Page',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Visibility(
            visible: isClosePage,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              color: Colors.green[400],
              child: Center(
                child: Text(
                  '********************',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      setState(() {
        isClosePage = true;
      });
    }
    if (state == AppLifecycleState.resumed) {
      setState(() {
        isClosePage = false;
      });
    }
  }
}
