import 'package:flutter/material.dart';

class FeaturesItem {
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onTap;

  FeaturesItem(
      {required this.icon,
      required this.onTap,
      required this.title,
      required this.subTitle});
}
