
class Person11 {
  String _name;
  int _age;
  String _id;

  Person11({String name = 'Alex', int age = 33, String id}) {
    this._name = name;
    this._age = age;
    this._id = id;
  }

  String get id => _id;

  int get age => _age;

  String get name => _name;
}
