import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/screens/CalculatorRMScreen.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/screens/coefficientCalculatorScreen.dart';
import 'package:flutter_new_progress_tracker/features/Guide/screens/guide_screen.dart';
import 'package:flutter_new_progress_tracker/features/InserestCalculator/screens/InserestCalculatorScreen.dart';
import 'package:flutter_new_progress_tracker/features/home/models/features_item.dart';

List<FeaturesItem> getFeaturesList(BuildContext context) {
  return [
    FeaturesItem(
        icon: Icons.fitness_center,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CalculatorRMscreen()));
        },
        title: 'Калькулятор 1ПМ',
        subTitle: 'Узнайте свой максимум'),
    FeaturesItem(
        icon: Icons.percent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => InserestCalculatorScreen()));
        },
        title: 'Проценты от 1ПМ',
        subTitle: 'Узнайте проценты от максимума'),
    FeaturesItem(
        icon: Icons.calculate,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CoefficientCalculatorScreen()));
        },
        title: 'Коэффициент',
        subTitle: 'Узнайте свой коэффициент'),
    FeaturesItem(
        icon: Icons.book,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => GuideScreen()));
        },
        title: 'Справочник',
        subTitle: 'Полезная информация')
  ];
}
