import 'package:test_flutter/dart/class_and_object/singleton.dart';

import 'factory_constructor.dart';

void main() {
  var one = SingletonOne();
  SingletonThree three = SingletonThree.instance;

  Application myApp1 = Application("Internet Browser");
  Application myApp2 = Application("Internet Browser 2");
  myApp2.about();
}
