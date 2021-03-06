import 'package:flutter/cupertino.dart';

class NuriusLogo extends StatelessWidget {
  const NuriusLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: MediaQuery.of(context).size.height * 0.2,
    );
  }
}
