import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key, required this.passwordController}) : super(key: key);
  TextEditingController passwordController;
  @override
  State<PasswordInput> createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  FocusNode focusNodePhone = FocusNode();
  String hintTextPhone = 'Password';

  @override
  // ignore: must_call_super
  void initState() {
    focusNodePhone.addListener(() {
      if (focusNodePhone.hasFocus) {
        hintTextPhone = '';
      } else {
        hintTextPhone = 'Password';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      focusNode: focusNodePhone,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: const Icon(Icons.email, color: Colors.grey),
        hintText: hintTextPhone,
        labelText: 'Password',
      ),
    );
  }
}
