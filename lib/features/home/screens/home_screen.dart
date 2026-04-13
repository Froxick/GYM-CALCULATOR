import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/home/data/features_list.dart';
import 'package:flutter_new_progress_tracker/features/home/ui/featuresCard.dart';

import 'package:flutter_new_progress_tracker/shared/ui/screenTitle.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final features = getFeaturesList(context);
    return Scaffold(
      appBar: Screentitle(
        title: 'Привет, $name',
        subTitle: 'Хорошего дня!',
        viewBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            children: features.map((item) {
              return FeaturesCard(item: item);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
