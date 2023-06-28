// ignore_for_file: avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/data.dart';
import 'package:note_app/core/constants/parameters.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/core/models/notes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NotePageArguments {
  final Note? note;
  const NotePageArguments({this.note});
}

Color fontColor() {
  return ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
}

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  static const notePageRoute = "note_page";

  String _title(Note note) {
    if (note.title != null) {
      return note.title!;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    NotePageArguments arguments = ModalRoute.of(context)?.settings.arguments as NotePageArguments;
    final theme = ThemeController.instance;
    return Scaffold(
      backgroundColor: theme.background(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: fontColor(),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          _title(arguments.note!),
          style: TextStyle(color: fontColor()),
        ),
      ),
      body: _Body(arguments.note!),
    );
  }
}

class _Body extends StatelessWidget {
  final Note note;

  const _Body(this.note, {Key? key}) : super(key: key);

  Widget _image() {
    if (note.type == TypeNote.image || note.type == TypeNote.imageNetwork || note.type == TypeNote.textImage || note.type == TypeNote.textImageNetwork) {
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(note.image ?? Constants.defaultImage),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Container();
  }

  void urls(String text) {
    note.urls = [];
    RegExp regExp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> match = regExp.allMatches(text);
    match.forEach((element) {
      note.urls?.add(text.substring(element.start, element.end));
    });
  }

  @override
  Widget build(BuildContext context) {
    urls(note.description ?? "");
    return Container(
      child: Column(children: [
        _image(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            note.description ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(color: fontColor()),
          ),
        ),
        const Divider(thickness: 1),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: note.urls!.length,
            itemBuilder: (context, index) {
              final url = note.urls![index];
              return ListTile(
                title: Text(
                  url,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue),
                ),
                onTap: () => launchUrlString(url),
              );
            },
          ),
        ),
      ]),
    );
  }
}
