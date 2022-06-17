import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/homepage/screens/home_page.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({Key? key, required this.email, required this.password})
      : super(key: key);
  final String password;
  final String email;

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
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
        Utils.navigateForwardfunction(context, HomePage());

        // FireStoreConnection? firestore =
        //     FireStoreConnection.getFireStoreInstance();
        // if (await firestore!.isUnvalidUser(email, password)) {
        //   Utils.showSnackBar(
        //     context,
        //     'Invalid username or password',
        //   );
        // } else {
        //   var user = firestore.getUser(email, password);
        // Utils.navigateForwardfunction(
        //     context,
        //     HomePage(
        //       email: email,
        //       password: password,
        //       username: user.snapshot.data()['username'],
        //     ));
        // }
      },
      child: const Text(
        "Đăng nhập",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
