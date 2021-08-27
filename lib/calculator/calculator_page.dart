import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/checkbox_widget/checkbox_widget.dart';

class CalculatorPage extends StatefulWidget {
  static const String id = 'calculator_page';

  const CalculatorPage({Key key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _controller = TextEditingController();
  String _text = '';
  FocusNode _focusNode;

  void setText(String text) {
    setState(() {
      int currentCursorPosition = _controller.value.selection.base.offset;
      if(currentCursorPosition != -1){
        String before = _text.substring(0, currentCursorPosition );
        String after = _text.substring(currentCursorPosition, _text.length);
        print('$before $after');
        _text = '$before$text$after';
      }else{
        _text = '$_text$text';
      }
      print(currentCursorPosition + 1);
      _controller.text = _text;
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: currentCursorPosition + 1));
    });
  }

  void deleteText(){
    setState(() {
      int currentCursorPosition = _controller.value.selection.base.offset;
      if(currentCursorPosition != -1) {
        String before = _text.substring(0, currentCursorPosition - 1);
        String after = _text.substring(currentCursorPosition, _text.length);
        _text = '$before$after';
        _controller.text = _text;
        _controller.selection = TextSelection.fromPosition(TextPosition(offset: currentCursorPosition - 1));
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _controller.text = _text;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          TextFormField(
            showCursor: true,
            readOnly: true,
            autofocus: true,
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value){
              _text = value;
            },
            maxLength: 20,
            decoration: InputDecoration(
              labelText: 'Label text',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              helperText: 'Helper text',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  setText('1');
                },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
                child: Text('1'),
              ),
              MaterialButton(
                onPressed: () {
                  setText('2');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text('2'),
              ),
              MaterialButton(
                onPressed: () {
                  setText('3');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text('3'),
              ),
              GestureDetector(
                onLongPress:(){
                  _controller.text = '';
                  _text = '';
                },
                child: OutlinedButton(
                  onPressed: () {
                      deleteText();
                  },
                  child: Icon (
                    Icons.arrow_back,
                    color: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          CheckboxWidget(),
        ],
      ),
    );
  }
}
