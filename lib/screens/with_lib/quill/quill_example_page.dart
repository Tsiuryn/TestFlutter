
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class QuillExamplePage extends StatefulWidget {
  static const id = 'QuillExamplePage';
  const QuillExamplePage({Key? key}) : super(key: key);

  @override
  State<QuillExamplePage> createState() => _QuillExamplePageState();
}

class _QuillExamplePageState extends State<QuillExamplePage> {
  late QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('QuillExamplePage'),),
        body: Column(
          children: [
            QuillToolbar.basic(controller: _controller, showImageButton: false,
              showVideoButton : false, ),
            Expanded(child: QuillEditor.basic(controller: _controller, readOnly: false)),
          ],
        ),
      ),
    );
  }
}
