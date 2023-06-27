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
  type: TypeNote.text,
  description: "Esta es mi primera nota",
);

Note note1 = Note(
  title: "Primera nota",
  date: "22/06/2023",
  type: TypeNote.image,
  description: "Esta es mi primera nota con imagen",
  image: 'https://i.blogs.es/d5130c/wallpaper-2.png/1366_2000.jpeg',
);

Note note2 = Note(
  title: "Primera nota",
  date: "22/06/2023",
  type: TypeNote.textImage,
  description: "Esta es mi primera nota con imagen y texto",
  image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2021/09/mejor-aplicacion-fondos-pantalla-animados-llegaria-android-dentro-poco-2482649.jpg?tf=3840x',
);

List<Note> notes = [
  note,
  note1,
  note2,
  note,
  note1,
  note2,
  note,
  note1,
  note2,
];
