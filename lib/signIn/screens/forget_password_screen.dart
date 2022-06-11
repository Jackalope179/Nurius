import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:nurnius/signIn/screens/confirm_email_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      emailInputfield(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      continueButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailInputfield() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }

  Widget continueButton() {
    return ElevatedButton(
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
      onPressed: () async {
        final Random random = Random();
        String password = random.toString();

        final Email email = Email(
          body: 'This is a test email, new password is $password',
          subject: 'Test Email',
          recipients: ['hoang.nguyen1709@hcmut.edu.vn'],
          isHTML: false,
        );
        try {
          await FlutterEmailSender.send(email);
        } catch (e) {}
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ConfirmEmailScreen(),
          ),
        );
      },
      child: const Text(
        "Lấy lại mật khẩu",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
