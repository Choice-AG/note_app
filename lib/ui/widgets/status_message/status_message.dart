import 'package:flutter/material.dart';
import 'package:note_app/core/constants/parameters.dart';
import 'package:note_app/core/controllers/theme_controller.dart';
import 'package:note_app/ui/configure.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage(this.onTap, this.status, {Key? key}) : super(key: key);

  final Function() onTap;
  final StatusNetwork status;

  Color fontColor() => !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            status == StatusNetwork.noInternet ? "No hay una conexión a Internet" : "Ocurrió una excepción",
            style: TextStyle(color: fontColor(), fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(color: Configure.backgroundLight, borderRadius: BorderRadius.circular(150)),
            padding: const EdgeInsets.all(24),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(status == StatusNetwork.noInternet ? "assets/nointernet.png" : "assets/error.png"),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "Por favor inténtelo de nuevo",
                style: TextStyle(color: fontColor()),
              ),
              TextButton(
                onPressed: onTap,
                child: const Text("Recargar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
