import 'package:flutter/material.dart';

class OwnThemeFields {
  final Color? errorShade;
  final Color? textBaloon;

  const OwnThemeFields({Color? errorShade, Color? textBaloon})
      : this.errorShade = errorShade,
        this.textBaloon = textBaloon;

  OwnThemeFields.light(
      {this.errorShade = Colors.red, this.textBaloon = Colors.red});
  OwnThemeFields.dark(
      {this.errorShade = Colors.green, this.textBaloon = Colors.green});

  factory OwnThemeFields.empty() {
    return OwnThemeFields(errorShade: Colors.black, textBaloon: Colors.black);
  }
}

extension ThemeDataExtensions on ThemeData {
  static Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _own[this.inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty = null;

  OwnThemeFields own() {
    var o = _own[this.inputDecorationTheme];
    if (o == null) {
      if (empty == null) empty = OwnThemeFields.empty();
      o = empty;
    }
    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();

final ThemeData lightTheme = ThemeData.light().copyWith(
    // cardColor: Color.fromARGB(255, 240, 242, 243),
    // dialogBackgroundColor: Color.fromARGB(255, 240, 242, 243),
    backgroundColor: Color.fromARGB(255, 240, 242, 243),
    canvasColor: Color.fromARGB(255, 240, 242, 243),
    // scaffoldBackgroundColor: Color.fromARGB(255, 240, 242, 243),
    //visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black))),
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        labelStyle: TextStyle(
            fontSize: 18, fontFamily: 'Montserrat', color: Colors.red)),
    colorScheme:
        ColorScheme.light().copyWith(secondary: Colors.grey.withAlpha(128)),
    textTheme: TextTheme(
      button: TextStyle(
          fontSize: 18, fontFamily: 'Montserrat', color: Colors.black),
      headline6: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      // standard TextField()
      subtitle1: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.italic,
        color: Colors.black.withAlpha(128),
      ),
      // used for dictionary error text in Online dicts
      overline: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.italic,
          color: Colors.black),
      // standard Text()
      bodyText2: TextStyle(
          fontSize: 20.0, fontFamily: 'Montserrat', color: Colors.black),
      // italic Text()
      bodyText1: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.italic,
          color: Colors.black),
      // Dictionary card, dictionary  name
      caption: TextStyle(
          fontSize: 17.0, fontFamily: 'Montserrat', color: Colors.black),
    ))
  ..addOwn(
      // OwnThemeFields(
      // errorShade: Color.fromARGB(240, 255, 200, 200),
      // textBaloon: Color.fromARGB(240, 255, 200, 200))
      OwnThemeFields.light());

final ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: Color.fromARGB(255, 16, 17, 18),
    dialogBackgroundColor: Color.fromARGB(255, 16, 17, 18),
    canvasColor: Color.fromARGB(255, 16, 17, 18),
    scaffoldBackgroundColor: Color.fromARGB(255, 32, 33, 36),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),
    colorScheme:
        ColorScheme.dark().copyWith(secondary: Colors.grey.withAlpha(128)),
    backgroundColor: Color.fromARGB(255, 32, 35, 36),
    textTheme: TextTheme(
      button: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
      headline6: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.italic,
        color: Colors.white.withAlpha(128),
      ),
      // used for dictionary error text in Online dicts
      overline: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
          fontSize: 20.0, fontFamily: 'Montserrat', color: Colors.white),
      // Dictionary card, dictionary  name
      caption: TextStyle(
          fontSize: 17.0, fontFamily: 'Montserrat', color: Colors.white),
    ))
  ..addOwn(
      // OwnThemeFields(
      // errorShade: Color.fromARGB(240, 200, 0, 0),
      // textBaloon: Color.fromARGB(255, 200, 80, 80))
      OwnThemeFields.dark());
