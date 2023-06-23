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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              activeColor: ThemeController.instance.primary(),
              value: widget.activate,
              onChanged: (value) {
                setState(() {
                  widget.activate = value;
                });
                widget.onChanged;
              }),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
