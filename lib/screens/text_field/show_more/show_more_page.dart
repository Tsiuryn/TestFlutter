import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/show_more/widgets/readmore.dart';

class ShowMorePage extends StatefulWidget {
  static const id = 'ShowMorePage';

  const ShowMorePage({Key? key}) : super(key: key);

  @override
  _ShowMorePageState createState() => _ShowMorePageState();
}

class _ShowMorePageState extends State<ShowMorePage> {
  var globalKey = GlobalKey<ReadMoreTextState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Read More Text',
        style: TextStyle(color: Colors.white),
      )),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
          //fontFamily: 'monospace',
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  key: globalKey,
                  trimLines: 2,
                  isShownExpandedText: false,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                ),
              ),
              Divider(
                color: const Color(0xFF167F67),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'Flutter has its own UI components, along with an engine to render them on both the Android and iOS platforms. Most of those UI components, right out of the box, conform to the guidelines of Material Design.',
                  trimLines: 3,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Expand',
                  trimExpandedText: ' Collapse ',
                ),
              ),
              Divider(
                color: const Color(0xFF167F67),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
                  trimLines: 2,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Read more',
                  trimExpandedText: ' Less',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              OutlinedButton(
                onPressed: (){
                  globalKey.currentState?.onTapLink();
                },
                child: Text('Show less'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
