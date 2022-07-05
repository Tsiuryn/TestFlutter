void main() {
  var pers = Person("Tom", 22);

  pers.persPrint();
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

extension PersonPrint on Person {
  void persPrint() {
    print('My name is ${this.name}. I\'m $age');
  }
}
