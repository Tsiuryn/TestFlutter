final List<int> example = [1, 2, 3, 4, 5, 6];

const myId = 5;

void main() {
  var state = MyState(example);

  for (var i = 0; i < state.person.length; ++i) {
    var o = state.person[i];
    if (o == myId) {
      state.person[i] = 77;
    }
  }

  print(state.person);
}

class MyState {
  final List<int> person;

  MyState(this.person);
}
