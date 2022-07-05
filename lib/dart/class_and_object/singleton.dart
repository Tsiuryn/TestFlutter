class SingletonOne {
  SingletonOne._privateConstructor();

  static final SingletonOne _instance = SingletonOne._privateConstructor();

  factory SingletonOne() {
    return _instance;
  }
}

class SingletonTwo {
  SingletonTwo._privateConstructor();

  static final SingletonTwo _instance = SingletonTwo._privateConstructor();

  static SingletonTwo get instance => _instance;
}

class SingletonThree {
  SingletonThree._privateConstructor();

  static final SingletonThree instance = SingletonThree._privateConstructor();
}
