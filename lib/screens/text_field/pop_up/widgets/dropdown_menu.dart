import 'dart:math';

import 'package:flutter/cupertino.dart';

// stuff for debouncing
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DropDownMenu extends StatefulWidget {
  final Widget textField;
  final Widget boxWidgets;

  DropDownMenu({
    Key,
    key,
    required this.textField,
    required this.boxWidgets,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => DropDownMenuState();
}

class DropDownMenuState extends State<DropDownMenu> {
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final _formKey = GlobalKey();
  double boxHeight = 0;
  bool isShow = false;

  void _closeDropDown() {
    boxHeight = 0;
    _overlayEntry.markNeedsBuild();
    // _overlayEntry.remove();
  }

  void showMenu(bool showMenu) async {
    if (showMenu) {
      if (isShow) {
        boxHeight = 300;
        _overlayEntry.markNeedsBuild();
        return;
      }
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        isShow = true;
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
        await Future.delayed(Duration(milliseconds: 10));
        boxHeight = 300;
        _overlayEntry.markNeedsBuild();
      });
    } else {
      _closeDropDown();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = _formKey.currentContext!.findRenderObject() as RenderBox?;
    Size? overlaySize = renderBox!.size;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return OverlayEntry(
        builder: (context) => Positioned(
            width: overlaySize.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, overlaySize.height + 5),
              child: Material(
                elevation: 2.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: boxHeight,
                  constraints: BoxConstraints(
                    minWidth: screenWidth,
                    maxWidth: screenWidth,
                  ),
                  child: widget.boxWidgets,
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      key: _formKey,
      child: VisibilityDetector(
          key: Key("unique key"),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction < 0.2) {
              _closeDropDown();
            }
          },
          child: widget.textField),
    );
  }
}
