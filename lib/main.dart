
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/routes.dart';
import 'package:test_flutter/screens/animation/animation_page.dart';
import 'package:test_flutter/screens/bird_calc/bird_calc_page.dart';
import 'package:test_flutter/screens/calc_old/calculator_page.dart';
import 'package:test_flutter/screens/calculator/calc_screen.dart';
import 'package:test_flutter/screens/change_theme/change_theme_page.dart';
import 'package:test_flutter/screens/change_theme/themes.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/custom/custom_page.dart';
import 'package:test_flutter/screens/download_file/download_file_page.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/localization/provider/locale_provider.dart';
import 'package:test_flutter/screens/menu/dropdown_menu.dart';
import 'package:test_flutter/screens/notification/notification_api.dart';
import 'package:test_flutter/screens/notification/notification_page.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/redux/redux_simple_page.dart';
import 'package:test_flutter/screens/scroll/scroll_view_page.dart';
import 'package:test_flutter/screens/search_list/search_list_page.dart';
import 'package:test_flutter/screens/secure/secure_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'package:test_flutter/screens/test/test_page.dart';
import 'package:test_flutter/screens/text_field/text_field_page.dart';
import 'package:test_flutter/screens/websocket/web_socket_page.dart';

import 'app/l10n/I10n.dart';

StreamController<bool> isLightTheme = StreamController();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi().initNotification();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
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
            theme: lightTheme,
            darkTheme: darkTheme,
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
  late List<Widget> listBtn;


  @override
  void initState() {
    listBtn = <Widget>[
      _btn('Animation', AnimationPage.id),
      _btn('Test page', TestPage.id),
      _btn('Constraint layout', ConstraintPage.id),
      _btn('Calculator layout', CalculatorPage.id),
      _btn('Calculator screen', CalcScreen.id),
      _btn('Localization screen', LocalizationPage.id),
      _btn(
        'Shared app',
        ShareAppPage.id,
      ),
      _btn('Progress page', ProgressPage.id),
      _btn('Secure page', SecurePage.id),
      _btn('Custom page', CustomPage.id),
      _btn('Web Socket page', WebSocketPage.id),
      _btn('Search list page', SearchListPage.id),
      _btn('Scroll view page', ScrollViewPage.id),
      _btn('Redux simple page', ReduxSimplePage.id),
      _btn('Download file page', DownloadFilePage.id),
      _btn('Notification page', NotificationPage.id),
      _btn('Text field page', TextFieldPage.id),
      _btn('Change theme page', ChangeThemePage.id),
      _btn('DropDown menu', DropdownButtonExample.id),
      _btn('Bird Calc page', BirdCalcPage.id),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: listBtn,
        ),
      ),
    );
  }

  Widget _btn(String btnName, String pageId) {
    return OutlinedButton(
        child: Center(
          child: Text(
            btnName,
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(elevation: MaterialStateProperty.all(4)),
        onPressed: () {
          Navigator.pushNamed(context, pageId);
        });
  }
}
