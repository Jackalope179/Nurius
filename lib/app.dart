import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurnius/homepage/screens/home_page.dart';
import 'package:nurnius/signIn/screens/sign_in_page.dart';

class NuriusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nurius',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
