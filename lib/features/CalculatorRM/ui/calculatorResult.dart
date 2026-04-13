import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/percentage_table.dart';
import 'package:flutter_new_progress_tracker/shared/utils/numberFormater.dart';

class CalculatorResult extends StatelessWidget {
  final double oneRM;
  const CalculatorResult({super.key, required this.oneRM});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String oneRmString = NumberFormater.formatOneRM(oneRM);
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 118, 96, 41),
            blurRadius: 1,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
      ),
      padding: EdgeInsets.all(26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$oneRmStringкг',
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: PercentageTable(
                oneRm: oneRM, percentageList: [90, 80, 75, 65, 50]),
          )
        ],
      ),
    );
  }
}
