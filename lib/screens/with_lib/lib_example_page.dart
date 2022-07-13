import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/screens/with_lib/quill/quill_example_page.dart';
import 'package:test_flutter/screens/with_lib/quill/quill_example_page.dart';
import 'package:test_flutter/screens/with_lib/quill/quill_example_page.dart';
import 'package:test_flutter/screens/with_lib/slidable/slidable_page.dart';

import 'share_app/share_app_page.dart';

class LibExamplePage extends StatelessWidget {
  static const id = 'LibExamplePage';
  const LibExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: MainListWidget(
        listWidget: _listBtn(context),
      ),
    );
  }
}

_listBtn (BuildContext context) => <Widget>[
btn(context, 'ShareAppPage', ShareAppPage.id),
btn(context, 'SlidablePage', SlidablePage.id),
btn(context, 'QuillExamplePage', QuillExamplePage.id)];