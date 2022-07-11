import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_form.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              decoration: getInputDecor('Email'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
              child: TextFormField(
                obscureText: true,
                decoration: getInputDecor('Password'),
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: getInputDecor('Confirm Password'),
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
