import 'package:note_app/core/constants/parameters.dart';

class Task {
  String? title;
  String? description;
  String? date;
  List<String>? urls;
  StateTask state;

  Task({
    this.title,
    this.description,
    this.date,
    this.urls,
    this.state = StateTask.create,
  });
}
