import 'package:flutter/material.dart';
import 'package:nurnius/common/nurius_logo.dart';
import 'package:nurnius/firestore/fire_store_config.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  FireStoreConnection? firestore = FireStoreConnection.getFireStoreInstance();

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
                      userNameInput(usernameController),
                      space(0.03),
                      emailInput(emailController),
                      space(0.03),
                      passwordInput(passwordController),
                      space(0.03),
                      confirmPasswordInput(confirmPasswordController),
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
                    "???? c?? t??i kho???n?",
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    child: const Text(
                      "????ng nh???p ngay",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF7E7063),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pop();
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

  Widget userNameInput(TextEditingController usernameController) {
    return TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'H??? v?? t??n',
      ),
    );
  }

  Widget emailInput(TextEditingController emailController) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }

  Widget passwordInput(TextEditingController passwordController) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'M???t kh???u',
      ),
    );
  }

  Widget confirmPasswordInput(TextEditingController confirmPasswordController) {
    return TextFormField(
      controller: confirmPasswordController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Nh???p l???i m???t kh???u',
      ),
    );
  }

  Widget singUpButton() {
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
        if (passwordController.text != confirmPasswordController.text) {
          const snackBar = SnackBar(
            content: Text("M???t kh???u x??c th???c kh??ng ????ng!!!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (await firestore!.checkExistUser(emailController.text)) {
          const snackBar = SnackBar(
            content: Text("Email ???? ???????c s??? d???ng!!!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          firestore?.saveUser(emailController.text, passwordController.text,
              usernameController.text);
          Navigator.of(context).pop();
        }
      },
      child: const Text(
        "????ng k??",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget space(double size) {
    return SizedBox(height: MediaQuery.of(context).size.height * size);
  }
}
