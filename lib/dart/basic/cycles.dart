
void main(){
  printInCycle(20);
}

void printInCycle([int from = 0, int to = 10]){
  if(from < to ){
    for(int i = from; i <= to; i ++){
      print('Number $i');
    }
  } else {
    print('it\'s not correct input data');
  }

}