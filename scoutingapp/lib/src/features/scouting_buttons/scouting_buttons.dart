import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// A class that stores individual data for the buttons to be used in the scouting page.
//ignore: must_be_immutable
class ScoutingButtons extends StatelessWidget {
  String name = '';
  int pointValue = 0;
  var buttonPressed;

  var log = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  ScoutingButtons(
      {super.key,
      required this.name,
      required this.pointValue,
      required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          log.d('$name button pressed');
        },
        child: Text(name));
  }
}
