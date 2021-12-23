
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/routes.dart';
import 'package:test_flutter/screens/animation/animation_page.dart';
import 'package:test_flutter/screens/calc_old/calculator_page.dart';
import 'package:test_flutter/screens/calculator/calc_screen.dart';
import 'package:test_flutter/screens/change_theme/change_theme_page.dart';
import 'package:test_flutter/screens/change_theme/themes.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/custom/custom_page.dart';
import 'package:test_flutter/screens/download_file/download_file_page.dart';
import 'package:test_flutter/screens/list/search_list.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/localization/provider/locale_provider.dart';
import 'package:test_flutter/screens/menu/dropdown_menu.dart';
import 'package:test_flutter/screens/notification/notification_api.dart';
import 'package:test_flutter/screens/notification/notification_page.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/redux/redux_simple_page.dart';
import 'package:test_flutter/screens/scroll/scroll_view_page.dart';
import 'package:test_flutter/screens/search_list/search_list_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'package:test_flutter/screens/slidable/slidable_page.dart';
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _btn('Animation', AnimationPage.id, toRight: true),
                _btn('Test page', TestPage.id),
                _btn('Constraint layout', ConstraintPage.id, toRight: true),
                _btn('Calculator layout', CalculatorPage.id),
                _btn('Calculator screen', CalcScreen.id, toRight: true),
                _btn('Localization screen', LocalizationPage.id),
                _btn('Shared app', ShareAppPage.id, toRight: true),
                _btn('Progress page', ProgressPage.id),
                _btn('Custom page', CustomPage.id, toRight: true),
                _btn('List search', ListSearch.id),
                _btn('Web Socket page', WebSocketPage.id, toRight: true),
                _btn('Search list page', SearchListPage.id),
                _btn('Scroll view page', ScrollViewPage.id, toRight: true),
                _btn('Redux simple page', ReduxSimplePage.id),
                _btn('Download file page', DownloadFilePage.id, toRight: true),
                _btn('Notification page', NotificationPage.id),
                _btn('Text field page', TextFieldPage.id, toRight: true),
                _btn('Change theme page', ChangeThemePage.id),
                _btn('DropDown menu', DropdownButtonExample.id, toRight: true),
                _btn('Slidable page', SlidablePage.id, toRight: false),
              ],
            ),
          ),
        ));
  }

  Widget _btn(String btnName, String pageId, {bool toRight = false}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: toRight ? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        // Visibility(
        //   visible: toRight,
        //   child: Expanded(child: Spacer()),
        // ),
        Container(
          width: 200,
          child: OutlinedButton(
              child: Text(
                btnName,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, pageId);
              }),
        ),
      ],
    );
  }
}
