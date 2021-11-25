import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/pop_up/documents_text_field.dart';
import 'package:test_flutter/screens/text_field/pop_up/widgets/textfield_search.dart';

class TextFieldWithPopUp extends StatefulWidget {
  static const id = 'TextFieldWithPopUp';

  const TextFieldWithPopUp({Key? key}) : super(key: key);

  @override
  _TextFieldWithPopUpState createState() => _TextFieldWithPopUpState();
}

class _TextFieldWithPopUpState extends State<TextFieldWithPopUp> {
  var controller = TextEditingController();

  late String country_id;
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('TextFieldWithPopUp'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(
                    height: 24,
                  ),
                  DocumentsTextField(
                    controller: controller,
                    placeholder: 'pop up menu',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFieldSearch(
                    initialList: country,
                    label: 'Simple List',
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      label: Text('Simple List'),
                      focusedBorder:
                      _buildOutlineBorder(Theme.of(context).colorScheme.secondary),
                      errorBorder: _buildOutlineBorder(Theme.of(context).errorColor),
                      border: _buildOutlineBorder(Theme.of(context).unselectedWidgetColor),
                    ),
                    getSelectedValue: (){

                    },),
                    SizedBox(
                      height: 2400,
                    ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  InputBorder _buildOutlineBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

}
