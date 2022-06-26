import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/intro_game_screen.dart';

class ExitBtn extends StatelessWidget {
  const ExitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
              (route) => true);
          // Utils.popBack(context, "GameScreen", GameScreen());
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
