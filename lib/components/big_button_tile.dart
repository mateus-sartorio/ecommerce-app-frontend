import 'package:flutter/material.dart';

class BigButtonTile extends StatelessWidget {
  final String text;
  Function()? onPressed;

  BigButtonTile({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.black),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ));
  }
}
