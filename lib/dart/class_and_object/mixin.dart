void main (){

  Employee bob = Employee("Bob", "Google");
  bob.display();  // Name: Bob
  bob.work();     // Works in Google

  // var work = Worker(); //-- error!
}

/*
  У миксин не должно быть конструктора;
*/

class Person{

  String name;
  Person(this.name);
  void display(){
    print("Name: $name");
  }
}

//В то же время мы можем указать,
// что данный тип будет использоваться только как миксин
// (если мы не планируем использовать его в качестве отдельного класса).
mixin Worker {
// class Worker{
  String company = "";
  void work(){
    print("Work in $company");
  }
}

class Employee extends Person with Worker{

  Employee(name, comp) : super(name){

    company = comp; // обращаемся к полю company, определенному в миксине Worker
  }
}