import 'dart:isolate';

void main() {
  spawnNewIsolate();
}

void spawnNewIsolate() async {
  var receivePort = ReceivePort();

  try {
    Isolate isolate = await Isolate.spawn(newIsolate, receivePort.sendPort);

    receivePort.listen((dynamic receiveData) {
      if (receiveData is SendPort) {
        SendPort sendPortOfNewIsolate = receiveData;
        sendPortOfNewIsolate.send(MyTestObject('Hello'));
      } else {
        print(receiveData.toString());
      }
    });
  } catch (e) {
    print("Error: $e");
  }
}

void newIsolate(SendPort sendPort) {
  var receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((dynamic receiveData) {
    if (receiveData is MyTestObject) {
      print(receiveData.message);
    }

    sendPort.send('Say hello from second isolate');
  });
}

class MyTestObject {
  final String message;
  MyTestObject(this.message);
}
