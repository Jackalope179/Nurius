// ignore: depend_on_referenced_packages
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:nurnius/app.dart';
import 'package:nurnius/provider/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final localData = openDatabase(
    join(await getDatabasesPath(), 'app_meta_data.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE local_data(id INTEGER PRIMARY KEY, isFist BOOL)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      FlutterNativeSplash.remove();
    });
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nurius',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NuriusApp(),
      ),
    );
  }
}
