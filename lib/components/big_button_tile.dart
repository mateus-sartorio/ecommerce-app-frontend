import 'package:flutter/material.dart';

class BigButtonTile extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isSolid;

  const BigButtonTile(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isSolid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = isSolid ? Colors.black : Colors.transparent;
    Color? textColor = isSolid ? Colors.white : Colors.black;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
        ));
  }
}
