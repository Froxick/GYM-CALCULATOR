import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/Guide/data/rpe_list.dart';
import 'package:flutter_new_progress_tracker/features/Guide/ui/rpe_table.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/screenTitle.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Screentitle(title: 'Справочник', viewBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          spacing: 10,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color.fromARGB(255, 57, 57, 60),
                        width: 1)),
              ),
              child: Text('Система RPE',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor,
                  )),
            ),
            RpeTable(list: rpeList)
          ],
        ),
      )),
    );
  }
}
