import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class LabelRow extends StatelessWidget {
  const LabelRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'RPE',
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              'Запас',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              'Описание',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
