
import 'package:flutter/cupertino.dart';
import 'calculator/calculator_page.dart';
import 'constraint/constraint_page.dart';
import 'main.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  final Map<String, WidgetBuilder> appRoutes = {
    MyHomePage.id: (context) => MyHomePage(),
    ConstraintPage.id: (context) => ConstraintPage(),
    CalculatorPage.id: (context) => CalculatorPage()
  };
}
