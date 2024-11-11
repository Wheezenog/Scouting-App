import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/features/scouting_buttons/buttons_row.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/endgame_scouting.dart';
import 'package:scoutingapp/src/util/app_data.dart';

class TeleopScouting extends StatefulWidget {
  static const routeName = '/Teleop_Scouting';
  const TeleopScouting({super.key});

  @override
  State<TeleopScouting> createState() => _TeleopScoutingState();
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));

class _TeleopScoutingState extends State<TeleopScouting> {
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
                      'Currently Scouting: Teleop',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )),
          const Expanded(
            child: ScoutingButtonRow(mode: 'teleop'),
          ),
          const Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Pretend there's teleop things here...")],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red),
                      onPressed: () {
                        AppData.currentPageName = 'auto';
                        Navigator.restorablePushNamed(
                            context, AutoScouting.routeName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Auto',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.green),
                      onPressed: () {
                        AppData.currentPageName = 'endgame';
                        Navigator.restorablePushNamed(
                            context, EndgameScouting.routeName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Endgame',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
