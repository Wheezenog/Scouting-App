import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

Logger logWithStack = Logger(printer: PrettyPrinter());

var log = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _HomePageState extends State<HomePage> {
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
        title: const Text('Home'),
      ),
      drawer: const Sidebar(), // Custom made drawer class.
      body: const Placeholder(),
    );
  }
}
