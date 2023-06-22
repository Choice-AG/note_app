import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';

class CardButton extends StatelessWidget {
  final String title;
  final bool primaryColor;
  final IconData? icon;
  final Function()? onTap;

  const CardButton({
    Key? key,
    this.title = "",
    this.primaryColor = true,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.instance.brightness,
      builder: (BuildContext context, bool brightnessValue, Widget? child) {
        final theme = ThemeController.instance;
        final color = primaryColor ? theme.background() : theme.secondaryButton();
        final textColor = brightnessValue ? Colors.black : Colors.white;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: 85,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null ? Icon(icon, size: 28, color: textColor) : const SizedBox(),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
