import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ThemeController.instance.initTheme(),
      builder: (snapshot, context) {
        return MaterialApp(
          routes: {
            HomePage.homePageRoute: (context) => const HomePage(),
          },
          debugShowCheckedModeBanner: false,
          title: Constants.mainTitle,
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          initialRoute: HomePage.homePageRoute,
        );
      },
    );
  }
}
