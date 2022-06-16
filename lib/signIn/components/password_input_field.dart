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
  bool _passwordVisible = false;

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
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_passwordVisible,
      controller: widget.passwordController,
      focusNode: focusNodePhone,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock, color: Colors.grey),
        hintText: hintTextPhone,
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[400],
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
