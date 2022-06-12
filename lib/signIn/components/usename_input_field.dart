import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailInput extends StatefulWidget {
  EmailInput({Key? key, required this.emailController}) : super(key: key);
  TextEditingController emailController;
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
      controller: widget.emailController,
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
