import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/see_more/description_text_widget.dart';

class SeeMorePage extends StatefulWidget {
  static const id = 'SeeMorePage';

  const SeeMorePage({Key? key}) : super(key: key);

  @override
  _SeeMorePageState createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SeeMorePage'),
        ),
        body: DescriptionTextWidget(text: 'SDFSDFSDFSDFDSDFSDFSDFADFADF DSFASDFASDFASDFASFSFDFSDFDSFDFDfdFdFDfSDf  d fdf d fs df a sdf s df sdf a dsf asd f   s dfa  ds fa sd f '),
      ),
    );
  }
}
