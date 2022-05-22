
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/screens/animation/animation_page.dart';
import 'package:test_flutter/screens/animation/screen/anim_controller_page.dart';
import 'package:test_flutter/screens/animation/screen/animate_by_stream_page.dart';
import 'package:test_flutter/screens/animation/screen/animated_container.dart';
import 'package:test_flutter/screens/animation/screen/animator_page.dart';
import 'package:test_flutter/screens/animation/screen/my_slide_transition.dart';
import 'package:test_flutter/screens/big_screen/big_screen_page.dart';
import 'package:test_flutter/screens/bird_calc/bird_calc_page.dart';
import 'package:test_flutter/screens/bloc/bloc_cubit/test_cubit_page.dart';
import 'package:test_flutter/screens/bloc/bloc_main_page.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/my_bloc_provider.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/multi_bloc_provider.dart';
import 'package:test_flutter/screens/calculator/calc_screen.dart';
import 'package:test_flutter/screens/calc_old/calculator_page.dart';
import 'package:test_flutter/screens/constraint/constraint_page.dart';
import 'package:test_flutter/screens/custom/pages/circle.dart';
import 'package:test_flutter/screens/custom/custom_page.dart';
import 'package:test_flutter/screens/custom/pages/indicator_widget.dart';
import 'package:test_flutter/screens/custom/pages/lines.dart';
import 'package:test_flutter/screens/custom/pages/my_overlay_widget.dart';
import 'package:test_flutter/screens/custom/pages/polygon.dart';
import 'package:test_flutter/screens/custom/pages/visualize_polygon.dart';
import 'package:test_flutter/screens/custom/pages/visualizer.dart';
import 'package:test_flutter/screens/dificult_ui/dificult_ui_page.dart';
import 'package:test_flutter/screens/dificult_ui/screens/divider_example_page.dart';
import 'package:test_flutter/screens/dificult_ui/screens/sticky_page.dart';
import 'package:test_flutter/screens/download_file/download_file_by_lib_page.dart';
import 'package:test_flutter/screens/download_file/download_file_page.dart';
import 'package:test_flutter/screens/hive/hive_example.dart';
import 'package:test_flutter/screens/localization/localization_page.dart';
import 'package:test_flutter/screens/menu/dropdown_menu.dart';
import 'package:test_flutter/screens/notification/notification_page.dart';
import 'package:test_flutter/screens/progress/progress_page.dart';
import 'package:test_flutter/screens/redux/redux_simple_page.dart';
import 'package:test_flutter/screens/scroll/scroll_view_page.dart';
import 'package:test_flutter/screens/search_list/search_list_page.dart';
import 'package:test_flutter/screens/secure/secure_page.dart';
import 'package:test_flutter/screens/share_app/share_app_page.dart';
import 'package:test_flutter/screens/stream/first_stream_page.dart';
import 'package:test_flutter/screens/stream/second_stream_page.dart';
import 'package:test_flutter/screens/test/test_page.dart';
import 'package:test_flutter/screens/text_field/input_formatters/money_format_page.dart';
import 'package:test_flutter/screens/text_field/pop_up/text_field_with_pop_up.dart';
import 'package:test_flutter/screens/text_field/show_more/show_more_page.dart';
import 'package:test_flutter/screens/text_field/text_field_page.dart';
import 'package:test_flutter/screens/websocket/pages/stomp_client_page.dart';
import 'package:test_flutter/screens/websocket/pages/web_socket_channel_page.dart';
import 'package:test_flutter/screens/websocket/web_socket_page.dart';
import 'main.dart';
import 'screens/animation/screen/my_positioned_transition.dart';
import 'screens/animation/screen/rotate_widget_page.dart';
import 'screens/test/widgets/my_widget_size.dart';

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
    ScrollViewPage.id: (context) => ScrollViewPage(),
    ReduxSimplePage.id: (context) => ReduxSimplePage(),
    DownloadFilePage.id: (context) => DownloadFilePage(),
    DownloadFileByLibPage.id: (context) => DownloadFileByLibPage(),
    NotificationPage.id: (context) => NotificationPage(),
    TextFieldPage.id: (context) => TextFieldPage(),
    TextFieldWithPopUp.id: (context) => TextFieldWithPopUp(),
    DropdownButtonExample.id: (context) => DropdownButtonExample(),
    AnimationPage.id: (context) => AnimationPage(),
    AnimatedContainerApp.id: (context) => AnimatedContainerApp(),
    ShowMorePage.id: (context) => ShowMorePage(),
    BirdCalcPage.id: (context) => BirdCalcPage(),
    SecurePage.id: (context) => SecurePage(),
    BlocMainPage.id: (context) => BlocMainPage(),
    MultiblocProvider.id: (context) => MultiblocProvider(),
    MyBlocProvider.id: (context) => MyBlocProvider(),
    MyIndicatorPage.id: (context) => MyIndicatorPage(),
    MyOverlayWidget.id: (context) => MyOverlayWidget(),
    TestCubitPage.id: (context) => TestCubitPage(),
    BigScreenPage.id: (context) => BigScreenPage(),
    AnimControllerPage.id: (context) => AnimControllerPage(),
    FirstStreamPage.id: (context) => FirstStreamPage(),
    SecondStreamPage.id: (context) => SecondStreamPage(),
    AnimatorPage.id: (context) => AnimatorPage(),
    AnimateByStreamPage.id: (context) => AnimateByStreamPage(),
    MyWidgetSize.id: (context) => MyWidgetSize(title: '',),
    RotateWidgetPage.id: (context) => RotateWidgetPage(),
    MyPositionedTransition.id: (context) => MyPositionedTransition(),
    MySlideTransition.id: (context) => MySlideTransition(),
    MoneyFormatPage.id: (context) => MoneyFormatPage(),
    DifficultUIPage.id: (context) => DifficultUIPage(),
    DividerExamplePage.id: (context) => DividerExamplePage(),
    MyStickyPage.id: (context) => MyStickyPage(),
    HiveExample.id: (context) => HiveExample(),
  };
}
