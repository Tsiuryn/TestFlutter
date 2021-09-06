void main (){

  Person bob = Employee();
  bob.name = "Bob";
  bob.display();  // Employee name: Bob
}

class Person{

  String name;
  Person(this.name);

  void display(){
    print("Name: $name");
  }
}

class Employee implements Person{

  String name = "";           // реализация поля name
  // реализация метода display
  void display(){
    print("Employee name: $name");
  }
}