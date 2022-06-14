import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final List<String> guessedChars;
  final Function(String) refresh;
  Keyboard({required this.guessedChars, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 13,
        children: <Widget>[
          for (int i = 0; i < 26; i++)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: !guessedChars.contains(String.fromCharCode(65 + i))
                    ? Colors.blue
                    : Colors.grey,
              ),
              child: Text(
                String.fromCharCode(65 + i),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                !guessedChars.contains(String.fromCharCode(65 + i))
                    ? refresh(String.fromCharCode(65 + i))
                    : null;
              },
            ),
        ],
      ),
    );
  }
}
