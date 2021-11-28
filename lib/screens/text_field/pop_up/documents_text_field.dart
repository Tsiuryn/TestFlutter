
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DocumentsTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final String? Function(String?)? validator;
  final String? Function(bool)? onFocusChangeListener;
  final bool enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const DocumentsTextField(
      {Key? key,
        required this.controller,
        required this.focusNode,
        this.placeholder = '',
        this.validator,
        this.onFocusChangeListener,
        this.enabled = true,
        this.keyboardType = TextInputType.text,
        this.inputFormatter})
      : super(key: key);

  @override
  _DocumentsTextFieldState createState() => _DocumentsTextFieldState();
}

class _DocumentsTextFieldState extends State<DocumentsTextField> {
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (widget.onFocusChangeListener != null) {
        setState(() {
          _errorText = widget.onFocusChangeListener!(_focusNode.hasFocus);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.placeholder,
        enabled: widget.enabled,
        focusedBorder:
        _buildOutlineBorder(Theme.of(context).colorScheme.secondary),
        errorBorder: _buildOutlineBorder(Theme.of(context).errorColor),
        errorText: _errorText,
        border: _buildOutlineBorder(Theme.of(context).unselectedWidgetColor),
      ),
      style: TextStyle(color: _getTextColor(context)),
      validator: (String? value) {
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      maxLines: null,
      inputFormatters: widget.inputFormatter,
      controller: widget.controller,
    );
  }

  Color _getTextColor(BuildContext context) {
    if (widget.enabled) {
      return Theme.of(context).primaryColorDark;
    } else {
      return Theme.of(context).primaryColor;
    }
  }

  InputBorder _buildOutlineBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}


