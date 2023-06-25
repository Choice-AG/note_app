import 'package:flutter/material.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/configure.dart';
import 'package:note_app/ui/pages/landing_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.details}) : super(key: key);

  static const errorPageRoute = "error_page";

  final FlutterErrorDetails? details;
  Color fontColor() => !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  String getException() {
    if (details != null) {
      final exception = details?.exceptionAsString();
      if (exception != null) {
        return exception;
      }
    }
    return "";
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Column(children: [
              Text(
                Constants.errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(color: fontColor()),
              ),
              details != null
                  ? Text(
                      getException(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: fontColor()),
                    )
                  : Container(),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, LandingPage.landingPageRoute, (route) => false),
                child: const Text("Volver al inicio"),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
