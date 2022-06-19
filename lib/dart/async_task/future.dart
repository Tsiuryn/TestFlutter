void main() {
  getMessage();
  print("Проверка сообщений...");

  getName();

  print(foo);
}

Future getMessage() {
  // для эмуляции длительной операции делаем задержку в 3 секунды
  return Future.delayed(
      Duration(seconds: 3), () => print("Пришло новое сообщение от Тома"));
}

void getName() async {
  var name = await createName("Sasha");
  print(name);
}

Future<String> createName(String name) {
  return Future.delayed(Duration(seconds: 5), () => name);
}

Stream<int> foo() async* {
  for (int i = 0; i < 42; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
