import 'package:flutter/material.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/configure.dart';
import 'package:note_app/ui/pages/home_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.details}) : super(key: key);

  static const errorPageRoute = "error_page";
  final FlutterErrorDetails? details;
  Color fontColor() => !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeController.instance.background(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeController.instance.background(),
        title: Text(
          "Error",
          style: TextStyle(color: fontColor()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(color: Configure.backgroundLight, borderRadius: BorderRadius.circular(200)),
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/error.png"),
                  ),
                ),
              ),
            ),
            Text(
              Constants.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: fontColor()),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, HomePage.homePageRoute),
              child: const Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
