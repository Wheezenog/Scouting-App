import 'package:flutter/material.dart';
import 'package:scoutingapp/src/Pages/home_page.dart';
import 'package:scoutingapp/src/pages/data_page/data_page_graph_view.dart';
import 'package:scoutingapp/src/settings/settings_view.dart';

class FieldScoutingPage extends StatefulWidget {
  const FieldScoutingPage({super.key});
  static const routeName = '/field_scouting';

  @override
  State<FieldScoutingPage> createState() => _FieldScoutingPageState();
}

class _FieldScoutingPageState extends State<FieldScoutingPage> {
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
        title: const Text('Field scouting'),
      ),
      drawer: Drawer(
        width: 200,
        child: Scaffold(
          body: Column(
            children: [
              DrawerButton(
                  icon: Icons.home,
                  text: 'Home',
                  route: HomePage.routeName), //home button
              DrawerButton(
                  icon: Icons.bar_chart,
                  text: 'View data',
                  route: DataPageGraphView.routeName), // field scouting button
              const Spacer(),
              DrawerButton(
                icon: Icons.settings,
                text: 'settings',
                route: SettingsView.routeName,
              ), // settings button
            ],
          ),
        ),
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
