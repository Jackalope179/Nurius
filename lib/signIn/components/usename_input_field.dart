import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  State<EmailInput> createState() => EmailInputState();
}

class EmailInputState extends State<EmailInput> {
  FocusNode focusNodePhone = FocusNode();
  String hintTextPhone = 'Email';

  @override
  // ignore: must_call_super
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
      key: const Key('loginFormEmailInput_textField'),
      focusNode: focusNodePhone,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: const Icon(Icons.email, color: Colors.grey),
        hintText: hintTextPhone,
        labelText: 'Email',
      ),
    );
  }
}
