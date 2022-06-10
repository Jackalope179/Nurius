import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurnius/common/nurius_logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const NuriusLogo(),
                Align(
                  alignment: const Alignment(0, -1 / 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      userNameInput(),
                      space(0.03),
                      emailInput(),
                      space(0.03),
                      passwordInput(),
                      space(0.03),
                      confirmPasswordInput(),
                      space(0.03),
                      singUpButton(),
                      space(0.03),
                    ],
                  ),
                )
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Đã có tài khoản?",
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    child: const Text(
                      "Đăng nhập ngay",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF7E7063),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNameInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Họ và tên',
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }

  Widget passwordInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Mật khẩu',
      ),
    );
  }

  Widget confirmPasswordInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Nhập lại mật khẩu',
      ),
    );
  }

  Widget singUpButton() {
    return ElevatedButton(
      //  change color of button when not authentication yet
      key: const Key('loginForm_continue_raisedButton'),
      style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return const Color(0xFF7E7063);
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return const Color(0xFFffffff);
          }),
          fixedSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              return Size(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.width * 0.15,
              );
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
      onPressed: () {},
      child: const Text(
        "Đăng nhập",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget space(double size) {
    return SizedBox(height: MediaQuery.of(context).size.height * size);
  }
}
