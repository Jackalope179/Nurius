import 'package:nurnius/app.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/game_screen.dart';
import 'package:nurnius/provider/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nurius',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const NuriusApp(),
        home: const GameScreen(),
      ),
    );
  }
}
