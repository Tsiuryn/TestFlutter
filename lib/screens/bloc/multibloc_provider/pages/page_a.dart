import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/screens/bloc/bloc_main_page.dart';
import 'package:test_flutter/screens/bloc/multibloc_provider/pages/page_b.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocA, BlocAState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.green,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Page A', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                SizedBox(height: 50,),
                OutlinedButton(onPressed: (){
                  // context.read<BlocA>().add(TapAEvent());
                  context.read<BlocB>().add(ReceiveTextFromPageAEvent('Hello from PageA - ${getRandom()}'));


                }, child: Text('Send text to Page B')),
                SizedBox(height: 25,),
                Text(_getText(state))
              ],
            ),
          ),
        );
      }
    );
  }

  String _getText (BlocAState state){
    if(state is ReceiveTextFromPageBState){
      return state.text;
    }
    return 'Nothing to show';

  }
}

class BlocA extends Bloc<BlocAEvent, BlocAState>{

  BlocA() : super(InitState()){
    on<TapAEvent>(_onTapAEvent);
    on<ReceiveTextFromPageBEvent>(_onReceiveTextFromPageBEvent);

  }

  void _onTapAEvent(
      TapAEvent event,
      Emitter<BlocAState> emit
      ){
    emit(SendAToBState());
  }

  void _onReceiveTextFromPageBEvent(
      ReceiveTextFromPageBEvent event,
      Emitter<BlocAState> emit
      ){
    emit(ReceiveTextFromPageBState(event.text));
  }
}

abstract class BlocAState{}
class InitState implements BlocAState{}
class SendAToBState implements BlocAState{}
class ReceiveTextFromPageBState implements BlocAState{
  final String text;

  ReceiveTextFromPageBState(this.text);
}

abstract class BlocAEvent{}
class InitEvent implements BlocAEvent{}
class TapAEvent implements BlocAEvent{}
class ReceiveTextFromPageBEvent implements BlocAEvent{
  final String text;
  ReceiveTextFromPageBEvent(this.text);
}
