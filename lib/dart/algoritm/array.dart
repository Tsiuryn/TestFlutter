import 'dart:io';

void main(){
  // print(max(array));
  // print(sortPuzyryok(array));
  print(chooseSort(array));
}

var array = [3, 6, 48, 34, 11, 22, 12, 66, 33, 25, 1, 27, 21];

int max (List<int> array){
  var maxValue = array[0];
  for(int i = 1; i< array.length; i++){
    if(maxValue < array[i]){
      maxValue = array[i];
    }
  }
  return maxValue;
}

int min (List<int> array, int start){
  var index = start;
  var maxValue = array[start];
  for(int i = start + 1; i< array.length; i++){
    if(maxValue > array[i]){
      maxValue = array[i];
      index = i;
    }
  }
  return index;
}

List<int> sortPuzyryok(List<int> array){
  var newList  = array;
  bool isSorted = false;
  while(!isSorted){
    isSorted = true;
    for (int i = 1; i < newList.length; i++){
      if(newList[i] < newList[i - 1]){
        var temp = newList[i];
        newList[i] = newList [i - 1];
        newList [i - 1] = temp;
        isSorted = false;
      }
    }
    print(newList);
  }
  return newList;
}

List<int> chooseSort(List<int> array){
  for (int step = 0; step < array.length; step ++){
    var minIndex = min(array, step);
    int temp = array[step];
    array[step] = array[minIndex];
    array[minIndex] = temp;
  }
  return array;
}

