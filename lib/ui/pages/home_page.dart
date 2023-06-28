import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/core/constants/parameters.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/core/models/notes.dart';
import 'package:note_app/ui/pages/note_page.dart';
import 'package:note_app/ui/widgets/cards/custom_cards.dart';

GlobalKey<ScaffoldState> homePageKey = GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldMessengerState> homePageMessengerKey = GlobalKey<ScaffoldMessengerState>();

Color fontColor() {
  return ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const homePageRoute = "home_page";

  @override
  Widget build(BuildContext context) {
    final theme = ThemeController.instance;
    return Scaffold(
      backgroundColor: theme.background(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: fontColor(),
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: fontColor(),
              size: 25,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Notas',
            style: TextStyle(color: fontColor(), fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: StaggeredGridView.countBuilder(
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              if (notes[index].type == TypeNote.text) {
                return SimpleCard(
                  notes[index],
                  () => Navigator.pushNamed(context, NotePage.notePageRoute, arguments: NotePageArguments(note: notes[index])),
                );
              }
              if (notes[index].type == TypeNote.image) {
                return ImageCard(
                  notes[index],
                  () => Navigator.pushNamed(context, NotePage.notePageRoute, arguments: NotePageArguments(note: notes[index])),
                );
              }
              if (notes[index].type == TypeNote.textImage) {
                return TextImageCard(
                  notes[index],
                  () => Navigator.pushNamed(context, NotePage.notePageRoute, arguments: NotePageArguments(note: notes[index])),
                );
              }
              return Container();
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(1, index.isEven ? 1.3 : 1.9),
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
        )
      ],
    );
  }
}
