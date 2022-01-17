import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/screens/bloc/bloc_provider/page_a.dart';

import '../bloc_main_page.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BlocB(),
      child: BlocBuilder<BlocB, BlocBState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Page B',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                    onPressed: () {
                      // context.read<BlocA>().add(TapAEvent());
                      context.read<BlocA>().add(ReceiveTextFromPageBEvent('Hello from PageB - ${getRandom()}'));
                    },
                    child: Text('Send text to Page A')),
                SizedBox(
                  height: 25,
                ),
                Text(_getText(state))
              ],
            ),
          ),
        );
      }),
    );
  }

  String _getText(BlocBState state) {
    if (state is ReceiveTextFromPageAState) {
      return state.text;
    }
    return 'Nothing to show';
  }
}

class BlocB extends Bloc<BlocBEvent, BlocBState> {
  BlocB() : super(InitState()) {
    on<ReceiveTextFromPageAEvent>(_onReceiveTextFromPageAEvent);
  }

  void _onReceiveTextFromPageAEvent(ReceiveTextFromPageAEvent event, Emitter<BlocBState> emit) {
    emit(ReceiveTextFromPageAState(event.text));
  }
}

abstract class BlocBState {}

class InitState implements BlocBState {}

class ReceiveTextFromPageAState implements BlocBState {
  final String text;

  ReceiveTextFromPageAState(this.text);
}

abstract class BlocBEvent {}

class InitEvent implements BlocBEvent {}

class ReceiveTextFromPageAEvent implements BlocBEvent {
  final String text;

  ReceiveTextFromPageAEvent(this.text);
}
