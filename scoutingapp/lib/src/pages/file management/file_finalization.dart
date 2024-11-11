import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/pages/file%20management/file_creation.dart';
import 'package:scoutingapp/src/util/app_data.dart';

class FileFinalization extends StatefulWidget {
  const FileFinalization({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/file_finalization';

  @override
  State<FileFinalization> createState() => _FileFinalizationState();
}

var log = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _FileFinalizationState extends State<FileFinalization> {
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
        title: const Text('Complete Scouting'),
      ),
      drawer: const Sidebar(), // Custom made drawer class.
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                    'Please ensure that all entered values are correct.'),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Autonomous: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                ),
                CounterText(
                    counter: AppData.autoBucketLowCount,
                    label: 'Bucket low auto'),
                CounterText(
                    counter: AppData.autoBucketHighCount,
                    label: 'Bucket high auto'),
                CounterText(
                    counter: AppData.autoNetCount, label: 'Net count auto'),
                CounterText(
                    counter: AppData.autoClipLowCount, label: 'Clip low auto'),
                CounterText(
                    counter: AppData.autoClipHighCount,
                    label: 'Clip high auto'),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Teleop / endgame: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                ),
                CounterText(
                    counter: AppData.bucketLowCount, label: 'Bucket low'),
                CounterText(
                    counter: AppData.bucketHighCount, label: 'Bucket high'),
                CounterText(counter: AppData.netCount, label: 'Net count'),
                CounterText(counter: AppData.clipLowCount, label: 'Clip low'),
                CounterText(counter: AppData.clipHighCount, label: 'Clip high'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.restorablePushNamed(
                            context, FileCreation.routeName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        AppData.currentPageName = '';
                        AppData.currentlyScouting = false;
                        AppData.resetValues();
                        Navigator.restorablePushNamed(
                            context, FileCreation.routeName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Complete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  final int counter;
  final String label;
  const CounterText({super.key, required this.counter, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child:
          Text('$label count: $counter', style: const TextStyle(fontSize: 24)),
    );
  }
}
