import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/widgets/buttons/card_button.dart';
import 'package:note_app/ui/widgets/buttons/simple_buttons.dart';
import 'package:note_app/ui/widgets/custom_snackbar.dart';
import 'package:note_app/ui/widgets/custom_tiles/check_tile.dart';
import 'package:note_app/ui/widgets/custom_tiles/custom_tile.dart';
import 'package:note_app/ui/widgets/text_inputs/text_inputs.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<ScaffoldState> homePageKey = GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldMessengerState> homePageMessengerKey = GlobalKey<ScaffoldMessengerState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const homePageRoute = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late TextEditingController _controllerLarge;

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controllerLarge = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.instance.brightness,
      builder: (BuildContext context, value, Widget? child) {
        final theme = ThemeController.instance;
        return ScaffoldMessenger(
          key: homePageMessengerKey,
          child: Scaffold(
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
                  onTap: () => showSnackBar(homePageMessengerKey, "hola soy un snackbar"),
                ),
                const CardButton(
                  title: "PDF",
                  icon: Icons.document_scanner,
                ),
                TextInput(
                  title: "entrada",
                  controller: _controller,
                ),
                LargeTextInput(
                  title: "largo",
                  controller: _controllerLarge,
                ),
                const ImageTile(
                  title: "Menu",
                  image: "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg",
                  description: "Descripcion de nuestro tile",
                ),
                CheckTile(
                  title: "Check",
                  activate: false,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
