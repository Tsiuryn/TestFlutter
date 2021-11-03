import 'dart:isolate';

void main(){
  spawnNewIsolate();
}

void spawnNewIsolate() async {

  var receivePort = ReceivePort();

  try {

    var isolate = await Isolate.spawn(newIsolate, receivePort.sendPort);



    receivePort.listen((dynamic receiveData) {
        if(receiveData is SendPort){
          SendPort sendPortOfNewIsolate = receiveData;
          sendPortOfNewIsolate.send('message from main isolate');
        }else{
          print(receiveData.toString());
        }
    });

  } catch (e) {

    print("Error: $e");

  }

}
void newIsolate(SendPort sendPort){
    var receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((dynamic receiveData) {
      print('$receiveData');
      sendPort.send('Say hello from second isolate');
    });

}
