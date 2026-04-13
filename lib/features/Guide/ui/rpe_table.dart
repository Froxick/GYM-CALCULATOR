import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/Guide/data/rpe_list_item.dart';
import 'package:flutter_new_progress_tracker/features/Guide/ui/label_row.dart';
import 'package:flutter_new_progress_tracker/features/Guide/ui/rpe_row.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class RpeTable extends StatelessWidget {
  final List<RpeListItem> list;
  const RpeTable({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              LabelRow(),
              Column(
                children: list.map((item) => RpeRow(item: item)).toList(),
              ),
            ],
          ),
        ));
  }
}
