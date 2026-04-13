import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/controllers/coefficientInput.dart';
import 'package:flutter_new_progress_tracker/shared/utils/validatorForm.dart';

class CoefficientController {
  final TextEditingController weight = TextEditingController();
  final TextEditingController exerciseWeight = TextEditingController();

  void dispose() {
    weight.dispose();
    exerciseWeight.dispose();
  }

  bool validNoEmpty() {
    return weight.text.trim().isNotEmpty &&
        exerciseWeight.text.trim().isNotEmpty;
  }

  String? validWeight() {
    return ValidatorForm.validateNumber(weight.text,
        required: true, max: 200, min: 30);
  }

  String? validExerciseWeight() {
    return ValidatorForm.validateNumber(exerciseWeight.text,
        required: true, max: 600, min: 20);
  }

  CoefficientInput? parseNumber() {
    final int? intWeight = int.tryParse(weight.text.trim());
    final double? doubleExerciseWeight =
        double.tryParse(exerciseWeight.text.trim());

    if (intWeight == null || doubleExerciseWeight == null) return null;
    return CoefficientInput(
        weight: intWeight, exerciseWeight: doubleExerciseWeight);
  }
}
