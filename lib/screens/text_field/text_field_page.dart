import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/screens/text_field/input_formatters/money_format_page.dart';
import 'package:test_flutter/screens/text_field/pop_up/text_field_with_pop_up.dart';
import 'package:test_flutter/screens/text_field/show_more/show_more_page.dart';
import 'package:test_flutter/screens/text_field/text_field_widget.dart';

// TODO: Need refactor
class TextFieldPage extends StatefulWidget {
  static const id = 'TextFieldPage';

  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var _firstValue = '';
  var _secondValue = '';

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
    locale: 'ru',
    decimalDigits: 2,
    symbol: '',
  );

  // var controller = new MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ' ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFieldPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(
                  'Summary',
                  keyboardType: TextInputType.text,
                  // inputFormatter: [
                  //   FilteringTextInputFormatter.allow(RegExp('[A-Z-0-9/]')),
                  //   LengthLimitingTextInputFormatter(29),
                  // ],
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'Field cannot be blank';
                      }
                      if (value.length > 10) {
                        return 'Max symbols';
                      }
                    }

                    return null;
                  },
                  onFocusChangeListener: (hasFocus) {
                    if (!hasFocus) {
                      if (_firstValue.isEmpty) {
                        return 'Empty';
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  'Amount',
                  keyboardType: TextInputType.number,
                  inputFormatter: [
                    formatter,
                  ],
                ),

                SizedBox(
                  height: 24,
                ),
                // TextFieldWidget(
                //   'Amount_2',
                //   controller: controller,
                //
                //   keyboardType: TextInputType.number,
                //
                // ),

                SizedBox(
                  height: 24,
                ),
                TextFieldWidget('Add some text'),
                OutlinedButton(
                    onPressed: () {
                      globalKey.currentState!.validate();
                    },
                    child: Text('check')),
                SizedBox(
                  height: 24,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, TextFieldWithPopUp.id);
                    },
                    child: Text('to PopUp Page')),
                SizedBox(
                  height: 24,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ShowMorePage.id);
                    },
                    child: Text('Show more page')),

                SizedBox(
                  height: 24,
                ),
                btn(context, 'Money Format page', MoneyFormatPage.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
