import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/utils.dart';

class ExitBtn extends StatelessWidget {
  const ExitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          Utils.popBack(context, "GameScreen");
        },
        icon: const Icon(
          FontAwesomeIcons.doorOpen,
          size: 35,
        ),
        color: const Color(0xFF7E7063),
      ),
    );
  }
}
