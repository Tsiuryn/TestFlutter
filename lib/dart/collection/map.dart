void main (){

  var map = { 5 : "Tom"};
  map[1] = "Alice";
  map[44] = "Bob";
  map[6] = "Sam";

  // перебор всех элементов
  print("All items");
  for(var item in map.entries){
    // item представляет MapEntry<K, V>
    print("${item.key} - ${item.value}");
  }

  // перебор ключей
  print("Keys");
  for(var key in map.keys){

    print(key);
  }

  // перебор значений
  print("Values");
  for(var value in map.values){

    print(value);
  }
}

/*
Основные методы Map:

addAll(Map<K, V> other): добавляет в Map другой объект Map

addEntries(Iterable<MapEntry<K, V>> newEntries): добавляет в Map коллекцию Iterable<MapEntry<K, V>>

clear(): удаляет все элементы из Map

containsKey(Object key): возвращает true, если Map содержит ключ key

containsValue(Object value): возвращает true, если Map содержит значение value

remove(Object key): удаляет из Map элемент с ключом key
 */