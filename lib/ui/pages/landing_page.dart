// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/ui/pages/private_notes.dart';
import 'package:note_app/ui/widgets/buttons/simple_buttons.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget_controller.dart';

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

  Future<void> initMethods(context) async {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Scaffold(
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
                                LoadingWidgetController.instance.loading();
                                await initMethods(context);
                                LoadingWidgetController.instance.close();
                                Navigator.pushNamed(context, NotePrivatePage.notePrivatePageRoute);
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
            ),
          ],
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
