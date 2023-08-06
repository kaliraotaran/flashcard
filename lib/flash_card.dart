import 'package:flutter/material.dart';

class Flashcard extends StatelessWidget {
  const Flashcard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
      )),
    );
  }
}
