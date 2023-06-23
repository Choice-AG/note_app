import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/core/models/notes.dart';
import 'package:note_app/ui/widgets/cards/custom_cards.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget.dart';

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
    return Stack(
      children: [
        ValueListenableBuilder(
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
                      onPressed: () async {
                        LoadingWidgetController.instance.loading();
                        LoadingWidgetController.instance.changeText("Esta cargando...");
                        await Future.delayed(const Duration(seconds: 2));
                        LoadingWidgetController.instance.close();
                      },
                      child: const Text('Loading'),
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
        ),
        ValueListenableBuilder(
          valueListenable: LoadingWidgetController.loadingNotifier,
          builder: (context, bool value, Widget? child) {
            return value ? const LoadingWidget() : const SizedBox();
          },
        ),
      ],
    );
  }
}
