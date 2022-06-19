import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/screens/bloc/bloc_cubit/test_cubit_bloc.dart';

class TestCubitPage extends StatefulWidget {
  static const id = 'TestCubit';

  TestCubitPage({Key? key}) : super(key: key);

  @override
  State<TestCubitPage> createState() => _TestCubitPageState();
}

class _TestCubitPageState extends State<TestCubitPage> {
  late TestCubitBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = TestCubitBloc();
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<TestCubitBloc, TestCubitModel>(
        builder: (context, state) => buildBody(context: context, state: state),
      ),
    );
  }

  Widget buildBody({
    required BuildContext context,
    required TestCubitModel state,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestCubit'),
      ),
      body: Center(
        child: Text('Страница ${state.page}'),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'First',
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
              onPressed: () {
                _bloc.increment();
              }),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: 'Second',
              child: Icon(Icons.remove),
              backgroundColor: Colors.blue,
              onPressed: () {
                _bloc.decrement();
              }),
        ],
      ),
    );
  }
}
