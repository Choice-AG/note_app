import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/configure.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  final Widget? content;
  Function()? onTap;

  CustomBottomSheet({Key? key, this.content, this.onTap}) : super(key: key);

  Color background() {
    return ThemeController.instance.brightnessValue ? Configure.backgroundDark : Configure.backgroundLight;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 100,
      width: size.width,
      decoration: BoxDecoration(
        color: background(),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Center(
          child: TextButton(
        onPressed: onTap,
        child: const Text("Cerrar"),
      )),
    );
  }
}
