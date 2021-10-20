import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/routes.dart';
import 'package:test_flutter/screens/calculator/calc_screen.dart';
import 'package:test_flutter/screens/calc_old/calculator_page.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/custom/custom_page.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/localization/provider/locale_provider.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/search_list/search_list_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'package:test_flutter/screens/test/test_page.dart';
import 'package:test_flutter/screens/websocket/web_socket_page.dart';

import 'app/l10n/I10n.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
                child: Text("Test page"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: (){
                  Navigator.pushNamed(context, TestPage.id);
                }),
            MaterialButton(
                child: Text("Constraint layout "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: (){
                  Navigator.pushNamed(context, ConstraintPage.id);
            }),
              MaterialButton(
                  child: Text("Calculator layout"),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, CalculatorPage.id);
                  }),
            MaterialButton(
                child: Text("Calculator screen"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, CalcScreen.id);
                }),
              MaterialButton(
                  child: Text("Localization screen"),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, LocalizationPage.id);
                  }),
            MaterialButton(
                child: Text("Shared app "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, ShareAppPage.id);
                }),
            MaterialButton(
                child: Text("Progress page "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, ProgressPage.id);
                }),
            MaterialButton(
                child: Text("Custom page "),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, CustomPage.id);
                }),
            MaterialButton(
                child: Text("Web Socket page"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, WebSocketPage.id);
                }),
            MaterialButton(
                child: Text("Search list page"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, SearchListPage.id);
                }),
            ],
        ),
      )
    );
  }
}
