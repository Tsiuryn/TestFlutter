import 'package:flutter/material.dart';

class UniFormatterOptions {
  final int digitCapacity;
  final ThousandSeparator thousandSeparator;
  final DecimalSeparator decimalSeparator;

  UniFormatterOptions({
    required this.digitCapacity,
    required this.thousandSeparator,
    required this.decimalSeparator,
  });

  UniFormatterOptions.def()
      : digitCapacity = 2,
        thousandSeparator = ThousandSeparator.space,
        decimalSeparator = DecimalSeparator.comma;

  var listItem = <TextItem>[];
  String _newText = '';
  String _oldText = '';
  int _cursor = 0;
  bool _isAddedDecimalSeparator = false;

  FormattedTextInput addValue({
    required String newText,
    required String oldText,
    required int cursor,
  }) {
    _newText = newText;
    _oldText = oldText;
    _cursor = cursor;

    if (!_isCorrectAddedSymbol(_getAddingSymbol())) {
      return FormattedTextInput(oldText, cursor);
    }

    _fillItemList();

    final textFormattedItem = getFormattedText();

    return FormattedTextInput(textFormattedItem.formattedText, textFormattedItem.cursor);
  }

  TextEditingValue removeValue(TextEditingValue newValue) {
    return newValue;
  }

  String _getAddingSymbol() {
    return _cursor > 0 ? _newText.substring(_cursor - 1, _cursor) : '';
  }

  bool _isCorrectAddedSymbol(String addedSymbol) {
    RegExp digitsPattern = RegExp(r'^[0-9]');

    return digitsPattern.hasMatch(addedSymbol) || addedSymbol == decimalSeparator.value && !_isAddedDecimalSeparator;
  }

  void _fillItemList() {
    int countDeletedSymbols = 0;
    listItem.clear();
    for (var i = 0; i < _newText.length; ++i) {
      var addedSymbol = _newText[i];
      if (_isCorrectAddedSymbol(addedSymbol)) {
        listItem.add(TextItem(char: addedSymbol, isSelected: i == _cursor - 1));
        if (addedSymbol == '0' && _cursor == 1) {
          listItem.add(TextItem(char: decimalSeparator.value, isSelected: false));
          countDeletedSymbols--;
        }
        if (addedSymbol == decimalSeparator.value) _isAddedDecimalSeparator = true;
      } else if (i < _cursor) {
        countDeletedSymbols++;
      }
    }
    _cursor = _cursor - countDeletedSymbols;
  }

  FormattedTextInput getFormattedText() {
    var formattedText = '';
    var indexSeparator = listItem.indexWhere((element) => element.char == decimalSeparator.value);

    int countSymbols = 0;
    int countThousandSeparator = 0;
    bool isSelectedItem = false;
    for (var i = listItem.length - 1; i >= 0; i--) {
      var element = listItem[i];
      formattedText += element.char;
      isSelectedItem = isSelectedItem == true ? true : element.isSelected;

      if (i < indexSeparator || indexSeparator == -1) {
        countSymbols++;
      }

      if (countSymbols != 0 && i != 0 && countSymbols % 3 == 0) {
        formattedText += thousandSeparator.value;
        if (isSelectedItem) {
          countThousandSeparator++;
        }
      }
    }
    _cursor = _cursor + countThousandSeparator;

    formattedText = _reverseText(formattedText);

    if (indexSeparator != -1) {
      final countSymbolFromSeparatorToLength = formattedText.length - formattedText.indexOf(decimalSeparator.value) - 1;

      if (countSymbolFromSeparatorToLength > digitCapacity) {
        final newLength = formattedText.length - countSymbolFromSeparatorToLength + digitCapacity;
        _cursor = _cursor - formattedText.length + newLength;
        formattedText = formattedText.substring(0, newLength);
      }
    }

    return FormattedTextInput(formattedText, _cursor);
  }
}

String _reverseText(String text) {
  var reversedText = '';
  for (var i = text.length - 1; i >= 0; i--) {
    reversedText += text[i];
  }

  return reversedText;
}

class FormattedTextInput {
  final String formattedText;
  final int cursor;

  FormattedTextInput(this.formattedText, this.cursor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormattedTextInput && runtimeType == other.runtimeType && formattedText == other.formattedText && cursor == other.cursor;

  @override
  int get hashCode => formattedText.hashCode ^ cursor.hashCode;

  @override
  String toString() {
    return 'FormattedTextInput{formattedText: $formattedText, cursor: $cursor}';
  }
}

class TextItem {
  final String char;
  final bool isSelected;

  TextItem({
    required this.char,
    required this.isSelected,
  });
}

/// [comma] means this format 1,000,000
/// [dot] means thousands and mantissa will look like this 1.000.000
/// [none] no separator will be applied at all 1000000
/// [space] 1 000 000
enum ThousandSeparator {
  comma,
  dot,
  space,
  none,
}

extension ThousandSeparatorExt on ThousandSeparator {
  String get value =>
      <ThousandSeparator, String>{
        ThousandSeparator.comma: ',',
        ThousandSeparator.dot: '.',
        ThousandSeparator.space: ' ',
        ThousandSeparator.none: '',
      }[this] ??
      '';
}

/// [comma] means this format 10000,00
/// [dot] means this format 10000.00
enum DecimalSeparator { dot, comma }

extension DecimalSeparatorExt on DecimalSeparator {
  String get value =>
      <DecimalSeparator, String>{
        DecimalSeparator.comma: ',',
        DecimalSeparator.dot: '.',
      }[this] ??
      '';
}
