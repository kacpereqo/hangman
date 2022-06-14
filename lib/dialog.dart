import 'package:flutter/material.dart';

void endDialog(BuildContext context, String title, Function restart) {
  Future.delayed(Duration.zero, () {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Play Again'),
                onPressed: () {
                  restart();
                  Navigator.pop(context);
                },
              )
            ],
          );
        }).then((_) => restart());
  });
}
