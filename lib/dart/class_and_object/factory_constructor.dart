void main() {}

class Application {
  String name;
  static Application app = Application._fromName("");

  Application._fromName(this.name);

  factory Application(String name) {
    if (app.name == "") {
      app = Application._fromName(name);
      print("Приложение $name запущено");
    } else {
      // в фабричных конструкторах нельзя обращаться к this
      // print("В приложении ${this.name} открыта новая вкладка");
      print("В приложении ${app.name} открыта новая вкладка");
    }
    return app;
  }
  void about() {
    print("Приложение $name");
  }
}
