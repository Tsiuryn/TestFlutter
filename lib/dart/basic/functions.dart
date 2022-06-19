void main() {
  // print(getNumber());
  // setData(22, 'Harry');

  Function func = hello;
  func(); // Hello!
  func = bye;
  func(); // Goodbye!

  Function message = getMessage(11);
  message();
  message = getMessage(15);
  message();
}

int getNumber() => 15;

void setData([int? age, String? name]) {
  print('I\'m $age. My name is $name');
}

void hello() {
  print("Hello!");
}

void bye() {
  print("Goodbye!");
}

Function getMessage(int hour) {
  if (hour < 12)
    return morning;
  else
    return evening;
}

void morning() {
  print("Good morning!");
}

void evening() {
  print("Good evening!");
}
