import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/widgets/loading_widget/loading_widget_controller.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentValue = LoadingWidgetController.instance.contentValue();
    return Material(
      color: Colors.white24,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: ThemeController.instance.accent(),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Cargando',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                Text(
                  contentValue,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
