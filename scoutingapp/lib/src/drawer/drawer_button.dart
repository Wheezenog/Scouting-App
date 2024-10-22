// ignore: must_be_immutable
import 'package:flutter/material.dart';

/// Create a new button with given inputs.
///
/// **Required Fields:**
/// * [icon] The icon to be used with the button.
/// * [text] The text that will show next to the button
/// * [route] the route of the page that the button will redirect to.
///
///  ``` dart
/// CustomIconButton(icon: Icons.(icon), text: 'Some Text', route: ClassName.routeName)
/// ```
// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  IconData? icon;
  String? text = '';
  String? route = '';

  CustomIconButton(
      {super.key, required this.icon, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            iconSize: 25,
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.restorablePushNamed(context, route!);
            },
            icon: Icon(icon)),
        Text(text!)
      ],
    );
  }
}
