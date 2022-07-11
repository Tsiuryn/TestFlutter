import 'package:flutter/material.dart';

import '../constants.dart';

InputDecoration getInputDecor(String hintText) => InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.white38,
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.white),
    contentPadding: EdgeInsets.symmetric(horizontal: defpaultPadding, vertical: defpaultPadding * 1.2)
);

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            TextFormField(
              decoration:
              getInputDecor("Email")
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
              child: TextFormField(
                obscureText: true,
                decoration: getInputDecor("Password"),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
