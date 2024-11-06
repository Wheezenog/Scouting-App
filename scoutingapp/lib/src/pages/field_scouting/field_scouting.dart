import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/custom_checkbox.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/util/scoring.dart';
import 'package:scoutingapp/src/features/scouting_buttons/scouting_buttons.dart';
import 'package:scoutingapp/src/util/app_data.dart';
import 'package:scoutingapp/src/util/json_functions.dart';

class FieldScoutingPage extends StatefulWidget {
  const FieldScoutingPage({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/field_scouting';

  @override
  State<FieldScoutingPage> createState() => _FieldScoutingPageState();

  static void createNewFile(String teamNumber, String event) {
    currentFileName = '${event}_$teamNumber';
    AppData.currentlyScouting = true;
    JsonFunctions(currentFileName);
  }
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));
Map<dynamic, dynamic> dataMap = {};
String currentFileName = '';
bool? isChecked = false;

class _FieldScoutingPageState extends State<FieldScoutingPage> {
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
            title: Text(currentFileName)),
        drawer: const Sidebar(), // Custom made drawer class.
        body: Column(
          children: [
            const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Auto',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScoutingButton(
                        context: context,
                        name: 'Bucket Low',
                        pointValue: 5,
                        minusButtonPressed: () {
                          log.d('Bucket Low Pressed (-)');
                        },
                        plusButtonPressed: () {
                          log.d('Bucket Low pressed (+)');
                        }),
                    ScoutingButton(
                        context: context,
                        name: 'Bucket High',
                        pointValue: 5,
                        minusButtonPressed: () {
                          log.d('Bucket High Pressed (-)');
                        },
                        plusButtonPressed: () {
                          log.d('Bucket High Pressed (+)');
                        }),
                    ScoutingButton(
                        context: context,
                        name: 'Net',
                        pointValue: 5,
                        minusButtonPressed: () {
                          log.d('Net Pressed (-)');
                        },
                        plusButtonPressed: () {
                          log.d('Net Pressed (+)');
                        }),
                    ScoutingButton(
                        context: context,
                        name: 'Clip Low',
                        pointValue: 5,
                        minusButtonPressed: () {
                          log.d('Clip Low Pressed (-)');
                        },
                        plusButtonPressed: () {
                          log.d('Clip Low Pressee (+)');
                        }),
                    ScoutingButton(
                        context: context,
                        name: 'Clip High',
                        pointValue: 5,
                        minusButtonPressed: () {
                          log.d('Clip High Pressed (-)');
                        },
                        plusButtonPressed: () {
                          log.d('Clip Low Pressed (-)');
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCheckbox(
                  name: 'Checkbox',
                  onChecked: () {
                    setState(() {
                    });
                  },
                )
              ],
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {
                    log.d('Teleop Button Pressed');
                  },
                  child: const Text('TeleOp.')),
            ),
          ],
        ));
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
