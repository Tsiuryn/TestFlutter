void main(){
  List<int> array = [2,3,4,5,-6,1,44];
  print(getMax(array)); // 44
  print(getMin(array)); // -6
}

int getMax (List<int> array){
  int max = array[0];
  for(int i = 0; i< array.length; i++){
    if(array[i] > max){
      max = array[i];
    }
  }
  return max;
}

int getMin (List<int> array){
  int min = array[0];
  for(int i = 0; i< array.length; i++){
    if(array[i] < min){
      min = array[i];
    }
  }
  return min;
}