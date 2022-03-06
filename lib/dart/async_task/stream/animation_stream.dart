import 'dart:async';

class AnimationStream<T> {

  void sendData (T data) async{
    _controller.sink.add(data);
  }

  final _controller = StreamController<T>.broadcast();
  Stream<T> get stream => _controller.stream;

  void cancel(){
    _controller.close();
  }
}