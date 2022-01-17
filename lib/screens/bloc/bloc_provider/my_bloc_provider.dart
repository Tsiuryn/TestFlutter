
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/page_a.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/page_b.dart';

class MyBlocProvider extends StatelessWidget {
  static const id = 'MyBlocProvider';

  const MyBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyBlocProvider'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Column(
            children: [
              Expanded(child: PageA()),
              Expanded(child: PageB()),
            ],
          ),
          RotatedBox(quarterTurns: -45,child: Text('BlocProvider', style: TextStyle(fontSize: 55, color: Colors.black,),)),


        ],
      ),
    );
  }
}
