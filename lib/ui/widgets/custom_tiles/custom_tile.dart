import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';

class ImageTile extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final Function? onTap;

  const ImageTile({
    Key? key,
    this.title = "",
    this.image = "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg",
    this.onTap,
    this.description = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeController.instance;
    return ListTile(
      onTap: () => onTap,
      title: Text(
        title,
        style: TextStyle(color: theme.getColorText()),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
