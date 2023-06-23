import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/core/models/notes.dart';
import 'package:note_app/ui/widgets/cards/custom_cards.dart';

GlobalKey<ScaffoldState> homePageKey = GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldMessengerState> homePageMessengerKey = GlobalKey<ScaffoldMessengerState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const homePageRoute = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
                Row(
                  children: [
                    Flexible(child: SimpleCard(note)),
                    Flexible(child: ImageCard(note1)),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: SimpleCard(note)),
                    Flexible(child: TextImageCard(note2)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
