import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/controllers/coefficientController.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/button.dart';
import 'package:flutter_new_progress_tracker/shared/ui/form_input.dart';

class CoefficientCalculatorform extends StatefulWidget {
  final CoefficientController controllers;
  final VoidCallback submit;

  const CoefficientCalculatorform(
      {super.key, required this.controllers, required this.submit});

  @override
  CoefficientCalculatorFormState createState() =>
      CoefficientCalculatorFormState();
}

class CoefficientCalculatorFormState extends State<CoefficientCalculatorform> {
  late CoefficientController _controllers;
  String? _weightError;
  String? _exerciseWeightError;

  void _validateWeight() {
    setState(() {
      _weightError = _controllers.validWeight();
    });
  }

  void _validateExerciseWeight() {
    setState(() {
      _exerciseWeightError = _controllers.validExerciseWeight();
    });
  }

  bool _checkValid() {
    if (_weightError != null || _exerciseWeightError != null) return false;
    if (!_controllers.validNoEmpty()) return false;
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controllers = widget.controllers;

    _controllers.exerciseWeight.addListener(_validateExerciseWeight);
    _controllers.weight.addListener(_validateWeight);
  }

  @override
  void dispose() {
    _controllers.weight.removeListener(_validateWeight);
    _controllers.exerciseWeight.removeListener(_validateExerciseWeight);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Container(
        height: height * 0.3,
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
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            children: [
              FormInput(
                controller: _controllers.weight,
                placeholder: 'Собственный вес',
                type: TextInputType.number,
                maxLength: 3,
                errorText: _weightError,
                onChanged: (_) => _validateWeight,
                label: 'Собственный вес',
              ),
              FormInput(
                controller: _controllers.exerciseWeight,
                placeholder: 'Вес',
                type: TextInputType.numberWithOptions(decimal: true),
                maxLength: 3,
                errorText: _exerciseWeightError,
                onChanged: (_) => _validateExerciseWeight(),
                label: 'Вес',
              ),
              Button(
                text: 'Рассчитать',
                isValid: _checkValid(),
                onPress: widget.submit,
              )
            ],
          ),
        ));
  }
}
