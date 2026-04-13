import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class Screentitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final bool viewBackArrow;
  const Screentitle(
      {super.key,
      required this.title,
      this.subTitle,
      required this.viewBackArrow});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: viewBackArrow
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                color: AppColors.accentColor,
              )
            : null,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            if (subTitle != null)
              Text(
                subTitle ?? '',
                style: TextStyle(color: AppColors.subColor, fontSize: 16),
              )
          ],
        ));
  }
}
