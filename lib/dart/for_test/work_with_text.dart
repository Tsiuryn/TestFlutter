import 'dart:convert';
import 'dart:io';

void main() {
  // print('1 + 1 = ...');
  // var line = stdin.readLineSync(encoding: utf8);
  // print(line?.trim() == '2' ? 'Yup!' : 'Nope :(');

  someMethod();
}

void someMethod() async {
  for (var i = 0; i < 3; ++i) {
    print('$i');
    await Future.delayed(Duration(seconds: 1));
  }

  print('What\'s next?');

  var line = stdin.readLineSync(encoding: utf8);
  print(line?.trim() == '4' ? 'Success' : 'Are you stupid?');
}
