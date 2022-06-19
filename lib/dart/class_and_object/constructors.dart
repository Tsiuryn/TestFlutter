import 'class_with_private_parametr.dart';

void main() {
  Person bob = Person.undefined(); // вызов первого конструктора без параметров
  bob.display();

  Person tom =
      Person.fromName("Tom"); // вызов второго конструктора с одним параметром
  tom.display();

  Person sam =
      Person("Sam", 25); // вызов третьего конструктора с двумя параметрами
  sam.display();

  People(userAge: 33);

  // каскадная инициализация
  var company = Company()
    ..title = "Hello"
    ..country = "Canada";

  print(company.country);

  var myPhone = Phone(cpu: 'Mali');
  print('${myPhone.companyName} ${myPhone.cpu}');
}

class Person {
  String name = "";
  int age = 0;

  Person.undefined() {
    name = "undefined";
    age = 18;
  }

  Person.fromName(String n) {
    name = n;
    age = 18;
  }

  Person(String n, int a) {
    name = n;
    age = a;
  }

  void display() {
    print("Name: $name Age: $age");
  }
}

class Human {
  String name = "";
  int age = 0;

  Human.undefined()
      : this("undefined", 18); // этот конструктор вызывает дефолтный - 3-й

  Human.fromName(String name)
      : this(name, 18); // этот конструктор вызывает дефолтный - 3-й

  Human(this.name, this.age);

  void display() {
    print("Name: $name Age: $age");
  }
}

//Инициализаторы:
class People {
  String name = "";
  int age = 0;

  People({String userName = "default", int userAge = 22})
      : name = userName,
        age = userAge {
    print("People ctor!");
  }

  void display() {
    print("Name: $name Age: $age");
  }
}

//Каскадная инициализация
class Company {
  String title = "";
  String country = "";

  payTaxes() {
    print("Компания $title платит налоги \n");
  }
}
