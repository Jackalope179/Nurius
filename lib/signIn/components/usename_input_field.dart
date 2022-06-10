import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatefulWidget {
  @override
  State<UsernameInput> createState() => UsernameInputState();
}

class UsernameInputState extends State<UsernameInput> {
  FocusNode focusNodePhone = FocusNode();
  String hintTextPhone = 'Email';

  @override
  void initState() {
    focusNodePhone.addListener(() {
      if (focusNodePhone.hasFocus) {
        hintTextPhone = '';
      } else {
        hintTextPhone = 'Email';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginFormusernameInput_textField'),
      focusNode: focusNodePhone,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: const Icon(Icons.email, color: Colors.grey),
        hintText: hintTextPhone,
        labelText: 'Email',
      ),
    );
  }
}
