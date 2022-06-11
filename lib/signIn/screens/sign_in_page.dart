import 'package:flutter/material.dart';
import 'package:nurnius/signIn/components/forget_password_field.dart';
import 'package:nurnius/signIn/components/google_signin_button.dart';
import 'package:nurnius/signIn/components/password_input_field.dart';
import 'package:nurnius/signIn/components/sign_in_button.dart';
import 'package:nurnius/signIn/components/usename_input_field.dart';
// ignore: depend_on_referenced_packages

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                'assets/images/logo.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Align(
                alignment: const Alignment(0, -1 / 3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const EmailInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    const PasswordInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const ForgetPasswordField(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const SignInButton(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text("Hoặc"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const GoogleSignInButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
