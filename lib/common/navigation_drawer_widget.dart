// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/utils.dart';

import 'package:nurnius/game/screens/intro_game_screen.dart';
import 'package:nurnius/homepage/screens/home_page.dart';
import 'package:nurnius/provider/google_sign_in.dart';
import 'package:nurnius/shopping/screens/shopping_screen.dart';
import 'package:nurnius/specialist/screens/specialist_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // final name = user!.displayName!;
    // final email = user!.email!;
    // final urlImage = user!.photoURL!;

    final name = "Nurnius";
    final email = "nurnius@gmail.com";
    final urlImage =
        "https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png";

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
              context: context,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white, thickness: 0.4),
                  buildMenuItem(
                    text: 'Trang chủ',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Game',
                    icon: FontAwesomeIcons.gamepad,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Mua sắm',
                    icon: FontAwesomeIcons.cartShopping,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Chuyên gia',
                    icon: FontAwesomeIcons.userDoctor,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white, thickness: 0.4),
                  buildMenuItem(
                    text: 'Đăng xuất',
                    icon: FontAwesomeIcons.arrowRightFromBracket,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
    required var context,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 15, backgroundImage: NetworkImage(urlImage)),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        name,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(-0.3, 0),
                child: Text(
                  textAlign: TextAlign.left,
                  email,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context, rootNavigator: true).pop();

    switch (index) {
      case 0:
        Utils.navigateForwardfunction(context, HomePage());
        break;
      case 1:
        Utils.navigateForwardfunction(context, const GameScreen());
        break;
      case 2:
        Utils.navigateForwardfunction(context, ShoppingScreen());
        break;
      case 3:
        break;
      case 4:
        Utils.navigateForwardfunction(context, const SpecialitsScreen());
        break;
      case 5:
        final provier =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provier.logOut();
        break;
    }
  }
}
