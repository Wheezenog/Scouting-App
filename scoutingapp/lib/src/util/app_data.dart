import 'package:flutter/material.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';

class AppData {
  static bool currentlyScouting = false;
  static String currentFileName = '';
  static String currentPageName = '';
  

  static StatefulWidget currentScoutingPage() {
    switch (currentPageName) {
      case 'auto':
        return const AutoScoutingPage();
      case 'teleop':
        return const TeleopScoutingPage();
      default:
      return const AutoScoutingPage();
    }
  }
}
