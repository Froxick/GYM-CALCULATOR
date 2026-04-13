import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/ui/percentageRow.dart';
import 'package:flutter_new_progress_tracker/shared/utils/numberFormater.dart';

class PercentageTable extends StatelessWidget {
  final double oneRm;
  final List<int> percentageList;
  const PercentageTable(
      {super.key, required this.oneRm, required this.percentageList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...percentageList.map((item) {
            final weight = oneRm * item / 100;
            return PercentageRow(
                percent: item.toString(),
                weight: NumberFormater.formatOneRM(weight));
          }),
        ],
      ),
    );
  }
}
