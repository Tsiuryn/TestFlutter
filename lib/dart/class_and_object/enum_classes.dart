void main() {
  print(Operation.values);
  print(Operation.device.index);



  String app = "MyApp";
  print(app.codeUnits);
  var list = app.codeUnits;
  var newText = '';
  for(int i = 0; i < list.length; i++){
    var char = String.fromCharCode(list[i]);
    if(char == 'p') continue;
    newText += char;
  }
  print(newText);

}

enum Operation { add, multiply, device, subtract }
