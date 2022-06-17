import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstIntroGame1 extends StatelessWidget {
  const FirstIntroGame1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // alert dialog
    return AlertDialog(
      title: const Text('First Game'),
      content: const Text('This is the first game'),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
