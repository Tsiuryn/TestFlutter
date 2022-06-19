void main() {
  Figure rect = Rectangle(20, 30);
  rect
    ..calculateArea()
    ..calculateSquare();

  getParameters(rect);
}

abstract class Figure {
  void calculateArea() {
    print("Not Implemented");
  }

  calculateSquare(); // abstract method
}

class Rectangle extends Figure {
  int width;
  int height;
  Rectangle(this.width, this.height);

  void calculateArea() {
    int area = width * height;
    print("area = $area");
  }

  @override
  calculateSquare() {
    print('calculateSquare');
  }
}

// Если мы наследуемся от абстрактного класса, мы можем на вход подавать его наследников
void getParameters(Figure figure) {
  figure.calculateSquare();
}
