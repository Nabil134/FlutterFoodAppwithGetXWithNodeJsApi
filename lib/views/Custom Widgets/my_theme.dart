import 'package:flutter/material.dart';



class MyTheme{
  static Color loginButtonColor=Colors.purple;
  static Color signUpButtonColor=Colors.grey.shade300;
  static Color loginPageBoxColor=Color(0xffccccff);
  static Color defaultTextColor = Colors.teal;
  static Color unSelectedTextColor =Colors.grey.shade100;
  static double defaultPadding=20.0;
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    canvasColor: Colors.white,
    // fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white, // Matches surface for light theme
      foregroundColor: Colors.teal, // Text/icon color onAppBar
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 4,
    ),
snackBarTheme: SnackBarThemeData(
  backgroundColor: Colors.teal,
  contentTextStyle: TextStyle(color: Colors.black), // Text color for content
  actionTextColor: Colors.yellowAccent, // Action button text color
  behavior: SnackBarBehavior.floating,
),
    colorScheme: ColorScheme(
      primary: Colors.black,
      //  primaryVariant: Colors.black87,
      secondary: Colors.black87,
      //  secondaryVariant: Colors.black87,
      surface: Colors.cyan.shade50,
      background: Colors.cyan.shade100,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.red,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: defaultTextColor),
      bodyMedium: TextStyle(color: unSelectedTextColor),
      titleMedium: TextStyle(color: Colors.grey),
    ),
  );
  static ThemeData darkTheme(BuildContext context)=>ThemeData(
    canvasColor: Colors.black,
    // fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black, // Matches surface for light theme
      foregroundColor: Colors.teal, // Text/icon color on AppBar
      shadowColor: Colors.white.withOpacity(0.5),
      elevation: 4,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.teal, // Background color for dark theme
      contentTextStyle: TextStyle(color: Colors.white), // Text color for content
      actionTextColor: Colors.tealAccent, // Action button text color
      behavior: SnackBarBehavior.floating,
    ),
    colorScheme: ColorScheme(
      primary: Colors.white,
      //  primaryVariant: Colors.white,
      secondary: Colors.white,
      //secondaryVariant: Colors.white,
      surface: Colors.cyan.shade50,
      background: Colors.cyan.shade100,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: defaultTextColor),
      bodyMedium: TextStyle(color: unSelectedTextColor),
    ),
  );
}