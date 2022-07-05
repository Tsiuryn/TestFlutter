import 'dart:ffi';
import 'dart:io';

import 'dart:math';

void main() {
  // print(max(array));
  // print(sortPuzyryok(array));
  // print(chooseSort(array));
  // print(deleteDublicate(array));
  // print(getUniqNumber(array));
  // print(reverseArray(array));
  print(getMaxUniqArrayLength(createList(20)));
}

var array = [3, 3, 6, 48, 1, 27, 48, 34, 11, 22, 12, 66, 33, 25, 1, 21, 21];

int max(List<int> array) {
  var maxValue = array[0];
  for (int i = 1; i < array.length; i++) {
    if (maxValue < array[i]) {
      maxValue = array[i];
    }
  }
  return maxValue;
}

List<int> createList(int length) {
  var list = <int>[];
  for (int i = 0; i < length; i++) {
    list.add(Random().nextInt(5));
  }
  return list;
}

int min(List<int> array, int start) {
  var index = start;
  var maxValue = array[start];
  for (int i = start + 1; i < array.length; i++) {
    if (maxValue > array[i]) {
      maxValue = array[i];
      index = i;
    }
  }
  return index;
}

List<int> sortPuzyryok(List<int> array) {
  var newList = array;
  bool isSorted = false;
  while (!isSorted) {
    isSorted = true;
    for (int i = 1; i < newList.length; i++) {
      if (newList[i] < newList[i - 1]) {
        var temp = newList[i];
        newList[i] = newList[i - 1];
        newList[i - 1] = temp;
        isSorted = false;
      }
    }
    print(newList);
  }
  return newList;
}

List<int> chooseSort(List<int> array) {
  for (int step = 0; step < array.length; step++) {
    var minIndex = min(array, step);
    int temp = array[step];
    array[step] = array[minIndex];
    array[minIndex] = temp;
  }
  return array;
}

//найти уникальные числа - O(n)
List<int> getUniqNumber(List<int> array) {
  var uniqNumberList = <int>[];
  for (int i = 0; i < array.length; i++) {
    var element = array[i];
    if (uniqNumberList.contains(element)) {
      uniqNumberList.remove(element);
    } else {
      uniqNumberList.add(element);
    }
  }
  return uniqNumberList;
}

//удалить дубликаты сложность - O(n)
List<int> deleteDublicate(List<int> array) {
  var withoutDublicate = <int>[];
  for (int i = 0; i < array.length; i++) {
    var element = array[i];
    if (i == array.indexOf(element)) {
      withoutDublicate.add(element);
    }
  }
  return withoutDublicate;
}

//развернуть массив
List<int> reverseArray(List<int> array) {
  var reversedArray = <int>[];
  for (int i = array.length - 1; i >= 0; i--) {
    reversedArray.add(array[i]);
  }
  return reversedArray;
}

// 1 2 3 4 2 3 2
//длина максимального непрерывного подмассива,
// в котором нет повторяющихся элементов
int getMaxUniqArrayLength(List<int> array) {
  List<int> firstArray = [];
  List<int> maxLength = [];
  for (int i = 0; i < array.length; i++) {
    var element = array[i];
    if (firstArray.isEmpty || !firstArray.contains(element)) {
      firstArray.add(element);
    } else {
      maxLength.add(firstArray.length);
      firstArray.clear();
      firstArray.add(element);
    }
    if (i == array.length - 1) {
      maxLength.add(firstArray.length);
    }
  }
  var max = maxLength[0];
  for (int i = 0; i < maxLength.length; i++) {
    if (maxLength[i] > max) {
      max = maxLength[i];
    }
  }
  print(array);

  return max;
}
