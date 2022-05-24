import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOverlayWidget extends StatefulWidget {
  final Widget parent;
  final Widget contentBox;

  const MyOverlayWidget({required this.contentBox, required this.parent, Key? key}) : super(key: key);

  @override
  MyOverlayWidgetState createState() => MyOverlayWidgetState();
}

class MyOverlayWidgetState extends State<MyOverlayWidget> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  late Widget box;

  @override
  void initState() {
    super.initState();
    box =  widget.contentBox;
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: widget.parent,
    );
  }

  void showOverlay() {
    WidgetsBinding.instance.addPostFrameCallback((_){
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 8),
                child: buildOverlay(),
              ),
            ));
    overlay.insert(entry!);
  });
  }

  Widget buildOverlay() {
    return Material(
      elevation: 8,
      child: SingleChildScrollView(
        child: box,
        // child: Column(
        //   children: [
        //     ListTile(
        //       title: Text('Hello'),
        //       leading: Text('12121221'),
        //     ),
        //     ListTile(
        //       title: Text('Hello'),
        //       leading: Text('12121221'),
        //     ),
        //     ListTile(
        //       title: Text('Hello'),
        //       leading: Text('12121221'),
        //     ),
        //     ListTile(
        //       title: Text('Hello'),
        //       leading: Text('12121221'),
        //     ),
        //     ListTile(
        //       title: Text('Hello'),
        //       leading: Text('12121221'),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  void hideOverlay (){
    entry?.remove();
    entry = null;
  }
}
