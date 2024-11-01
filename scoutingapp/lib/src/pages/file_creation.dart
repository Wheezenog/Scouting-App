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
    List teamNumbers = ['3655', '8424', '6078', '3620', '6328'];
    List events = ['Escanaba', 'Lansing', 'States', 'Worlds', 'Goonettes'];

    String? numbersDefault = '3655';
    String? eventsDefault = 'Worlds';

    TextEditingController numberController = TextEditingController();
    TextEditingController eventController = TextEditingController();

    String numberSelected = '';
    String eventSelected = '';
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
      body: Center(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Select Team Number:',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w400)),
            DropdownMenu(
                controller: numberController,
                hintText: 'Select Team Number',
                enableFilter: true,
                width: 250,
                menuHeight: 150,
                initialSelection: numbersDefault,
                dropdownMenuEntries: teamNumbers
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList()),
            const SizedBox(height: 25),
            Text('Select Event:',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w400)),
            DropdownMenu(
                controller: eventController,
                hintText: 'Select Current Event',
                enableFilter: true,
                width: 250,
                menuHeight: 150,
                initialSelection: eventsDefault,
                dropdownMenuEntries: events
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList()),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    numberSelected = numberController.text;
                    eventSelected = eventController.text;
                  });
                },
                child: const Text('Create file!'))
          ]),
        ),
      ),
    );
  }
}
