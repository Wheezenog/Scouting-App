import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scoutingapp/src/features/scouting_buttons/scouting_buttons.dart';

class ScoutingButtonRow extends StatelessWidget {
  const ScoutingButtonRow({super.key});

  
    static int bucketLowCount = 0;
   static  int bucketHighCount = 0;
    static int netCount = 0;
    static int clipLowCount = 0;
    static int clipHighCount = 0;

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
                log.d('Bucket Low Pressed (-)');
              },
              plusButtonPressed: () {
                log.d('Bucket Low pressed (+)');
              },
              counter: bucketLowCount ),
          ScoutingButton(
              context: context,
              name: 'Bucket High',
              pointValue: 5,
              minusButtonPressed: () {
                log.d('Bucket High Pressed (-)');
              },
              plusButtonPressed: () {
                log.d('Bucket High Pressed (+)');
              },
              counter: bucketHighCount ),
          ScoutingButton(
              context: context,
              name: 'Net',
              pointValue: 5,
              minusButtonPressed: () {
                log.d('Net Pressed (-)');
              },
              plusButtonPressed: () {
                log.d('Net Pressed (+)');
              },
              counter: netCount ),
          ScoutingButton(
              context: context,
              name: 'Clip Low',
              pointValue: 5,
              minusButtonPressed: () {
                log.d('Clip Low Pressed (-)');
              },
              plusButtonPressed: () {
                log.d('Clip Low Pressed (+)');
              },
              counter: clipHighCount ),
          ScoutingButton(
              context: context,
              name: 'Clip High',
              pointValue: 5,
              minusButtonPressed: () {
                log.d('Clip High Pressed (-)');
              },
              plusButtonPressed: () {
                log.d('Clip Low Pressed (-)');
              },
              counter: clipLowCount ,),
        ],
      ),
    );
  }
}
