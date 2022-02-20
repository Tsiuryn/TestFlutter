import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigScreenPage extends StatefulWidget {
  static const id = 'BigScreenPage';
  const BigScreenPage({Key? key}) : super(key: key);

  @override
  _BigScreenPageState createState() => _BigScreenPageState();
}

class _BigScreenPageState extends State<BigScreenPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('BigScreenPage'),
      ),
      body: height > width ? _buildPortraitOrient(context): _buildLandOrient(context),
    );
  }

  Widget _buildPortraitOrient(BuildContext context){
    return Column(
      children: [
        _buildBox(),
        _buildBox(),
      ],
    );
  }

  Widget _buildLandOrient(BuildContext context){
    return Row(
      children: [
        _buildBox(),
        _buildBox(),
        _buildBox(),
      ],
    );
  }

  Widget _buildBox(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.blue,
            child: Center(child: Icon(Icons.exposure)),
        ),
      ),
    );
  }
}
