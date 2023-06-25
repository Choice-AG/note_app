import 'package:flutter/material.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/widgets/buttons/simple_buttons.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const landingPageRoute = "landing_page";

  Widget _image() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/landing.png'),
        ),
      ),
    );
  }

  Future<void> initMethods(context) async {
    Navigator.pushNamed(context, HomePage.homePageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: _image(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    Constants.mainTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    Constants.subtitle,
                    style: TextStyle(color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MediumButton(
                      title: "Ingresar",
                      onTap: () async {
                        await initMethods(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
