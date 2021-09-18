import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstraintPage extends StatefulWidget {
  static const String id = 'constraint_page';

  @override
  _ConstraintPageState createState() => _ConstraintPageState();
}

class _ConstraintPageState extends State<ConstraintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constraint Page'),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/constraint/movie_banner.png'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      'Blade Runner 2049',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Director: ',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Denis Villeneuve',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 16, top: 4),
                child: Image(
                  image: AssetImage('assets/constraint/poster.jpeg'),
                  width: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              'Young Blade Runner K\'s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who\'s been missing for thirty years.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, left: 16),
                child: Text(
                  'Actors',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 4,
                runSpacing: 4,
                children: [
                  _createDirector('Harrison Ford'),
                  _createDirector('Ryan Gosling'),
                  _createDirector('Ana de Armas'),
                  _createDirector('Dave Bautista'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                onPressed: () {},
                title: 'Like',
              ),
              MyButton(
                onPressed: () {},
                title: 'Watch',
              ),
              MyButton(
                onPressed: () {},
                title: 'Share',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _createDirector(String name) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(4)),
      child: Text(name),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  MyButton({this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: MaterialButton(
        child: Text(title),
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
