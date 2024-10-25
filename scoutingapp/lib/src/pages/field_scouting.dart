import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/features/scouting_buttons/scoring_methods.dart';
import 'package:scoutingapp/src/features/scouting_buttons/scouting_buttons.dart';

class FieldScoutingPage extends StatefulWidget {
  const FieldScoutingPage({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/field_scouting';

  @override
  State<FieldScoutingPage> createState() => _FieldScoutingPageState();
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));

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
      drawer: const Sidebar(), // Custom made drawer class.
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          generateButtonsFromMap(context, ScoringMethods.autoScoringMethods),
          generateButtonsFromMap(context, ScoringMethods.teleopScoringMethods),
          generateButtonsFromMap(context, ScoringMethods.endGameScoringMethods)
        ],
      ),
    );
  }
}

///Get the keys from a map and put them into a new list.
List keyListFromMap(Map map) {
  List keyList = map.keys.toList();
  return keyList;
}

///Get the values from a map and put them into a new list.
List valueListFromMap(Map map) {
  List valueList = map.values.toList();
  return valueList;
}

/// Generate a list of buttons from a map.
///
/// **Required Fields:**
/// + [context] BuildContext, not something that has to be made. The buttons use it for theme data.
/// + [map] The `Map<String, int>` that will be used to get data for the buttons
Widget generateButtonsFromMap(BuildContext context, Map map) {
  List keyList = keyListFromMap(map);
  List valueList = valueListFromMap(map);

  return ListView.builder(
      shrinkWrap: true,
      itemCount: map.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: ScoutingButton(
              context: context,
              name: keyList[index],
              pointValue: valueList[index],
              minusButtonPressed: () {
                log.d(keyList[index] +
                    ' Button Pressed, ' +
                    'Point Value: -' +
                    valueList[index].toString());
              },
              plusButtonPressed: () {
                log.d(keyList[index] +
                    ' Button Pressed, ' +
                    'Point Value: +' +
                    valueList[index].toString());
              }),
        );
      });
}
