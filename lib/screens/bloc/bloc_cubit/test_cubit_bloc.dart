import 'package:bloc/bloc.dart';

class TestCubitBloc extends Cubit<TestCubitModel> {
  TestCubitBloc() : super(TestCubitModel.empty());

  void increment() {
    var nextPage = state.page + 1;
    emit(state.copyWith(page: nextPage));
  }

  void decrement() {
    var previousPage = state.page - 1;
    emit(state.copyWith(page: previousPage));
  }
}

class TestCubitModel {
  final int page;

  TestCubitModel({required this.page});

  TestCubitModel.empty() : page = 0;

  TestCubitModel copyWith({
    int? page,
  }) {
    return TestCubitModel(
      page: page ?? this.page,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestCubitModel && runtimeType == other.runtimeType && page == other.page;

  @override
  int get hashCode => page.hashCode;
}
