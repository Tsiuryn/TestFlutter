import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_flutter/app_widgets/main_button.dart';
import 'package:test_flutter/app_widgets/main_list_widget.dart';
import 'package:test_flutter/screens/bloc/bloc_cubit/test_cubit_page.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/my_bloc_provider.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/multi_bloc_provider.dart';

class BlocMainPage extends StatefulWidget {
  static const id = 'BlocMainPage';

  const BlocMainPage({Key? key}) : super(key: key);

  @override
  _BlocMainPageState createState() => _BlocMainPageState();
}

class _BlocMainPageState extends State<BlocMainPage> {

  List<Widget> _createListBtn(BuildContext context){
    return <Widget>[
      btn(context, 'Bloc provider', MyBlocProvider.id),
      btn(context, 'Multi bloc Provider', MultiblocProvider.id),
      btn(context, 'Bloc cubit', TestCubitPage.id),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocMainPage'),
      ),
      body: Center(
        child: MainListWidget(
          listWidget: _createListBtn(context),
        )
      ),
    );
  }
}

int getRandom() {
  var ran = Random();
  return ran.nextInt(100);
}
