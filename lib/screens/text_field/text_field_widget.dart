import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String placeHolder;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const TextFieldWidget(this.placeHolder, {Key? key, this.validator, this.keyboardType, this.inputFormatter}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: widget.placeHolder,
        border: OutlineInputBorder()
      ),
    );
  }
}
