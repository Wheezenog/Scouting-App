import 'package:flutter/material.dart';
import 'package:scoutingapp/src/features/drawer/drawer_button.dart';
import 'package:scoutingapp/src/pages/data_page_graph_view.dart';
import 'package:scoutingapp/src/pages/file%20management/file_creation.dart';
import 'package:scoutingapp/src/pages/home_page.dart';
import 'package:scoutingapp/src/settings/settings_view.dart';

///creates a new [Drawer] widget populated with buttons created using the [drawer_button] class
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      width: 200,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              // Home button.
              CustomIconButton(icon: Icons.home, text: 'Home', route: HomePage.routeName),
              // Scouting Button.
              CustomIconButton(icon: Icons.add_chart, text: 'Scout', route: FileCreation.routeName),
              // Data view.
              CustomIconButton(icon: Icons.bar_chart, text: 'Data view', route: DataPageGraphView.routeName),
              Spacer(),
              // Settings button.
              CustomIconButton(icon: Icons.settings, text: 'Settings', route: SettingsView.routeName)
            ],
          ),
        ),
      ),
    );
  }
}
