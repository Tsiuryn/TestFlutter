import 'package:flutter/services.dart';

import 'utils/uni_formatter_options.dart';

class UniFormatter extends TextInputFormatter {
  final UniFormatterOptions options;

  UniFormatter({
    UniFormatterOptions? options,
  }) : options = options ?? UniFormatterOptions.def();

  // :assert(thousandSeparator == ThousandSeparator.comma && decimalSeparator == DecimalSeparator.comma),
  //   assert(thousandSeparator == ThousandSeparator.dot && decimalSeparator == DecimalSeparator.dot);

  late TextEditingValue oldValue;
  late TextEditingValue newValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text == newValue.text) return newValue;
    this.oldValue = oldValue;
    this.newValue = newValue;

    bool isBackSpace = newValue.text.length < oldValue.text.length;

    if (isBackSpace) {
      return options.removeValue(newValue);
    } else {
      var result = options.addValue(
          newText: newValue.text,
          oldText: oldValue.text,
          cursor: newValue.selection.start);
      return newValue.copyWith(
          text: result.formattedText,
          selection: TextSelection.collapsed(offset: result.cursor));
    }
  }
}
