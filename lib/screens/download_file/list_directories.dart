import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ListFiles extends StatefulWidget {
  static const id = 'ListFiles';
  const ListFiles({Key key}) : super(key: key);

  @override
  _ListFilesState createState() => _ListFilesState();
}

class _ListFilesState extends State<ListFiles> {


//Declare Globaly
  String directory;
  List file = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listofFiles();
  }

// Make New Function
  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      file = io.Directory("$directory/resume/").listSync(); //use your folder name insted of resume.
    });
  }

// Build Part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get List of Files with whole Path"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // your Content if there
            Expanded(
              child: ListView.builder(
                  itemCount: file.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(file[index].toString());
                  }),
            )
          ],
        ),
      ),
    );
  }
}