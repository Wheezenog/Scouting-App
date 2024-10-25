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
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              minusButtonPressed;
            },
          ),
          Text(name),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              plusButtonPressed;
            },
          ),
        ],
      ),
    );
  }
}

// ElevatedButton(
//             onPressed: buttonPressed,
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//                 minimumSize: const Size(100, 45),
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                 )),
//             child: Text(name),
//           ),