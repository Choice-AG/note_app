import 'package:note_app/core/constants/parameters.dart';

class Note {
  String? title;
  String? date;
  String? description;
  bool private;
  List<String>? urls;
  String? image;
  TypeNote type;
  StateNote state;

  Note({
    this.date,
    this.description,
    this.private = false,
    this.title,
    this.urls,
    this.image,
    this.type = TypeNote.text,
    this.state = StateNote.visible,
  });
}

Note note = Note(
  title: "Primera nota",
  date: "22/06/2023",
  description: "Esta es mi primera nota",
);
