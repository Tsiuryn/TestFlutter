import 'package:intl/intl.dart';

late final _formatter = NumberFormat(_format, 'en');
late final _formatterRu = NumberFormat(_format, 'ru_RU');

const String _format = '#,##0.00';

void main() {
  final double qqq = 121212.01;

  print(_formatter.format(qqq));
  print(_formatterRu.format(qqq));
}
