void main(){
  // printSwitch(8);
  // printNumber(8);
  ternarOperation();
}

void printSwitch([int? num]){
  int output = 0;
  switch(num){

    case 1:
      output = 3;
      break;
    case 2:
    case 3:
    case 4:
      output = 6;
      break;
    case 5:
      output = 12;
      break;
    default:
      output = 24;
  }
  print(output);
}

void printNumber([int num = 55]){
  switch(num){

    case 1:
      print("число равно 1");
      break;
    case 8:
      print("число равно 8");
      num++;
      continue N9;    // переход на метку N9
    N9: case 9:
      print("число равно 9");
      break;
    default:
      print("число не равно 1, 8, 9");
  }
}

void ternarOperation (){
  int x=3;
  int y=2;
  int z = x<y? (x+y) : (x-y);
  print(z);
}