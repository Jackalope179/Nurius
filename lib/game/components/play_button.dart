import 'package:flutter/material.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/ThirdGame/explain1.dart';
import 'package:nurnius/game/screens/first_game_screen.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({Key? key}) : super(key: key);

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
                MediaQuery.of(context).size.width * 0.45,
                MediaQuery.of(context).size.height * 0.15,
              );
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
      onPressed: () {
        // ProgressBar.mana -= 0.3;
        Utils.navigateForwardfunction(context, const FirstGameScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.play_arrow,
            size: 45,
          ),
          const Text(
            'PLAY',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
        ],
      ),
    );
  }
}
