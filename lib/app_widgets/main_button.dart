import 'package:flutter/material.dart';

Widget btn(BuildContext context, String btnName, String pageId, {Key? key}) {
  return OutlinedButton(
      key: key,
      child: Center(
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          elevation: 4,
  ),
      onPressed: () {
        Navigator.pushNamed(context, pageId);
      });
}
