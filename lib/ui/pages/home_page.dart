// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/parameters.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:note_app/ui/widgets/custom_bottom_sheet/custom_bottom_sheet_controller.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late CustomBottomSheetController _sheetController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    _controller1 = TextEditingController(text: "");
    _controller2 = TextEditingController(text: "");
    _sheetController = CustomBottomSheetController(this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: ThemeController.instance.brightness,
          builder: (BuildContext context, value, Widget? child) {
            final theme = ThemeController.instance;
            return ScaffoldMessenger(
              key: _scaffoldMessengerKey,
              child: Scaffold(
                backgroundColor: theme.background(),
                key: _scaffoldKey,
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
                      onPressed: () {
                        _sheetController.open();
                      },
                      child: const Text('Ruta BottomSheet'),
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
        Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height + 100 - (MediaQuery.of(context).size.height * _sheetController.value)),
          child: CustomBottomSheet(
            onTap: () => _sheetController.close(),
          ),
        ),
      ],
    );
  }
}
