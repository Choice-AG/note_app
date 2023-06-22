import 'package:flutter/material.dart';
import 'package:note_app/core/controllers/theme_controller.dart';

class CheckTile extends StatefulWidget {
  final String title;
  bool? activate;
  final Function(bool)? onChanged;
  CheckTile({Key? key, this.title = "", this.activate = false, this.onChanged}) : super(key: key);

  @override
  State<CheckTile> createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeController.instance;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              activeColor: theme.primary(),
              value: widget.activate,
              onChanged: (value) {
                setState(() {
                  widget.activate = value;
                });
                widget.activate;
              }),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: theme.getColorText()),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
