import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_picker_widget.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({Key key}) : super(key: key);

  static const String id = 'localization_page';



  @override
  _LocalizationPageState createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  int _id = 0;

  void incrementId(){
    setState(() {
      _id += 1;
    });
  }

  void nullableId(){
    setState(() {
      _id = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).title,
        ),
        actions: [LanguagePickerWidget()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(AppLocalizations.of(context).with_parameters(_id.toString()))),
          SizedBox(
            height: 150.0,
          ),
          GestureDetector(
            onLongPress: () => nullableId(),
            child: FloatingActionButton(
              onPressed: () {incrementId();},
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}

/*
0. Add to pubspec.yaml:
<dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0-nullsafety.2
>
<flutter:
  generate: true
>
1. Create file <app.l10n.yaml> (little "l") and add to the file:
< arb-dir: lib/app.l10n
template-arb-file: app_en.arb
output-screens.localization-file: app_localizations.dart>
2. Add the package <app.l10n>
3. Create class <app.l10n.dart> and input there:
<class L10n{
  static final all = [
    const Locale('en'),
    const Locale('ru')
  ];
}>
4. Create <app_en.arb> file:
<{
  "language": "English",
  "@language": {
    "description": "The current language"
  },

  "hello": "Hello world",
  "@hello": {
    "description": "Hello world"
  }
}>

5. Create <app_ru.arb> (for example) file:
<{
  "language": "Русский",
  "hello": "Привет мир"
}>

6. Import: <import 'package:flutter_gen/gen_l10n/app_localizations.dart';> and <provider: ^4.3.3>

7. Add to MaterialApp:
<  @override
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
      });>
 */
