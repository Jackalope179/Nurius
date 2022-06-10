// Password input handler
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  @override
  State<PasswordInput> createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool _passwordVisible = false;

  FocusNode focusNodePassword = FocusNode();
  String hintTextPassword = "Mật khẩu";

  @override
  void initState() {
    _passwordVisible = false;
    focusNodePassword.addListener(() {
      if (focusNodePassword.hasFocus) {
        hintTextPassword = '';
        setState(() {});
      } else {
        hintTextPassword = 'Mật khẩu';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginFormpasswordInput_textField'),
      focusNode: focusNodePassword,
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock),
        labelText: 'Mật khẩu',
        hintText: hintTextPassword,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
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
