import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/widgets/buttons/card_button.dart';
import 'package:note_app/ui/widgets/buttons/simple_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<ScaffoldState> homePageKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const homePageRoute = "home_page";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.instance.brightness,
      builder: (BuildContext context, value, Widget? child) {
        final theme = ThemeController.instance;
        return Scaffold(
            backgroundColor: theme.background(),
            key: homePageKey,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Home Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: theme.primary()),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => theme.changeTheme(),
                  child: const Text('Action'),
                ),
                ElevatedButton(
                  child: const Text('Open URL'),
                  onPressed: () async {
                    if (await canLaunchUrl(Uri(scheme: 'https', host: 'google.com'))) {
                      launchUrl(Uri(scheme: 'https', host: 'google.com'));
                    }
                  },
                ),
                MediumButton(
                  title: "Boton nuevo",
                  onTap: () {},
                ),
                const CardButton(
                  title: "PDF",
                  icon: Icons.document_scanner,
                )
              ],
            ));
      },
    );
  }
}
