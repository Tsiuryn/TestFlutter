import 'package:test_flutter/screens/calculator/utils/rpn/reverse_polish_notation.dart';
import 'package:test_flutter/screens/calculator/utils/string_extension.dart';

void main() {
  print(composeEquation('5488√68884-68884+688884×648888'));
}

String composeEquation(String equation){
  var updatedEquation = equation.replaceAll(' ', '');
  var listNumbers = _getListNumbers(updatedEquation);
  for(int i = 0; i < listNumbers.length; i++){
    if(listNumbers[i].isNotEmpty){
      var replacement = _addSpaces(listNumbers[i]);
      updatedEquation = updatedEquation.replaceFirst(listNumbers[i], replacement);
    }
  }
  return updatedEquation;
}

String _addSpaces(String number) {
  var count = 0;
  var numberWithSpaces = '';
  var idComma = number.indexOf(',');

  for (int i = number.length - 1; i >= 0; i--) {
    if (idComma == -1 || i < idComma) count += 1;
    numberWithSpaces += number[i];
    if (count % 3 == 0 && i != 0) {
      if (idComma == -1) {
        numberWithSpaces += ' ';
      } else if (i < idComma) {
        numberWithSpaces += ' ';
      }
      count = 0;
    }
  }
  return numberWithSpaces.reverse();
}

List<String> _getListNumbers (String equation){
  var regExp = RegExp(r"[+ \- × ÷ ( ) √ ^ %]", caseSensitive: false);
  return equation.split(regExp);
}

double getResult(String equation){
  var result = 0.0;
  try{
    result = Calculator.decide(_prepareTextToCalculate(equation));
  } catch (e){

  }
  return result;
}

String _prepareTextToCalculate(String equation){
  return equation.replaceAll(' ', '').replaceAll('cos', 'c').replaceAll('sin', 's').replaceAll('tan', 't').replaceAll(',', '.');
}
