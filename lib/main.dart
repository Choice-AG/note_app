import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/pages/error_page.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/pages/landing_page.dart';
import 'package:note_app/ui/pages/note_page.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorPage(details: details);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.instance.brightness,
      builder: (BuildContext context, bool brightnessValue, Widget? child) {
        return MaterialApp(
          routes: {
            HomePage.homePageRoute: (context) => const HomePage(),
            ErrorPage.errorPageRoute: (context) => const ErrorPage(),
            LandingPage.landingPageRoute: (context) => const LandingPage(),
            NotePage.notePageRoute: (context) => const NotePage(),
          },
          debugShowCheckedModeBanner: false,
          title: Constants.mainTitle,
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            brightness: brightnessValue ? Brightness.light : Brightness.dark,
          ),
          initialRoute: LandingPage.landingPageRoute,
        );
      },
    );
  }
}
