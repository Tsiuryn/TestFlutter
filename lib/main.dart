import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/calculator/calculator_page.dart';
import 'package:test_flutter/constraint/constraint_page.dart';
import 'package:test_flutter/localization/localization_page.dart';
import 'package:test_flutter/routes.dart';

import 'app/l10n/I10n.dart';
import 'localization/provider/locale_provider.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: MyHomePage.id,
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
            routes: Routes(context).appRoutes);
      });
}

class MyHomePage extends StatefulWidget {
  static const String id = 'my_app_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
                child: Text("Constraint layout "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: (){
                  Navigator.pushNamed(context, ConstraintPage.id);
            }),

          ),
            Center(
              child: MaterialButton(
                  child: Text("Calculator layout"),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, CalculatorPage.id);
                  }),
            ),
            Center(
              child: MaterialButton(
                  child: Text("Localization screen"),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, LocalizationPage.id);
                  }),
            ),
          ],
      )
    );
  }
}
