import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/calculator/utils/component.dart';
import 'package:test_flutter/screens/calculator/utils/constants.dart';

class CalcScreen extends StatefulWidget {
  static const String id = 'CalcScreen';

  const CalcScreen({Key key}) : super(key: key);

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {

  TextEditingController _controller = TextEditingController();
  String _text = '';
  String _result = '0';
  FocusNode _focusNode;

  void _addSymbol(String text) {
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
      _controller.text = _text;
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: currentCursorPosition + 1));
      _result = _text;
    });
  }

  void _deleteSymbol(){
    setState(() {
      int currentCursorPosition = _controller.value.selection.base.offset;
      if(currentCursorPosition != -1) {
        String before = _text.substring(0, currentCursorPosition - 1);
        String after = _text.substring(currentCursorPosition, _text.length);
        _text = '$before$after';
        _controller.text = _text;
        _controller.selection = TextSelection.fromPosition(TextPosition(offset: currentCursorPosition - 1));
        _result = _text;
      }
    });
  }

  void _clearText(){
    setState(() {
      _text = '';
      _controller.text = _text;
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: 0));
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 4,
                  child: Card(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black,
                            width: 2.0
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 20,
                        showCursor: true,
                        readOnly: true,
                        autofocus: true,
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged: (value){
                          _text = value;
                        },
                        style: TextStyle(fontSize: 40, color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),


                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Card(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 2.0
                      ),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _result,
                            style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcBtn(
                      'С',
                      onPress: (value) {
                        _clearText();
                      },
                      btnStyle: kStyleBtnDel,
                    ),
                    CalcBtn(
                      '<--',
                      onPress: (value) {
                        _deleteSymbol();
                      },
                      btnStyle: kStyleBtnDel,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcBtn(
                      '7',
                      onPress: (value) {
                       _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '8',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '9',
                      secondText: '3×000',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '÷',
                      secondText: 'tan()',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnFunction,
                    ),
                    CalcBtn(
                      '(',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnSecondFunction,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcBtn(
                      '4',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '5',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '6',
                      secondText: '2×000',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '×',
                      secondText: 'sin()',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnFunction,
                    ),
                    CalcBtn(
                      ')',
                      secondText: '( ... )',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnSecondFunction,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcBtn(
                      '1',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '2',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '3',
                      secondText: '000',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '-',
                      secondText: 'cos()',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnFunction,
                    ),
                    CalcBtn(
                      '√',
                      secondText: 'x^n',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnSecondFunction,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcBtn(
                      '0',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      ',',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '%',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnNumb,
                    ),
                    CalcBtn(
                      '+',
                      secondText: '𝛑',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnFunction,
                    ),
                    CalcBtn(
                      '=',
                      onPress: (value) {
                        _addSymbol(value);
                      },
                      btnStyle: kStyleBtnSecondFunction,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



