void main() {
  // var number = '+375224445566';
  var number = '+37522444556611a';
  // var number = '+3752244фыфыыфыфы';
  // printAllSymbols('Project');
  print(isPhoneNumber(number));
}

void printAllSymbols(String text) {
  for (int i = 0; i < text.length; i++) {
    print(text[i]);
  }
}

bool isPhoneNumber(String number) {
  RegExp regExp = RegExp(r"^\+(\d{12})", caseSensitive: false);
  final newNumber = number.replaceAll(' ', '');
  final regExpMatch = regExp.firstMatch(newNumber);
  if (regExpMatch != null) {
    return regExpMatch.group(1)?.length == number.length - 1;
  } else
    return false;
}
