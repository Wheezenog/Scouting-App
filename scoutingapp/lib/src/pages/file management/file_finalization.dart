import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
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
                const Text('Please ensure that all entered values are correct.'),
                CounterText(counter: AppData.bucketLowCount, label: 'Bucket low'),
                CounterText(counter: AppData.bucketHighCount, label: 'Bucket high'),
                CounterText(counter: AppData.netCount, label: 'Net count'),
                CounterText(counter: AppData.clipLowCount, label: 'Clip low'),
                CounterText(counter: AppData.clipHighCount, label: 'Clip high'),
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
      padding: const EdgeInsets.all(8.0),
      child:
          Text('$label count: $counter', style: const TextStyle(fontSize: 20)),
    );
  }
}
