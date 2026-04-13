import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/controllers/coefficientController.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/controllers/coefficientInput.dart';
import 'package:flutter_new_progress_tracker/features/CoefficientCalculator/ui/coefficientCalculatorForm.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/screenTitle.dart';
import 'package:flutter_new_progress_tracker/shared/utils/numberFormater.dart';

class CoefficientCalculatorScreen extends StatefulWidget {
  const CoefficientCalculatorScreen({super.key});

  @override
  CoefficientCalculatorScreenState createState() =>
      CoefficientCalculatorScreenState();
}

class CoefficientCalculatorScreenState
    extends State<CoefficientCalculatorScreen> {
  final CoefficientController controllers = CoefficientController();
  double _coefficient = 0.0;

  void calculate() {
    final CoefficientInput? param = controllers.parseNumber();
    setState(() {
      if (param == null) return;
      _coefficient = param.exerciseWeight / param.weight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
        appBar: Screentitle(title: 'Коэффициент', viewBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                spacing: 20,
                children: [
                  Container(
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.cardColor,
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
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            NumberFormater.formatOneRM(_coefficient),
                            style: TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  CoefficientCalculatorform(
                    controllers: controllers,
                    submit: calculate,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
