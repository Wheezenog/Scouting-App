import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/scouting_buttons/scouting_buttons.dart';
import 'package:scoutingapp/src/util/app_data.dart';

class ScoutingButtonRow extends StatefulWidget {
  ScoutingButtonRow({super.key});

  @override
  State<ScoutingButtonRow> createState() => _ScoutingButtonRowState();
}

class _ScoutingButtonRowState extends State<ScoutingButtonRow> {
  @override
  Widget build(BuildContext context) {
    Logger log = Logger(printer: PrettyPrinter(methodCount: 0));
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScoutingButton(
            context: context,
            name: 'Bucket Low',
            pointValue: 5,
            minusButtonPressed: () {
              setState(() {
                AppData.bucketLowCount--;
                AppData.checkCountBelowZero();
              });
              log.d('Bucket Low Pressed (-)');
            },
            plusButtonPressed: () {
              setState(() {
                AppData.bucketLowCount++;
                AppData.checkCountBelowZero();
              });
              log.d('Bucket Low pressed (+)');
            },
            counter: AppData.bucketLowCount,
          ),
          ScoutingButton(
              context: context,
              name: 'Bucket High',
              pointValue: 5,
              minusButtonPressed: () {
                setState(() {
                  AppData.bucketHighCount--;
                  AppData.checkCountBelowZero();
                });
                log.d('Bucket High Pressed (-)');
              },
              plusButtonPressed: () {
                setState(() {
                  AppData.bucketHighCount++;
                  AppData.checkCountBelowZero();
                });
                log.d('Bucket High Pressed (+)');
              },
              counter: AppData.bucketHighCount),
          ScoutingButton(
              context: context,
              name: 'Net',
              pointValue: 5,
              minusButtonPressed: () {
                setState(() {
                  AppData.netCount--;
                  AppData.checkCountBelowZero();
                });
                log.d('Net Pressed (-)');
              },
              plusButtonPressed: () {
                setState(() {
                  AppData.netCount++;
                  AppData.checkCountBelowZero();
                });
                log.d('Net Pressed (+)');
              },
              counter: AppData.netCount),
          ScoutingButton(
              context: context,
              name: 'Clip Low',
              pointValue: 5,
              minusButtonPressed: () {
                setState(() {
                  AppData.clipLowCount--;
                  AppData.checkCountBelowZero();
                });
                log.d('Clip Low Pressed (-)');
              },
              plusButtonPressed: () {
                setState(() {
                  AppData.clipLowCount++;
                  AppData.checkCountBelowZero();
                });
                log.d('Clip Low Pressed (+)');
              },
              counter: AppData.clipLowCount),
          ScoutingButton(
            context: context,
            name: 'Clip High',
            pointValue: 5,
            minusButtonPressed: () {
              setState(() {
                AppData.clipHighCount--;
                AppData.checkCountBelowZero();
              });
              log.d('Clip High Pressed (-)');
            },
            plusButtonPressed: () {
              setState(() {
                AppData.clipHighCount++;
                AppData.checkCountBelowZero();
              });
              log.d('Clip High Pressed (+)');
            },
            counter: AppData.clipHighCount,
          ),
        ],
      ),
    );
  }
}