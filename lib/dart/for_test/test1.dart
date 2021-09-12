void main() {
  var person = Person(name: 'Marcus', age: 25, id: '00');
  print('name - ${person.name}, age - ${person.age}, id - ${person.id}');
}

class Person {
  String name;
  int age;
  String id;

  Person({String name = 'Alex', int age = 33, String id}) {
    this.name = name;
    this.age = age;
    this.id = id;
  }
}
