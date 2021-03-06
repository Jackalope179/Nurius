import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class IconButtonWidget extends StatelessWidget {
  IconButtonWidget(
      {Key? key,
      required this.position,
      required this.iconSize,
      required this.iconColor,
      required this.icon})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var position;
  double iconSize;
  Color iconColor;
  // ignore: prefer_typing_uninitialized_variables
  var icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.doorOpen,
          size: iconSize,
        ),
        color: iconColor,
      ),
    );
  }
}
