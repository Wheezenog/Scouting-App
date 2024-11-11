import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/features/scouting_buttons/buttons_row.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';
import 'package:scoutingapp/src/util/scoring.dart';
import 'package:scoutingapp/src/util/app_data.dart';
import 'package:scoutingapp/src/util/json_functions.dart';

class AutoScouting extends StatefulWidget {
  const AutoScouting({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/Auto_scouting';

  @override
  State<AutoScouting> createState() => _AutoScoutingState();

  static void createNewFile(String teamNumber, String event) {
    AppData.currentFileName = '${teamNumber}_$event';
    AppData.currentlyScouting = true;
    JsonFunctions(AppData.currentFileName);
  }
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));
Map<dynamic, dynamic> dataMap = {};
bool? isChecked = false;

class _AutoScoutingState extends State<AutoScouting> {
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
          title: Center(child: Text(AppData.currentFileNameWithSpace))),
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
            ),
          ),
          const Expanded(
            child: ScoutingButtonRow(mode: 'auto'),
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Pretend there's auto things here...")],
            ),
          ),
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
                  Navigator.restorablePushNamed(
                      context, TeleopScouting.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Teleop',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
