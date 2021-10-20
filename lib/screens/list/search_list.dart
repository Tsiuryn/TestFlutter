import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  static String id = 'ListSearch';

  const ListSearch({Key key}) : super(key: key);

  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListSearch'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
    );
  }

  List<Person> createListPerson() {
    List<Person> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(Person('name $i', i));
    }
    return list;
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? [Person('name', 22)] : createListPerson().where((element) => element.name.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
    onTap: (){
      showResults(context);
    },
        leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].name.substring(0, query.length),
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                children: [TextSpan(text: suggestionList[index].name.substring(query.length), style: TextStyle(color: Colors.grey))])),
        subtitle: Text(suggestionList[index].id.toString()),
      ),
      itemCount: suggestionList.length,
    );
  }

  List<Person> createListPerson() {
    List<Person> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(Person('name $i', i));
    }
    return list;
  }
}

class Person {
  String name;
  int id;

  Person(this.name, this.id);
}
