void main() {
  List<int> list = [1, 4, 5, 6, 5, 4, 4];
  List<int> list2 = [1, 4, 5, 6, 5, 4, 4];
  List<int> list3 = <int>[]; // empty list, but can added to list
  List list4 = List.empty(); //immutable empty list

  printAllValue(list);
  list.addAll(list2);
  print(list);
}

void printAllValue(List list) {
  for (int n in list) {
    print(n);
  }
}

/*
Основные свойства списков:

first: возвращает первый элемент

last: возвращает последний элемент

length: возвращает длину списка

reversed: возвращает список, в котором все элементы расположены в противоположном порядке

isEmpty: возвращает true, если список пуст

Основные методы списков:

add(E value): добавляет элемент в конец списка

addAll(Iterable<E> iterable): добавляет в конец списка другой список

clear(): удаляет все элементы из списка

indexOf(E element): возвращает первый индекс элемента

insert(int index, E element): вставляет элемент на определенную позицию

remove(Object value): удаляет объект из списка (удаляется только первое вхождение элемена в список)

removeAt(int index): удаляет элементы по индексу

removeLast(): удаляет последний элемент списка

forEach(void f(E element)): производит над элементами списка некоторое действие, которое задается функцией-параметром, аналоги цикла for..in

sort(): сортирует список

sublist(int start, [ int end ]): возвращает часть списка от индекса start до индекса end

contains(Object element): возвращает true, если элемент содержится в списке

join([String separator = "" ]): объединяет все элементы списка в строку. Можно указать необязательный параметр separator, который будет раздлять элементы в строке

skip(int count): возвращает коллекцию, в которой отсутствуют первые count элементов

take(int count): возвращает коллекцию, которая содержит первые count элементов

where(bool test(E element)): возвращает коллекцию, элементы которой соответствуют некоторому условию, которое передается в виде функции
 */
