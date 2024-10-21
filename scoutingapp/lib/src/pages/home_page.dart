import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/pages/data_page/data_page_graph_view.dart';
import 'package:scoutingapp/src/pages/scouting_page/field_scouting.dart';
import 'package:scoutingapp/src/settings/settings_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

Logger logWithStack = Logger(printer: PrettyPrinter());

var log = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          },
        ),
        title: const Text('Home'),
      ),
      drawer: Drawer(
        width: 200,
        child: Scaffold(
          body: Column(
            children: [
              DrawerButton(
                  icon: Icons.bar_chart,
                  text: 'View data',
                  route: DataPageGraphView.routeName), //data view button
              DrawerButton(
                  icon: Icons.add_chart,
                  text: 'Field Scout',
                  route: FieldScoutingPage.routeName), //field scouting button
              const Spacer(),
              DrawerButton(
                  icon: Icons.settings,
                  text: 'settings',
                  route: SettingsView.routeName) //settings button
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              log.d('Scouting Page');
              Navigator.restorablePushNamed(
                  context, FieldScoutingPage.routeName);
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            child: const Text('Begin Scouting'),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              log.d('Data Page');
              Navigator.restorablePushNamed(
                  context, DataPageGraphView.routeName);
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            child: const Text('View Data'),
          ),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}

/// A class that stores the data for the buttons to be used in the container.
// ignore: must_be_immutable
class DrawerButton extends StatelessWidget {
  IconData? icon;
  String? text = '';
  String? route = '';

  DrawerButton({super.key, this.icon, this.text, this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            iconSize: 25,
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.restorablePushNamed(context, route!);
            },
            icon: Icon(icon)),
        Text(text!)
      ],
    );
  }
}
