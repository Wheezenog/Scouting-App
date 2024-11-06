import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  var name;
  var onChecked;
  var value;

  CustomCheckbox({super.key, required this.name, required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(name),
          Checkbox(
              value: value,
              onChanged: (value) {
                this.value = value;
                onChecked();
              })
        ],
      ),
    );
  }
}
