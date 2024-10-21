import 'package:flutter/material.dart';
import 'package:scoutingapp/src/pages/home_page.dart';
import 'package:scoutingapp/src/pages/scouting_page/field_scouting.dart';
import 'package:scoutingapp/src/settings/settings_view.dart';

class DataPageGraphView extends StatefulWidget {
  const DataPageGraphView({super.key});

  static const routeName = '/data_page';

  @override
  State<DataPageGraphView> createState() => _DataPageGraphViewState();
}

class _DataPageGraphViewState extends State<DataPageGraphView> {
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
        title: const Text('Data view'),
      ),
      drawer: Drawer(
        width: 200,
        child: Scaffold(
          body: Column(
            children: [
              DrawerButton(
                  icon: Icons.home,
                  text: 'Home',
                  route: HomePage.routeName), // home button
              DrawerButton(
                  icon: Icons.add_chart,
                  text: 'Field Scout',
                  route: FieldScoutingPage.routeName), //field scouting button
              const Spacer(),
              DrawerButton(
                icon: Icons.settings,
                text: 'settings',
                route: SettingsView.routeName,
              ) //settings button
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
