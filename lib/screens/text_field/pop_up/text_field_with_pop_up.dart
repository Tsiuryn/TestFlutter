import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/text_field/pop_up/documents_text_field.dart';
import 'package:test_flutter/screens/text_field/pop_up/widgets/dropdown_menu.dart';
import 'package:test_flutter/screens/text_field/pop_up/widgets/my_overlay_widget.dart';
import 'package:test_flutter/screens/text_field/pop_up/widgets/textfield_search.dart';

class TextFieldWithPopUp extends StatefulWidget {
  static const id = 'TextFieldWithPopUp';

  const TextFieldWithPopUp({Key? key}) : super(key: key);

  @override
  _TextFieldWithPopUpState createState() => _TextFieldWithPopUpState();
}

class _TextFieldWithPopUpState extends State<TextFieldWithPopUp> {
  var controller = TextEditingController();
  GlobalKey<DropDownMenuState> key = GlobalKey<DropDownMenuState>();
  final myOverlayKey = GlobalKey<MyOverlayWidgetState>();

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

  List<Widget> get widCountry => country.map((e) => Text(e)).toList();

  var focusNode = FocusNode();

  var myFocus = FocusNode();
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      // setState(() {
      //   isShow = focusNode.hasFocus;
      if (focusNode.hasFocus) {
        key.currentState?.showMenu();
      } else {
        key.currentState?.closeMenu();
      }
      // });
    });

    myFocus.addListener(() {
      if (myFocus.hasFocus) {
        myOverlayKey.currentState?.showOverlay();
      } else {
        myOverlayKey.currentState?.hideOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: SafeArea(
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
                    height: 240,
                  ),
                  TextFieldSearch(
                    initialList: country,
                    label: 'Simple List',
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      label: Text('Simple List'),
                      focusedBorder: _buildOutlineBorder(
                          Theme.of(context).colorScheme.secondary),
                      errorBorder:
                          _buildOutlineBorder(Theme.of(context).errorColor),
                      border: _buildOutlineBorder(
                          Theme.of(context).unselectedWidgetColor),
                    ),
                    getSelectedValue: () {},
                  ),
                  SizedBox(
                    height: 240,
                  ),
                  DropDownMenu(
                    key: key,
                    textField: _buildTextField(context),
                    boxWidgets: _buildListView(context),
                    boxHeight: 300,
                  ),
                  SizedBox(
                    height: 100,
                  ),

                  MyOverlayWidget(
                    key: myOverlayKey,
                    contentBox: _buildListView(context),
                    parent: _buildTextField1(context),
                  ),
                  SizedBox(
                    height: 2800,
                  ),
                  //
                  // Container(
                  //   height: 300,
                  //   child: _buildListView(context),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return DocumentsTextField(
      focusNode: focusNode,
      controller: TextEditingController(),
      placeholder: 'Drop down menu',
    );
  }

  Widget _buildTextField1(BuildContext context) {
    return DocumentsTextField(
      focusNode: myFocus,
      controller: TextEditingController(),
      placeholder: 'New drop down menu',
    );
  }

  Widget _buildListView(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        itemCount: country.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(country[position]),
          );
        },
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
