import 'package:flutter/material.dart';
import 'dialog.dart';

class HangmanGrid extends StatelessWidget {
  final String word;
  final List<String> guessedChars;
  final Function() restart;
  const HangmanGrid(
      {required this.word, required this.guessedChars, required this.restart});

  @override
  Widget build(BuildContext context) {
    List<String> letters = [];
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (guessedChars.contains(letter)) {
        letters.add(letter);
      } else if (letter == ' ') {
        letters.add(' ');
      } else {
        letters.add("_");
      }
    }

    if (letters.join() == word) {
      endDialog(context, "Guesser Win", restart);
    }
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          letters.join(" "),
        ),
      ),
    );
  }
}
