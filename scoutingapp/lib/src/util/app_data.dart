import 'package:flutter/material.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/endgame_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';

class AppData {
  static bool currentlyScouting = false;
  static String currentFileName = '';
  static String currentPageName = '';

  static int bucketLowCount = 0;
  static int bucketHighCount = 0;
  static int netCount = 0;
  static int clipLowCount = 0;
  static int clipHighCount = 0;

  static void checkCountBelowZero() {
    if (bucketLowCount < 0) {
      bucketLowCount = 0;
    }
    if (bucketHighCount < 0) {
      bucketHighCount = 0;
    }
    if (netCount < 0) {
      netCount = 0;
    }
    if (clipLowCount < 0) {
      clipLowCount = 0;
    }
    if (clipHighCount < 0) {
      clipHighCount = 0;
    }
  }

  static StatefulWidget currentScoutingPage() {
    switch (currentPageName) {
      case 'auto':
        return const AutoScouting();
      case 'teleop':
        return const TeleopScouting();
        case 'endgame':
        return const EndgameScouting();
      default:
        return const AutoScouting();
    }
  }
}
