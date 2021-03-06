import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: creamColor,
        cardColor: Colors.white,
        accentColor: darkBlueshColor,
        buttonColor: darkBlueshColor,
        backgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: darkCreamColor,
        cardColor: Colors.black,
        accentColor: Colors.white,
        backgroundColor: Colors.white,
        buttonColor: lightBlueshColor,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: context.theme.backgroundColor),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlueshColor = Color(0xff403b58);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBlueshColor = Vx.purple900;
}
