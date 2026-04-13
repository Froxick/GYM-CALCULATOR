import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/controllers/one_rm_controllers.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/ui/calculatorForm.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/ui/calculatorResult.dart';
import 'package:flutter_new_progress_tracker/features/CalculatorRM/utils/one_rm_calculator.dart';
import 'package:flutter_new_progress_tracker/shared/ui/screenTitle.dart';

class CalculatorRMscreen extends StatefulWidget {
  const CalculatorRMscreen({super.key});

  @override
  CalculatorRMscreenState createState() => CalculatorRMscreenState();
}

class CalculatorRMscreenState extends State<CalculatorRMscreen> {
  final OneRmControllers _controllers = OneRmControllers();
  double _oneRmResult = 0;

  void _selectValue(String value) {
    setState(() {
      _controllers.selectedExercise = value;
    });
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  void _calculateOneRm() {
    final numberInputs = _controllers.parseToNumber();
    if (numberInputs != null) {
      setState(() {
        _oneRmResult = OneRmCalculator.calculate(
            weight: numberInputs.weight,
            reps: numberInputs.reps,
            rir: numberInputs.rir,
            type: _controllers.selectedExercise.trim());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
        appBar: Screentitle(
          title: 'Калькулятор 1ПМ',
          viewBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: height * 0.05,
                children: [
                  Calculatorform(
                    controllers: _controllers,
                    changeSelectValue: _selectValue,
                    submit: _calculateOneRm,
                  ),
                  CalculatorResult(
                    oneRM: _oneRmResult,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
