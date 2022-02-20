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

class StreamTest11 <T>{


  void sendData (T data) async{
    await Future.delayed(Duration(seconds: 2));
    _controller.sink.add(data);
  }

  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;
}

late StreamSubscription  subscription;

void main(){
  var count = 1;
  // subscription = NumberCreator().stream.listen((event) {
  //   count = event;
  //   print(event);
  //   if(count >= 10){
  //     cancelListen();
  //   }
  // });
  final sumStream = StreamTest11<String>();
  subscription = sumStream.stream.listen((event) {
    print(event);
    print(DateTime.now());
    cancelListen();
  });

  sumStream.sendData('Hello World ${DateTime.now()}');

}

void cancelListen(){
  subscription.cancel();
  print('Subscription cancel');
}