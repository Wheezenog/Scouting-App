// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Create a new button with given inputs.
///
/// **Required Fields:**
/// * [name] The name assigned to the button.
/// * [pointValue] The point value assigned to the button.
/// * [buttonPressed] What this button will do when it is pressed.
///
///  ``` dart
/// CustomIconButton(
///         name: 'Name',
///         pointValue: 5,
///         buttonPressed: () {
///         doSomething();
///          }),
///       );
/// ```
class ScoutingButton extends StatelessWidget {
  final String name;
  final int pointValue;
  final BuildContext context;
  final minusButtonPressed;
  final plusButtonPressed;
  final int counter;

  ScoutingButton(
      {super.key,
      required this.context,
      required this.name,
      required this.pointValue,
      required this.minusButtonPressed,
      required this.plusButtonPressed,
      required this.counter});

  final log = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 125,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 25,
            child: IconButton.filled(
              onPressed: () {
                plusButtonPressed();
              },
              style: IconButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              icon: const Icon(
                Icons.add,
                size: 10,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              plusButtonPressed();
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              semanticContainer: true,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Column(
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(counter.toString(), style: const TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 25,
            child: IconButton.filled(
              onPressed: () {
                minusButtonPressed();
              },
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              icon: const Icon(
                Icons.remove,
                size: 10,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
