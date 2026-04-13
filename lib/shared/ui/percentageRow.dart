import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class PercentageRow extends StatelessWidget {
  final String percent;
  final String weight;
  const PercentageRow({super.key, required this.percent, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 55, 57, 66), width: 0.5))),
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
        child: Row(
          children: [
            Expanded(
                child: Text(
              '$percent%',
              style: TextStyle(color: AppColors.textColor, fontSize: 18),
            )),
            Expanded(
                child: Text(
              '$weightкг',
              style: TextStyle(color: AppColors.accentColor, fontSize: 18),
              textAlign: TextAlign.right,
            ))
          ],
        ),
      ),
    );
  }
}
