import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/Guide/data/rpe_list_item.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class RpeRow extends StatelessWidget {
  final RpeListItem item;

  const RpeRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 55, 57, 66), width: 0.5))),
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'RPE - ${item.rpe}',
              style: TextStyle(
                  color: item.color, fontSize: 18, fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              item.rir.toString(),
              style: TextStyle(color: AppColors.textColor, fontSize: 17),
              textAlign: TextAlign.center,
            )),
            Expanded(
                child: Text(
              item.description,
              style: TextStyle(color: AppColors.textColor, fontSize: 15),
              textAlign: TextAlign.right,
            ))
          ],
        ),
      ),
    );
  }
}
