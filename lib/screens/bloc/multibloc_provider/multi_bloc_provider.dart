import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/pages/page_a.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/pages/page_b.dart';

class MultiblocProvider extends StatelessWidget {
  static const id = 'MultiblocProvider';

  const MultiblocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocA>(
            create: (BuildContext context) => BlocA(),
          ),
          BlocProvider<BlocB>(
            create: (BuildContext context) => BlocB(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('MultiblocProvider'),
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
              RotatedBox(quarterTurns: -45,child: Text('Multibloc provider', style: TextStyle(fontSize: 55, color: Colors.black,),)),


            ],
          ),
        ));
  }
}
