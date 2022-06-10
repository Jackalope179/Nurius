import 'package:flutter/material.dart';
import 'package:nurnius/signIn/components/password_input_field.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                      OTP(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      passwordInputField(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      confirmPasswordField(),
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

  Widget passwordInputField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Mật khẩu mới',
      ),
    );
  }

  Widget confirmPasswordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Nhập lại mật khẩu',
      ),
    );
  }

  Widget OTP() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Mã xác nhận',
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
      onPressed: () {},
      child: const Text(
        "Lấy lại mật khẩu",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
