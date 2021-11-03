void main(){
  var person = Person(122);

  print(person.age);
}

class Person{
  int age = 5;

  Person(int age) {
    if(age < 1 || age > 110){
      throw Exception('Недопустимый возраст');
    }else{
      this.age = age;
    }
  }
}