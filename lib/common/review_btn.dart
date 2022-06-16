import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/ReviewGame/map_screen.dart';

// ignore: must_be_immutable
class ReviewButton extends StatelessWidget {
  ReviewButton({Key? key, required this.screen}) : super(key: key);
  String screen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        // top: MediaQuery.of(context).size.height * 0.01,
        top: 0,
        left: MediaQuery.of(context).size.width * 0.065,
        child: IconButton(
            color: const Color(0xFF7E7063),
            onPressed: () {
              Utils.navigateForwardfunction(
                  context,
                  MapScreen(
                    screen: screen,
                  ));
            },
            iconSize: 35,
            icon: const Icon(FontAwesomeIcons.mapLocation)));
  }
}
