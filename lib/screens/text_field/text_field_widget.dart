import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String placeHolder;
  final String? defaultValue;
  final bool enabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(bool)? onFocusChangeListener;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const TextFieldWidget(this.placeHolder,
      {Key? key,
      this.defaultValue,
      bool? enable,
      this.validator,
      this.onFocusChangeListener,
      this.keyboardType,
      this.inputFormatter,
      this.controller})
      : this.enabled = enable ?? true,
        super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    if (widget.defaultValue != null) {
      _controller.text = widget.defaultValue!;
    }
    _focusNode.addListener(() {
      if (widget.onFocusChangeListener != null) {
        setState(() {
          _errorText = widget.onFocusChangeListener!(_focusNode.hasFocus);
        });
      }
    });
    super.initState();
  }

  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      maxLines: 1,
      decoration: InputDecoration(
          labelText: widget.placeHolder,
          border: OutlineInputBorder(),
          errorText: _errorText,
          focusedBorder: OutlineInputBorder()),
      keyboardType: widget.keyboardType ?? TextInputType.number,
      inputFormatters: widget.inputFormatter,
      enabled: widget.enabled,
      onChanged: (value) {
        print(value);
      },
      validator: (String? value) {
        setState(() {
          if (widget.validator != null) {
            _errorText = widget.validator!(value);
          }
        });
      },
    );
  }
}
