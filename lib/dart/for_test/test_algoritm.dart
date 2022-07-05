import 'dart:math';

void main() {
  List<int> array = _createListRandom(max: 200, min: -500, count: 1000);
  print(array.contains(200));
  _getMin(array);
  // _sortBubble(array);
  _sortByReplace(array);
  // print(_fiboNumber(70));
}

int _getMin(List<int> array) {
  if (array.isEmpty) {
    throw ('List can not be empty');
  }
  var min = array[0];
  for (int i = 0; i < array.length; i++) {
    if (min > array[i]) {
      min = array[i];
    }
  }
  print('min - $min');
  return min;
}

List<int> _createListRandom(
    {required int max, required int min, required int count}) {
  var list = <int>[];
  for (int i = 0; i <= count; i++) {
    var random = Random().nextInt(max + 1 - min) + min;
    list.add(random);
  }
  // print(list);
  return list;
}

List<int> _sortBubble(List<int> array) {
  if (array.isEmpty) {
    throw ('List can not be empty');
  }
  bool isSorted = false;
  while (!isSorted) {
    isSorted = true;
    for (int i = 1; i < array.length; i++) {
      if (array[i - 1] > array[i]) {
        var temp = array[i];
        array[i] = array[i - 1];
        array[i - 1] = temp;
        isSorted = false;
      }
    }
  }
  print(array);
  return array;
}

int _getMinIndexWithStep(List<int> array, int start) {
  if (start < 0 || start >= array.length) {
    throw ('Illegal arguments');
  }
  var index = start;
  var min = array[start];
  for (int i = start; i < array.length; i++) {
    if (min > array[i]) {
      min = array[i];
      index = i;
    }
  }
  // print(index);
  return index;
}

List<int> _sortByReplace(List<int> array) {
  if (array.isEmpty) {
    throw ('List can not be empty');
  }
  for (int i = 0; i < array.length; i++) {
    var indexMin = _getMinIndexWithStep(array, i);
    var temp = array[indexMin];
    array[indexMin] = array[i];
    array[i] = temp;
  }
  print(array);
  return array;
}

int _fiboNumber(int numb) {
  if (numb < 2) {
    return numb;
  }
  var list = <int>[];
  list.add(0);
  list.add(1);
  for (int i = 2; i <= numb; i++) {
    list.add(list[i - 2] + list[i - 1]);
  }
  print(list);
  return list[numb - 1];
}
