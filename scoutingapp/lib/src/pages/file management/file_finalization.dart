import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/drawer/sidebar.dart';
import 'package:scoutingapp/src/util/app_data.dart';

class FileFinalization extends StatefulWidget {
  const FileFinalization({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/home_page';

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
      body: Center(
          child: Column(
        children: [
          Text('Bucket Low count: ${AppData.bucketLowCount}',
              style: const TextStyle(fontSize: 20)),
          Text('Bucket High count: ${AppData.bucketHighCount}',
              style: const TextStyle(fontSize: 20)),
              Text('Net count: ${AppData.netCount}',
              style: const TextStyle(fontSize: 20))
        ],
      )),
    );
  }
}
