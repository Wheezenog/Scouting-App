import 'package:flutter/material.dart';
import 'package:scoutingapp/src/drawer/drawer_button.dart';
import 'package:scoutingapp/src/pages/data_page_graph_view.dart';
import 'package:scoutingapp/src/pages/home_page.dart';
import 'package:scoutingapp/src/pages/field_scouting.dart';
import 'package:scoutingapp/src/settings/settings_view.dart';

// ignore: must_be_immutable
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Scaffold(
        body: Column(
          children: [
            // Home button.
            CustomIconButton(icon: Icons.home, text: 'Home', route: HomePage.routeName),
            // Scouting Button.
            CustomIconButton(icon: Icons.add_chart, text: 'Scout', route: FieldScoutingPage.routeName),
            // Data view.
            CustomIconButton(icon: Icons.analytics, text: 'Data view', route: DataPageGraphView.routeName),
            const Spacer(),
            // Settings button.
            CustomIconButton(icon: Icons.settings, text: 'settings', route: SettingsView.routeName)
          ],
        ),
      ),
    );
  }
}