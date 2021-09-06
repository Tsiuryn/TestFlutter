void main (){

  var set = {-3, -1, 2, 4, 5, 7};
  // получим первый элемент
  print(set.first);   // -3
  // получим последний элемент
  print(set.last);    // 7
  // получим длина набора
  print(set.length);  // 6

  // добавим набор
  set.addAll({4, 2, 6});

  // соединим элементы списка в строку, разделитель запятая
  print(set.join(", "));  // -3, -1, 2, 4, 5, 7, 6

  // удалим число 4
  set.remove(4);

  print(set.join(", "));  // -3, -1, 2, 5, 7, 6

  // получим элементы больше  2
  set = set.where((element) => element > 2).toSet();
  print(set.join(", "));  // 5, 6, 7
}

/*
    Свойства и методы класса Set
Основные свойства наборов:

first: возвращает первый элемент

last: возвращает последний элемент

length: возвращает длину набора

isEmpty: возвращает true, если набор пуст

Основные методы наборов:

add(E value): добавляет элемент в набор

addAll(Iterable<E> iterable): добавляет в набор другую коллекцию

clear(): удаляет все элементы из набора

difference(Set<Object> other): возвращает разность текущего набора и набора other в виде другого набора

intersection(Set<Object> other): возвращает пересечение текущего набора и набора other в виде другого набора

remove(Object value): удаляет объект из набора

removeAll(Iterable<Object> elements): удаляет из набора все элементы коллекции elements

union(Set<E&g; other): возвращает объединение двух наборов - текущего и набора other

contains(Object element): возвращает true, если элемент содержится в наборе

join([String separator = "" ]): объединяет все элементы набора в строку. Можно указать необязательный параметр separator, который будет раздлять элементы в строке

skip(int count): возвращает коллекцию, в которой отсутствуют первые count элементов

take(int count): возвращает коллекцию, которая содержит первые count элементов

where(bool test(E element)): возвращает коллекцию, элементы которой соответствуют некоторому условию, которое передается в виде функции


 */