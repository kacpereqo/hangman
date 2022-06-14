import 'package:flutter/material.dart';
import 'package:hangman/grid.dart';
import 'package:hangman/lives.dart';

import 'keyboard.dart';

class FriendPlay extends StatefulWidget {
  @override
  State<FriendPlay> createState() => _FriendPlayState();
}

class _FriendPlayState extends State<FriendPlay> {
  List<String> guessedChars = [];

  void addChar(String char) {
    setState(() {
      guessedChars.add(char);
    });
  }

  void reset() {
    setState(() {
      guessedChars = [];
    });
  }

  String _word = "IMAGINACJA TADEUSZA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Column(
        children: [
          HangmanGrid(
            word: _word,
            guessedChars: guessedChars,
            restart: reset,
          ),
          SizedBox(height: 16),
          LivesLeft(guessedChars: guessedChars, restart: reset, word: _word),
          Spacer(),
          Keyboard(
            refresh: addChar,
            guessedChars: guessedChars,
          ),
        ],
      ),
    );
  }
}
