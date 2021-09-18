import 'dart:math';

void main() {
  // "Mama".runes.forEach((element) {
  //   print(String.fromCharCode(element));
  // });

  print(Calculator.decide('2+3^4'));

}

class Calculator {

  static double decide(String expr){
    String prepared = _preparedExpression(expr);
    return _calculateRPN(_expressionToRPN(prepared));
  }

  static String _preparedExpression(String expr){
    String prepared = '';
    var runes = expr.runes.toList(growable: false);
    for(int i = 0; i<runes.length; i++){
      var symbol = String.fromCharCode(runes[i]);
      if(symbol == '-'){
        if(i == 0){
          prepared += '0';
        }else if((String.fromCharCode(runes[i-1])) == '('){
          prepared += '0';
        }
      }
      prepared += symbol;
    }
    return prepared;
  }

  static List<String> _expressionToRPN(String expr) {
    String current = '';
    List<String> returnList = List.empty(growable: true);

    int priority;
    List<String> stack = List.empty(growable: true);
    expr.runes.forEach((element) {
      String symbol = String.fromCharCode(element);
      priority = _getPriority(symbol);

      if (priority == 0) current += symbol;
      if (priority == 1) stack.push(symbol);

      if (priority > 1) {
        returnList.put(current);
        current = '';
        while (stack.isNotEmpty) {
          if (_getPriority(stack.peek()) >= priority) {
            returnList.put(stack.pop());
          } else
            break;
        }
        stack.push(symbol);
      }

      if (priority == -1) {
        returnList.put(current);
        current = '';
        while (_getPriority(stack.peek()) != 1) {
          returnList.put(stack.pop());
        }
        stack.pop();
      }
    });
    returnList.put(current);
    while (stack.isNotEmpty) {
      returnList.put(stack.pop());
    }

    return returnList;
  }

  static double _calculateRPN(List<String> rpn) {
    List<double> stack = List.empty(growable: true);
    for (int i = 0; i < rpn.length; i++) {
      if (_getPriority(rpn[i]) == 0) {
        stack.push(double.parse(rpn[i]));
      }

      if (_getPriority(rpn[i]) > 1) {
        double b = stack.pop();
        double a = stack.pop();

        if (rpn[i] == '+') stack.push(a + b);
        if (rpn[i] == '-') stack.push(a - b);
        if (rpn[i] == '*') stack.push(a * b);
        if (rpn[i] == '/') stack.push(a / b);
        if (rpn[i] == '^') stack.push(pow(a, b) );
      }
    }
    return stack.pop();
  }

  static int _getPriority(String token) {
    switch (token) {
      case '^':
      case '/':
      case '*':
        return 3;
        break;
      case '+':
      case '-':
        return 2;
        break;
      case '(':
        return 1;
        break;
      case ')':
        return -1;
        break;
      default:
        return 0;
    }
  }
}

extension ListStack on List {
  void push<T>(T char) {
    this.insert(0, char);
  }

  void put(String char) {
    if (char.isNotEmpty) {
      this.add(char);
    }
  }

  T pop<T>() {
    T symb = this[0];
    if (this.length > 0) {
      this.removeAt(0);
    }
    return symb;
  }

  String peek() {
    if (this.length > 0) {
      return this[0];
    } else
      return '';
  }
}
