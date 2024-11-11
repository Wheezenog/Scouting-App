import 'package:flutter/material.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/endgame_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';
import 'package:scoutingapp/src/pages/file%20management/file_creation.dart';

class AppData {
  static bool currentlyScouting = false;
  static String currentFileName = '';
  static String currentFileNameWithSpace = currentFileName.replaceAll('_', ' ');
  static String currentPageName = '';

  static int autoBucketLowCount = 0;
  static int autoBucketHighCount = 0;
  static int autoNetCount = 0;
  static int autoClipLowCount = 0;
  static int autoClipHighCount = 0;

  static int bucketLowCount = 0;
  static int bucketHighCount = 0;
  static int netCount = 0;
  static int clipLowCount = 0;
  static int clipHighCount = 0;

  // Ensures that the counters will not be below zero
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
    if (autoBucketLowCount < 0) {
      autoBucketLowCount = 0;
    }
    if (autoBucketHighCount < 0) {
      autoBucketHighCount = 0;
    }
    if (autoNetCount < 0) {
      autoNetCount = 0;
    }
    if (autoClipLowCount < 0) {
      autoClipLowCount = 0;
    }
    if (autoClipHighCount < 0) {
      autoClipHighCount = 0;
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
        return const FileCreation();
    }
  }

  static void resetValues() {
    autoBucketLowCount = 0;
    autoBucketHighCount = 0;
    autoNetCount = 0;
    autoClipLowCount = 0;
    autoClipHighCount = 0;

    bucketLowCount = 0;
    bucketHighCount = 0;
    netCount = 0;
    clipLowCount = 0;
    clipHighCount = 0;
  }
}
