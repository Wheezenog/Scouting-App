import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/features/scouting_buttons/buttons_row.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';
import 'package:scoutingapp/src/util/scoring.dart';
import 'package:scoutingapp/src/util/app_data.dart';
import 'package:scoutingapp/src/util/json_functions.dart';

class AutoScoutingPage extends StatefulWidget {
  const AutoScoutingPage({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/Auto_scouting';

  @override
  State<AutoScoutingPage> createState() => _AutoScoutingPageState();

  static void createNewFile(String teamNumber, String event) {
    AppData.currentFileName = '${event}_$teamNumber';
    AppData.currentlyScouting = true;
    JsonFunctions(AppData.currentFileName);
  }
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));
Map<dynamic, dynamic> dataMap = {};
bool? isChecked = false;

class _AutoScoutingPageState extends State<AutoScoutingPage> {
  @override
  Widget build(BuildContext context) {
    dataMap.addAll(Scoring.allTimeScoringMethods);
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
          title: Center(child: Text(AppData.currentFileName))),
      drawer: const Sidebar(), // Custom made drawer class.
      body: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Currently Scouting: Auto',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )),
          const Expanded(
            child: ScoutingButtonRow()
          ),
          const Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Placeholder()],
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Colors.green),
                  onPressed: () {
                    AppData.currentPageName = 'teleop';
                    Navigator.restorablePushNamed(context, TeleopScoutingPage.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Teleop',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

// ///Get the keys from a map and put them into a new list.
// List keyListFromMap(Map map) {
//   List keyList = map.keys.toList();
//   return keyList;
// }

// ///Get the values from a map and put them into a new list.
// List valueListFromMap(Map map) {
//   List valueList = map.values.toList();
//   return valueList;
// }
