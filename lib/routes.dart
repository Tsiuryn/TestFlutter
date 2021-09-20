
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/screens/calculator/before/calc_screen.dart';
import 'package:test_flutter/screens/calculator/calculator_page.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'main.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  final Map<String, WidgetBuilder> appRoutes = {
    MyHomePage.id: (context) => MyHomePage(),
    ConstraintPage.id: (context) => ConstraintPage(),
    CalculatorPage.id: (context) => CalculatorPage(),
    LocalizationPage.id: (context)=> LocalizationPage(),
    ShareAppPage.id: (context) => ShareAppPage(),
    ProgressPage.id: (context) => ProgressPage(),
    CalcScreen.id: (context) => CalcScreen(),
  };
}
