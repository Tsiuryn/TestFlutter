void main() {
  Person bob = Person("324", "Jack");
  print(bob.id.runtimeType); // String
  Person sam = Person(123, "Sam");
  print(sam.id.runtimeType); // int

  log('Tom');

  var acc = DemandAccount(150, 1, 20);
  var acc2 = DemandAccount(250, 150, 30);
  var transaction = Transaction(acc2, acc, acc.sum);
  transaction.execute();
}

class Person<T> {
  T id; // идентификатор пользователя
  String name; // имя пользователя
  Person(this.id, this.name);
}

void log<T>(T a) {
  // DateTime.now() - получает текущую дату и время
  print("${DateTime.now()} a=$a");
}

class Account {
  int id; // номер счета
  int sum; // сумма на счете
  Account(this.id, this.sum);
}

// С помощью выражения <T extends Account> указываем,
// что используемый тип T обязательно должен быть классом Account или его наследником.
// Благодаря подобному ограничению мы можем использовать внутри класса Transaction все объекты типа T
// именно как объекты Account и соответственно обращаться к их полям и методам.
class Transaction<T extends Account> {
  T fromAccount; // с какого счета перевод
  T toAccount; // на какой счет перевод
  int sum; // сумма перевода
  Transaction(this.fromAccount, this.toAccount, this.sum);
  void execute() {
    if (fromAccount.sum > sum) {
      fromAccount.sum -= sum;
      toAccount.sum += sum;
      print(
          "Счет ${fromAccount.id}: ${fromAccount.sum}\$ \nСчет ${toAccount.id}: ${toAccount.sum}\$");
    } else {
      print("Недостаточно денег на счете ${fromAccount.id}");
    }
  }
}

class DemandAccount extends Account {
  int amount;

  DemandAccount(int id, int sum, this.amount) : super(id, sum);
}
