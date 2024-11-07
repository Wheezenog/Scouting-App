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
class ScoutingButton extends StatefulWidget {
  String name = '';
  int pointValue = 0;
  BuildContext context;
  var minusButtonPressed;
  var plusButtonPressed;
  int counter;

  ScoutingButton(
      {super.key,
      required this.context,
      required this.name,
      required this.pointValue,
      required this.minusButtonPressed,
      required this.plusButtonPressed,
      required this.counter});

  @override
  State<ScoutingButton> createState() => _ScoutingButtonState();
}

class _ScoutingButtonState extends State<ScoutingButton> {
  var log = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 25,
            child: IconButton.filled(
              onPressed: () {
                setState(() {
                  widget.counter++;
                });
                widget.plusButtonPressed();
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
              setState(() {
                widget.counter++;
              });
              widget.plusButtonPressed();
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              semanticContainer: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Column(
                    children: [
                      Text(
                        widget.name,
                        textAlign: TextAlign.center,
                      ),
                      Text(widget.counter.toString())
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
                setState(() {
                  widget.counter--;
                });
                widget.minusButtonPressed();
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
