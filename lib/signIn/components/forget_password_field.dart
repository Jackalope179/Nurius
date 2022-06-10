import 'package:flutter/material.dart';
import 'package:nurnius/signIn/screens/forget_password_screen.dart';
import 'package:nurnius/signup/screens/sign_up_page.dart';

class ForgetPasswordField extends StatelessWidget {
  const ForgetPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgetPasswordScreen()));
          },
          child: const Text(
            "Quên mật khẩu?",
            style: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        GestureDetector(
          child: const Text(
            "Đăng ký",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
        ),
      ],
    );
  }
}
