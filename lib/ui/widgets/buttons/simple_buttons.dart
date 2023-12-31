import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';

class MediumButton extends StatelessWidget {
  const MediumButton({
    Key? key,
    this.icon,
    this.onTap,
    this.primaryColor = true,
    this.title,
  }) : super(key: key);

  final String? title;
  final bool primaryColor;
  final IconData? icon;
  final Function()? onTap;

  Color getColor() {
    return primaryColor ? ThemeController.instance.primaryButton() : ThemeController.instance.secondaryButton();
  }

  Color getColorText() {
    return !ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: getColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon) : const SizedBox(),
            SizedBox(width: icon != null ? 8 : 0),
            Text(
              title != null ? title! : "",
              style: TextStyle(color: getColorText(), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
