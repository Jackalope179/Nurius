import 'package:flutter/material.dart';
import 'package:nurnius/signup/screens/sign_up_page.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F6F0),
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
                    _UsernameInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    _PasswordInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    _LoginButton(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text("Hoặc"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return const Color(0xFFFFFFFF);
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return const Color(0xFF000000);
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          // google icon
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          Text(
                            "Tiếp tục với Google",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    )
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

class _UsernameInput extends StatefulWidget {
  @override
  State<_UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<_UsernameInput> {
  FocusNode focusNodePhone = FocusNode();
  String hintTextPhone = 'Email';

  @override
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
      key: const Key('loginForm_usernameInput_textField'),
      focusNode: focusNodePhone,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        hintText: hintTextPhone,
        labelText: 'Email',
      ),
    );
  }
}

// Password input handler
class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
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
      key: const Key('loginForm_passwordInput_textField'),
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

// Login button handler
class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
