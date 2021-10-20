
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/screens/calculator/calc_screen.dart';
import 'package:test_flutter/screens/calc_old/calculator_page.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/custom/circle.dart';
import 'package:test_flutter/screens/custom/custom_page.dart';
import 'package:test_flutter/screens/custom/lines.dart';
import 'package:test_flutter/screens/custom/polygon.dart';
import 'package:test_flutter/screens/custom/visualize_polygon.dart';
import 'package:test_flutter/screens/custom/visualizer.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/search_list/search_list_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'package:test_flutter/screens/test/test_page.dart';
import 'package:test_flutter/screens/websocket/pages/stomp_client_page.dart';
import 'package:test_flutter/screens/websocket/pages/web_socket_channel_page.dart';
import 'package:test_flutter/screens/websocket/web_socket_page.dart';
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
    CustomPage.id: (context) => CustomPage(),
    Lines.id: (context) => Lines(),
    Circle.id: (context) => Circle(),
    Polygon.id: (context) => Polygon(),
    Visualizer.id: (context) => Visualizer(),
    VisualizePolygon.id: (context) => VisualizePolygon(),
    TestPage.id: (context) => TestPage(),
    WebSocketChannelPage.id: (context) => WebSocketChannelPage(),
    WebSocketPage.id: (context) => WebSocketPage(),
    StompClientPage.id: (context) => StompClientPage(),
    SearchListPage.id: (context) => SearchListPage(),
  };
}
