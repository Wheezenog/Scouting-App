import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/features/scouting_buttons/buttons_row.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';
import 'package:scoutingapp/src/pages/file%20management/file_finalization.dart';
import 'package:scoutingapp/src/util/app_data.dart';

class EndgameScouting extends StatefulWidget {
  static const routeName = '/endgame_Scouting';
  const EndgameScouting({super.key});

  @override
  State<EndgameScouting> createState() => _EndgameScoutingState();
}

Logger log = Logger(printer: PrettyPrinter(methodCount: 0));

class _EndgameScoutingState extends State<EndgameScouting> {
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
                      'Currently Scouting: Endgame',
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
            children: [Text("Pretend there's endgame things here...")],
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
                        backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, FileFinalization.routeName);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Review and complete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
