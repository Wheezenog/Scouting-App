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
//ignore: must_be_immutable
class ScoutingButton extends StatelessWidget {
  String name = '';
  int pointValue = 0;
  BuildContext context;
  var minusButtonPressed;
  var plusButtonPressed;

  var log = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
  ScoutingButton(
      {super.key,
      required this.context,
      required this.name,
      required this.pointValue,
      required this.minusButtonPressed,
      required this.plusButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 25,
            child: IconButton.filled(
              onPressed: plusButtonPressed,
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
            onTap: plusButtonPressed,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              semanticContainer: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 25,
            child: IconButton.filled(
              onPressed: minusButtonPressed,
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
