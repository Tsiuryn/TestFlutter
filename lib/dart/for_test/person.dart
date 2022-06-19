class Person11 {
  String _name;
  int _age;
  String _id;

  Person11({String? name, int? age, required String id})
      : this._name = name ?? 'Alex',
        this._age = age ?? 33,
        this._id = id;

  String get id => _id;

  int get age => _age;

  String get name => _name;
}
