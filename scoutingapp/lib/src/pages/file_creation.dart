import 'package:flutter/material.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';

class FileCreation extends StatefulWidget {
  const FileCreation({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/file_creation';

  @override
  State<FileCreation> createState() => _FileCreationState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [];
  return menuItems;
}

class _FileCreationState extends State<FileCreation> {
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
        title: const Text('File Creation'),
      ),
      drawer: const Sidebar(),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}
