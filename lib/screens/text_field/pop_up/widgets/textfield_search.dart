import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// stuff for debouncing
import 'package:flutter/foundation.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TextFieldSearch extends StatefulWidget {
  final List initialList;
  final String label;
  final TextEditingController controller;
  final Function getSelectedValue;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final int minStringLength;

  const TextFieldSearch(
      {Key,
      key,
      required this.initialList,
      required this.label,
      required this.controller,
      this.textStyle,
      required this.getSelectedValue,
      this.decoration,
      this.minStringLength = 2})
      : super(key: key);

  @override
  _TextFieldSearchState createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  List filteredList = [];
  bool hasFuture = false;
  bool loading = false;
  bool itemsFound = false;

  void resetList() {
    List tempList = [];
    setState(() {
      // after loop is done, set the filteredList state from the tempList
      this.filteredList = tempList;
      this.loading = false;
    });
    // mark that the overlay widget needs to be rebuilt
    this._overlayEntry.markNeedsBuild();
  }

  void resetState(List tempList) {
    setState(() {
      // after loop is done, set the filteredList state from the tempList
      this.filteredList = tempList;
      this.loading = false;
      itemsFound = tempList.length == 0 ? false : true;
    });
    // mark that the overlay widget needs to be rebuilt so results can show
    _overlayEntry.markNeedsBuild();
  }

  void updateList() {
    filteredList = widget.initialList;
    List tempList = [];
    for (int i = 0; i < filteredList.length; i++) {
      if (filteredList[i]
          .toLowerCase()
          .contains(widget.controller.text.toLowerCase())) {
        tempList.add(this.filteredList[i]);
      }
    }
    resetState(tempList);
  }

  void initState() {
    super.initState();
    // add event listener to the focus node and only give an overlay if an entry
    // has focus and insert the overlay into Overlay context otherwise remove it
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        _closeDropDown();
      }
    });
  }

  void _closeDropDown() {
    this._overlayEntry.remove();
    // check to see if itemsFound is false, if it is clear the input
    // check to see if we are currently loading items when keyboard exists, and clear the input
    if (itemsFound == false || loading == true) {
      // reset the list so it's empty and not visible
      resetList();
      widget.controller.clear();
    }
    // if we have a list of items, make sure the text input matches one of them
    // if not, clear the input
    if (filteredList.length > 0) {
      bool textMatchesItem = false;
      if (widget.getSelectedValue != null) {
        // try to match the label against what is set on controller
        textMatchesItem =
            filteredList.any((item) => item.label == widget.controller.text);
      } else {
        textMatchesItem = filteredList.contains(widget.controller.text);
      }
      if (textMatchesItem == false) widget.controller.clear();
      resetList();
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  Widget _listViewBuilder(context) {
    if (itemsFound == false) {
      return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // clear the text field controller to reset it
              widget.controller.clear();
              setState(() {
                itemsFound = false;
              });
              // reset the list so it's empty and not visible
              resetList();
              // remove the focus node so we aren't editing the text
              FocusScope.of(context).unfocus();
            },
            child: ListTile(
              title: Text('No matching items.'),
              trailing: Icon(Icons.cancel),
            ),
          ),
        ],
      );
    }
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, i) {
        return GestureDetector(
            onTap: () {
              // set the controller value to what was selected
              setState(() {
                // if we have a label property, and getSelectedValue function
                // send getSelectedValue to parent widget using the label property
                if (widget.getSelectedValue != null) {
                  widget.controller.text = filteredList[i].label;
                  widget.getSelectedValue(filteredList[i]);
                } else {
                  widget.controller.text = filteredList[i];
                }
              });
              // reset the list so it's empty and not visible
              resetList();
              // remove the focus node so we aren't editing the text
              FocusScope.of(context).unfocus();
            },
            child: ListTile(
                title: widget.getSelectedValue != null
                    ? Text(filteredList[i])
                    : Text(filteredList[i])));
      },
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }

  Widget? _listViewContainer(context) {
    if (itemsFound == true && filteredList.length > 0 ||
        itemsFound == false && widget.controller.text.length > 0) {
      double _height = itemsFound == true && filteredList.length > 1 ? 260 : 55;
      return Container(
        height: _height,
        child: _listViewBuilder(context),
      );
    }
    return null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox;
    Size overlaySize = renderBox.size;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: overlaySize.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, overlaySize.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: screenWidth,
                        maxWidth: screenWidth,
                        minHeight: 0,
                        // max height set to 150
                        maxHeight: itemsFound == true ? 250 : 55,
                      ),
                      child: _listViewContainer(context)),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: VisibilityDetector(
        key: Key("unique key"),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction < 0.5) {
            FocusScope.of(context).unfocus();
          }
        },
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: widget.decoration != null
              ? widget.decoration
              : InputDecoration(labelText: widget.label),
          style: widget.textStyle,
          onChanged: (String value) {
            setState(() {
              updateList();
            });
          },
        ),
      ),
    );
  }
}
