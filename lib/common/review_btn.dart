import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/game/screens/ReviewGame/map_screen.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.01,
        left: MediaQuery.of(context).size.width * 0.01,
        child: IconButton(
            color: const Color(0xFF7E7063),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MapScreen();
                  },
                ),
              );
            },
            iconSize: 45,
            icon: const Icon(FontAwesomeIcons.bookBible)));
  }
}
