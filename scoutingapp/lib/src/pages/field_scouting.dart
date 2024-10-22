import 'package:flutter/material.dart';
import 'package:scoutingapp/src/drawer/sidebar.dart';

class FieldScoutingPage extends StatefulWidget {
  const FieldScoutingPage({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/field_scouting';

  @override
  State<FieldScoutingPage> createState() => _FieldScoutingPageState();
}

class _FieldScoutingPageState extends State<FieldScoutingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  // Open the drawer when icon button is clicked.
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          },
        ),
        title: const Text('Field scouting'),
      ),
      drawer: const Sidebar(), //New custom made drawer class.
      body: const Placeholder(),
    );
  }
}