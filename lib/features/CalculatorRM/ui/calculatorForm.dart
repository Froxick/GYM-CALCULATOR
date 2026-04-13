import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/controllers/one_rm_controllers.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/data/exercise_selector_data.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/ui/exercise_selector.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/button.dart';
import 'package:flutter_new_progress_tracker/shared/ui/form_input.dart';

class Calculatorform extends StatefulWidget {
  final OneRmControllers controllers;
  final VoidCallback submit;
  final void Function(String value) changeSelectValue;

  const Calculatorform(
      {super.key,
      required this.controllers,
      required this.changeSelectValue,
      required this.submit});

  @override
  State<Calculatorform> createState() => CalculatorformState();
}

class CalculatorformState extends State<Calculatorform> {
  late OneRmControllers _controllers;

  String? _weightError;
  String? _repsError;
  String? _rirError;

  void _validateWeight() {
    setState(() {
      _weightError = _controllers.validateWeight();
    });
  }

  void _validateReps() {
    setState(() {
      _repsError = _controllers.validateReps();
    });
  }

  void _validateRir() {
    setState(() {
      _rirError = _controllers.validateRir();
    });
  }

  bool _checkValid() {
    if (_weightError != null || _repsError != null || _rirError != null)
      return false;
    if (!_controllers.validNotEmpty()) return false;
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controllers = widget.controllers;

    _controllers.weightController.addListener(_validateWeight);
    _controllers.repsController.addListener(_validateReps);
    _controllers.rirController.addListener(_validateRir);
  }

  @override
  void dispose() {
    _controllers.weightController.removeListener(_validateWeight);
    _controllers.repsController.removeListener(_validateReps);
    _controllers.rirController.removeListener(_validateRir);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
      width: width * 0.85,
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
      padding: EdgeInsets.all(26),
      child: Column(
        spacing: 10,
        children: [
          ExerciseSelector(
              listData: seletorExerciseData,
              selectedValue: _controllers.selectedExercise,
              changeSelectValue: widget.changeSelectValue),
          FormInput(
            controller: _controllers.weightController,
            placeholder: 'Вес',
            type: TextInputType.numberWithOptions(decimal: true),
            maxLength: 3,
            label: 'Вес',
            onChanged: (_) => _validateWeight(),
            errorText: _weightError,
          ),
          Row(
            children: [
              Expanded(
                child: FormInput(
                  controller: _controllers.repsController,
                  placeholder: 'Повторения',
                  type: TextInputType.number,
                  maxLength: 2,
                  label: 'Повторения',
                  onChanged: (_) => _validateReps(),
                  errorText: _repsError,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormInput(
                  controller: _controllers.rirController,
                  placeholder: 'Запас',
                  type: TextInputType.number,
                  maxLength: 1,
                  label: 'Запас',
                  onChanged: (_) => _validateRir(),
                  errorText: _rirError,
                ),
              )
            ],
          ),
          Button(
            text: 'Рассчитать',
            isValid: _checkValid(),
            onPress: widget.submit,
          )
        ],
      ),
    );
  }
}
