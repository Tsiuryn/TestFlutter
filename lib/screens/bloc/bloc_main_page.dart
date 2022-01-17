import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/my_bloc_provider.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/multi_bloc_provider.dart';

class BlocMainPage extends StatefulWidget {
  static const id = 'BlocMainPage';

  const BlocMainPage({Key? key}) : super(key: key);

  @override
  _BlocMainPageState createState() => _BlocMainPageState();
}

class _BlocMainPageState extends State<BlocMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocMainPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, MyBlocProvider.id);
            }, child: Text('Bloc provider')),
            SizedBox(height: 50,),
            OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, MultiblocProvider.id);
            }, child: Text('MultiblocProvider')),


          ],
        ),
      ),
    );
  }
}

int getRandom() {
  var ran = Random();
  return ran.nextInt(100);
}
