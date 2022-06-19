class Sort {
  static List<int> sort(List<int> array) {
    int temp;
    for (int i = 0; i < array.length; i++) {
      for (int j = i + 1; j < array.length; j++) {
        if (array[i] > array[j]) {
          temp = array[i];
          array[i] = array[j];
          array[j] = temp;
        }
      }
    }
    return array;
  }

  static List<int> sortByDefault(List<int> array) {
    List<int> newList = array;
    newList.sort();
    return newList;
  }

  static List<String> sortTextList(List<String> textList) {
    List<String> newList = textList;
    newList.sort((a, b) => a.length.compareTo(b.length));
    return newList;
  }
}

void main() {
  List<int> myList = [2, 3, 6, 5, 1, 4, -7];
  List<String> textList = ['one', 'two', 'three', 'four'];
  print(Sort.sort(myList)); // [1, 2, 3, 4, 5, 6, 7]
  print(Sort.sortByDefault(myList));
  print(Sort.sortTextList(textList));
}
