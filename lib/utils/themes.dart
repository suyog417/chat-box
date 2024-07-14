import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const Color textFieldLabelColor = Color(0xFF5EBAAE);


ThemeData lightTheme(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: textFieldLabelColor),
    primaryColor: Colors.black,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(
        foregroundColor: Colors.black
    )),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.02))
        )
    ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      )
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark(useMaterial3: true).copyWith(
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      displayColor: Colors.white,
      bodyColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(
      foregroundColor: Colors.white
    )),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: textFieldLabelColor),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.02))
        )
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    )
  );
}