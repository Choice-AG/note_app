import 'package:flutter/material.dart';
import 'package:note_app/core/constants/parameters.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/pages/error_page.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget.dart';
import 'package:note_app/ui/widgets/status_message/status_message.dart';

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
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: StatusMessage(
                        () async {
                          LoadingWidgetController.instance.loading();
                          LoadingWidgetController.instance.changeText("Esta cargando...");
                          await Future.delayed(const Duration(seconds: 2));
                          LoadingWidgetController.instance.close();
                        },
                        StatusNetwork.exception,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, ErrorPage.errorPageRoute),
                      child: const Text('Ruta ErrorPage'),
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
