import 'package:flutter/material.dart';
import 'package:test_flutter/screens/dificult_ui/screens/divider_example_page.dart';
import 'package:test_flutter/screens/dificult_ui/screens/sliver_tab_page.dart';
import 'package:test_flutter/screens/dificult_ui/screens/sticky_page.dart';

import '../../app_widgets/main_button.dart';
import '../../app_widgets/main_list_widget.dart';

class DifficultUIPage extends StatefulWidget {
  static const id = 'DifficultUIPage';

  const DifficultUIPage({Key? key}) : super(key: key);

  @override
  State<DifficultUIPage> createState() => _DifficultUIPageState();
}

class _DifficultUIPageState extends State<DifficultUIPage> {
  late List<Widget> listBtn;

  @override
  void initState() {
    listBtn = <Widget>[
      btn(context, 'Divider Example', DividerExamplePage.id),
      btn(context, 'Sticky Page', MyStickyPage.id),
      btn(context, 'SliverTab Page', SliverTabPage.id),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DifficultUIPage'),
      ),
      body: MainListWidget(
        listWidget: listBtn,
      ),
    );
  }
}
