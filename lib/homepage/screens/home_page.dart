import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nurnius/common/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: NavigationDrawerWidget(),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: const Color(0xFFFC2288),
                  child: Image.asset(
                    'assets/images/intro1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    iconSize: 50,
                    icon: const Icon(Icons.menu),
                    onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
                  ),
                )
              ]),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.green,
                child: Image.asset(
                  'assets/images/intro2.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.red,
                child: Image.asset(
                  'assets/images/intro3.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
