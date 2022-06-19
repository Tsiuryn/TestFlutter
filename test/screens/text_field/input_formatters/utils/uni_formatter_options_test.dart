import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter/screens/text_field/input_formatters/utils/uni_formatter_options.dart';

void main() {
  late UniFormatterOptions formatterOptions;

  setUp(() {
    formatterOptions = UniFormatterOptions(
      digitCapacity: 2,
      thousandSeparator: ThousandSeparator.space,
      decimalSeparator: DecimalSeparator.comma,
    );
  });

  group('UniFormatterOptions - add symbol', () {
    test('add 2', () {
      const oldText = '1';
      const newText = '12';
      const cursor = 2;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput(newText, cursor));
    });

    test('add comma', () {
      const oldText = '1';
      const newText = '1,';
      const cursor = 2;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput(newText, cursor));
    });

    test('add symbol after separator', () {
      const oldText = '1,';
      const newText = '1,0';
      const cursor = 3;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput(newText, cursor));
    });

    test('add symbol 0', () {
      const oldText = '100';
      const newText = '1 000';
      const cursor = 5;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput(newText, cursor));
    });

    test('test digit capacity', () {
      const oldText = '1 245,23';
      const newText = '1 245,235';
      const cursor = 9;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput('1 245,23', 8));
    });

    test('test digit capacity', () {
      const oldText = '1 245,234';
      const newText = '1 245,2345';
      const cursor = 10;

      var result = formatterOptions.addValue(
          newText: newText, oldText: oldText, cursor: cursor);

      expect(result, FormattedTextInput('1 245,23', 8));
    });
  });
}
