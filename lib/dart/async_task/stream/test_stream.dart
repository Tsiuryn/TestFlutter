import 'dart:async';

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}

class MyStreamTest {
  static final MyStreamTest _singleton = MyStreamTest._internal();

  factory MyStreamTest() {
    return _singleton;
  }

  MyStreamTest._internal();

  void sendData(String data) async {
    await Future.delayed(Duration(seconds: 2));
    _controller.sink.add(data);
  }

  final _controller = StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;
}

late StreamSubscription subscription;

void main() {
  var count = 1;
  // subscription = NumberCreator().stream.listen((event) {
  //   count = event;
  //   print(event);
  //   if(count >= 10){
  //     cancelListen();
  //   }
  // });
  final sumStream = MyStreamTest();
  subscription = sumStream.stream.listen((event) {
    print(event);
    print(DateTime.now());
    cancelListen();
  });

  sumStream.sendData('Hello World ${DateTime.now()}');
}

void cancelListen() {
  subscription.cancel();
  print('Subscription cancel');
}
