void main() {
  // var one = SingletonOne();
  // SingletonThree three = SingletonThree.instance;
  //
  // Application myApp1 = Application("Internet Browser");
  // Application myApp2 = Application("Internet Browser 2");
  // myApp2.about();

  var app = MyApp('Hello', '12', 35);
  var app1 = MyApp('Hello', '12', 34);
  print(app == app1);
}

class MyApp {
  final name;
  final id;
  final age;

  MyApp(this.name, this.id, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyApp &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ age.hashCode;
}
