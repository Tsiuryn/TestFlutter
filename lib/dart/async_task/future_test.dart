void main() async{
_taskYandex();
}

//записать порядок выполнения кода
void _taskYandex()async{
  print('A');
  await Future((){
    print('B');
    Future((){print('C');});
    Future.microtask((){print('D');});
    Future((){print('E');});
    print('F');
  });
  print('G');
}

