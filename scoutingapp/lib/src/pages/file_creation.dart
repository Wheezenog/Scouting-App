import 'package:flutter/material.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/util/app_data.dart';

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

    bool numberEntered = false;
    bool eventEntered = false;

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Select Team Number:',
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400),
          ),
          DropdownMenu(
            controller: numberController,
            hintText: 'Select Team Number',
            enableFilter: true,
            width: 250,
            menuHeight: 150,
            initialSelection: numbersDefault,
            dropdownMenuEntries: teamNumbers
                .map((e) => DropdownMenuEntry(value: e, label: e))
                .toList(),
            requestFocusOnTap: true,
            onSelected: (value) {
              numberSelected = value.toString();
              numberEntered = true;
            },
          ),
          const SizedBox(height: 25),
          Text(
            'Select Event:',
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400),
          ),
          DropdownMenu(
            controller: eventController,
            hintText: 'Select Current Event',
            enableFilter: true,
            width: 250,
            menuHeight: 150,
            initialSelection: eventsDefault,
            dropdownMenuEntries: events
                .map((e) => DropdownMenuEntry(value: e, label: e))
                .toList(),
            requestFocusOnTap: true,
            onSelected: (value) {
              eventSelected = value.toString();
              eventEntered = true;
            },
          ),
          const SizedBox(height: 25),
          ElevatedButton(
              onPressed: () {
                if(numberController.text.isEmpty){
                  numberEntered = false;
                }
                if(eventController.text.isEmpty){
                  eventEntered = false;
                }
                if (numberEntered & eventEntered) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => ConfirmMessage(
                          numberSelected: numberSelected,
                          eventSelected: eventSelected));
                } else if (AppData.currentlyScouting) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const ScoutingInProgressMessage());
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const IncompleteDataMessage());
                }
              },
              child: const Text('Begin Scouting'))
        ]),
      ),
    );
  }
}

/// A popup message that checks if the user is ready to continue.
class ConfirmMessage extends StatelessWidget {
  const ConfirmMessage({
    super.key,
    required this.numberSelected,
    required this.eventSelected,
  });

  final String numberSelected;
  final String eventSelected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Affirm yes!!!!! 😛'),
      content: const Text('Begin scouting with new file?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            log.d('Cancel');
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            log.d('Create New File');
            Navigator.pop(context, 'Continue');
            AutoScoutingPage.createNewFile(numberSelected, eventSelected);
            Navigator.restorablePushNamed(context, AutoScoutingPage.routeName);
          },
          child: const Text('YES'),
        ),
      ],
    );
  }
}

//a popup error message that notifies the user that they did not fill out all the required fields.
class IncompleteDataMessage extends StatelessWidget {
  const IncompleteDataMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Incomplete Data'),
      content: const Text(
          'One or More of the required fields may not have been entered. Make sure you have both a team and an event selected.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            log.d('Continue');
            Navigator.pop(context);
          },
          child: const Text('Okay'),
        ),
      ],
    );
  }
}

/// A popup error message that notifies the user that scouting is already in progress.
class ScoutingInProgressMessage extends StatelessWidget {
  const ScoutingInProgressMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('File already created'),
      content: const Text(
          'you already have a scouting file in progress, are you sure you want to continue?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            log.d('Cancel');
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            log.d('Continue');
            Navigator.pop(context);
          },
          child: const Text('Okay'),
        ),
      ],
    );
  }
}
