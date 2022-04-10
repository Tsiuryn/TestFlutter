import 'package:test_flutter/dart/for_test/person.dart';

void main() {
  // var person = Person11(name: 'Marcus', age: 25, id: '00');
  // print('name - ${person.name}, age - ${person.age}, id - ${person.id}');
  var value = 'BOFAUS6S789';
  // print(_getmatch(value));
  print('${Own.kotlin.toString().toUpperCase()}');
}


bool _getmatch(String value){
  return swiftRegExp.hasMatch(value);
}

final swiftRegExp = RegExp('^[A-Za-z0-9]{8,11}\$'); // Полное выражение должно соответствовать регулярке


enum Own{
  dart, kotlin, swift
}