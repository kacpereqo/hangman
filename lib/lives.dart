import 'package:flutter/material.dart';
import 'package:hangman/dialog.dart';

class LivesLeft extends StatelessWidget {
  final List<String> guessedChars;
  final Function() restart;
  final String word;
  LivesLeft(
      {required this.guessedChars, required this.restart, required this.word});

  @override
  Widget build(BuildContext context) {
    List<String> missedChars = [];
    for (int i = 0; i < guessedChars.length; i++) {
      if (!word.contains(guessedChars[i])) {
        missedChars.add(guessedChars[i]);
      }
    }
    int lives = 6 - missedChars.length;

    if (lives == 0) {
      endDialog(context, "Guesser Lose", restart);
    }

    return Text("Lives left: ${lives}");
  }
}
