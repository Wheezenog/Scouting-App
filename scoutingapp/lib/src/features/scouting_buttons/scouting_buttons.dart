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
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
      icon: const Icon(Icons.remove),
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      onPressed: () {
        minusButtonPressed();
      },
    ),
          Text(
            name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.normal,
            ),
          ),
         IconButton(
      icon: const Icon(Icons.add),
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      onPressed: () {
        plusButtonPressed();
      },
    ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.name});
  final String name;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

late bool isChecked;

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(widget.name),
      Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          })
    ]);
  }
}
