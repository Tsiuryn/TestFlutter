
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/routes.dart';
import 'package:test_flutter/screens/animation/animation_page.dart';
import 'package:test_flutter/screens/big_screen/big_screen_page.dart';
import 'package:test_flutter/screens/bird_calc/bird_calc_page.dart';
import 'package:test_flutter/screens/bloc/bloc_main_page.dart';
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
import 'app_widgets/main_button.dart';

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
      btn(context, 'Animation', AnimationPage.id),
      btn(context, 'Test page', TestPage.id),
      btn(context, 'Constraint layout', ConstraintPage.id),
      btn(context, 'Calculator layout', CalculatorPage.id),
      btn(context, 'Calculator screen', CalcScreen.id),
      btn(context, 'Localization screen', LocalizationPage.id),
      btn(context,
        'Shared app',
        ShareAppPage.id,
      ),
      btn(context, 'Progress page', ProgressPage.id),
      btn(context, 'Secure page', SecurePage.id),
      btn(context, 'Custom page', CustomPage.id),
      btn(context, 'Web Socket page', WebSocketPage.id),
      btn(context, 'Search list page', SearchListPage.id),
      btn(context, 'Scroll view page', ScrollViewPage.id),
      btn(context, 'Bloc simple page', BlocMainPage.id),
      btn(context, 'Redux simple page', ReduxSimplePage.id),
      btn(context, 'Download file page', DownloadFilePage.id),
      btn(context, 'Notification page', NotificationPage.id),
      btn(context, 'Text field page', TextFieldPage.id),
      btn(context, 'Change theme page', ChangeThemePage.id),
      btn(context, 'DropDown menu', DropdownButtonExample.id),
      btn(context, 'Bird Calc page', BirdCalcPage.id),
      btn(context, 'Big Screen page', BigScreenPage.id),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: MainListWidget(
        listWidget: listBtn,
      ),
    );
  }

}
