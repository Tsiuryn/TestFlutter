import 'package:flutter/material.dart';

class MyOverlayWidget extends StatefulWidget {
  static const id = 'MyOverlayWidget';

  const MyOverlayWidget({Key? key}) : super(key: key);

  @override
  _MyOverlayWidgetState createState() => _MyOverlayWidgetState();
}

class _MyOverlayWidgetState extends State<MyOverlayWidget> {
  var toast = ShowNotificationIcon();
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyOverlayWidget'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            if (isShown) {
              toast.remove();
            } else {
              toast.show(context);
            }
            isShown = !isShown;
          },
          style: ButtonStyle(elevation: MaterialStateProperty.all(4)),
          child: Text('Show overlay'),
        ),
      ),
    );
  }
}

class ShowNotificationIcon {
  final Color background;

  ShowNotificationIcon({this.background = Colors.blueAccent});

  OverlayEntry? overlayEntry;

  void show(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var screenSize = MediaQuery.of(context).size;
      OverlayState? overlayState = Overlay.of(context);
      overlayEntry = OverlayEntry(builder: (context) {
        return Positioned(
          top: 8.0,
          left: screenSize.width / 4,
          child: Card(
            color: Colors.transparent,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              width: screenSize.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.white,
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        '1 payment status changed',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });

      overlayState!.insert(overlayEntry!);
    });
  }

  void remove() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
    }
  }
}
