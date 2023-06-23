import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/core/models/notes.dart';
import 'package:note_app/ui/configure.dart';

class SimpleCard extends StatelessWidget {
  final Note note;

  const SimpleCard(this.note, {Key? key}) : super(key: key);

  Color background() => ThemeController.instance.brightnessValue ? Configure.backgroundDark : Configure.backgroundLight;
  Color fontColor() => ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: background(),
      ),
      child: Center(
        child: Text(
          note.description ?? "Sin contenido",
          style: TextStyle(color: fontColor()),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final Note note;

  const ImageCard(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(note.image ?? 'https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              note.description ?? "Sin contenido",
              style: const TextStyle(color: Colors.transparent),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38),
          child: Center(
            child: Text(
              note.description ?? "Sin contenido",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class TextImageCard extends StatelessWidget {
  final Note note;

  const TextImageCard(this.note, {Key? key}) : super(key: key);

  Color background() => !ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
  Color fontColor() => !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: [
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(note.image ?? 'https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'),
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: background(),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title ?? "Sin titulo",
                  style: TextStyle(color: fontColor()),
                ),
                const SizedBox(height: 8),
                Text(
                  note.description ?? "Sin contenido",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
