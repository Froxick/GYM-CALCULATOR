import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/controllers/OneRmInput.dart';
import 'package:flutter_new_progress_tracker/shared/utils/validatorForm.dart';

class OneRmControllers {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController rirController = TextEditingController();
  String selectedExercise = 'Жим лежа';

  String? validateWeight() {
    return ValidatorForm.validateNumber(weightController.text.trim(),
        required: true, max: 500, min: 20);
  }

  String? validateReps() {
    return ValidatorForm.validateNumber(repsController.text.trim(),
        required: true, min: 2, max: 12);
  }

  String? validateRir() {
    return ValidatorForm.validateNumber(rirController.text.trim(),
        required: true, max: 5, min: 0);
  }

  OneRmInput? parseToNumber() {
    final weight = double.tryParse(weightController.text.trim());
    final reps = int.tryParse(repsController.text.trim());
    final rir = int.tryParse(rirController.text.trim());

    if (weight == null || reps == null || rir == null) return null;
    return OneRmInput(weight: weight, reps: reps, rir: rir);
  }

  bool validNotEmpty() {
    return weightController.text.trim().isNotEmpty &&
        repsController.text.trim().isNotEmpty &&
        rirController.text.trim().isNotEmpty;
  }

  void dispose() {
    weightController.dispose();
    repsController.dispose();
    rirController.dispose();
  }
}
