import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/home/models/features_item.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class FeaturesCard extends StatelessWidget {
  final FeaturesItem item;

  const FeaturesCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.all(30),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.subTitle,
                    style: TextStyle(color: AppColors.subColor, fontSize: 16),
                  )
                ],
              ),
            ),
            Icon(
              item.icon,
              size: 40,
              color: AppColors.accentColor,
            )
          ],
        ),
      ),
    );
  }
}
