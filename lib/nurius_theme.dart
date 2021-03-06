import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);

const colorscheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF0589F3),
  onPrimary: Colors.white,
  secondary: Color(0xFFECDAEC),
  onSecondary: Colors.black,
  error: Color(0xFFE83329),
  onError: Colors.white,
  background: Color(0xFFF5F5F5),
  onBackground: Colors.black,
  surface: Color(0xFFF5F5F5),
  onSurface: Colors.black,
);

const textStyleConfig = TextTheme(
  titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
);

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    primaryColor: const Color(0xFF0589F3),
    focusColor: const Color(0xFF0589F3),
    hoverColor: const Color(0xFFF8F8F8),
    canvasColor: const Color(0xFFDCE7EB),
    dividerColor: Colors.grey,
    unselectedWidgetColor: const Color(0xFFC4C4C4),
    shadowColor: Colors.grey,
    errorColor: const Color(0xFFE83329),
    primaryColorDark: const Color(0xFFECDAEC),
    fontFamily: GoogleFonts.getFont('Montserrat').fontFamily,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Colors.black,
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1F1B25),
    primaryColor: const Color(0xFF5DA5E1), //ff4d4747,
    focusColor: const Color(0xFF5DA5E1),
    hoverColor: const Color(0xFF4D4747),
    canvasColor: darkHeaderClr,
    dividerColor: const Color(0xFFADB0D2),
    unselectedWidgetColor: const Color(0xFF8F8F8F),
    shadowColor: Colors.grey,
    errorColor: const Color(0xFFCA5D57),
    // primaryColorDark: Color(0xff4F37B3),
    primaryColorDark: const Color.fromARGB(255, 159, 143, 216),
    fontFamily: GoogleFonts.getFont('Montserrat').fontFamily,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Colors.white,
      ),
    ),
  );
}
