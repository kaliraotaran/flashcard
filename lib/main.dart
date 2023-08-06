import 'package:flashcard/flash_card.dart';
import 'package:flashcard/flashcard_data.dart';
import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<FlashcardData> _flashcardData = [
    FlashcardData('what language does flutter use', 'Dart'),
    FlashcardData('who was in paris', '....'),
    FlashcardData('who you gonna call', 'Ghostbusters')
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: FlipCard(
                  front:
                      Flashcard(text: _flashcardData[_currentIndex].question),
                  back: Flashcard(text: _flashcardData[_currentIndex].answer)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: ShowPrevCard,
                  label: Text('Prev'),
                  icon: Icon(Icons.chevron_left),
                ),
                OutlinedButton.icon(
                  onPressed: Shownextcard,
                  label: Text('Next'),
                  icon: Icon(Icons.chevron_right),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void Shownextcard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcardData.length ? _currentIndex + 1 : 0;
    });
  }

  void ShowPrevCard() {
    setState(() {
      _currentIndex = _currentIndex - 1 >= 0
          ? _currentIndex - 1
          : _flashcardData.length - 1;
    });
  }
}
