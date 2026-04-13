import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/InserestCalculator/ui/InsersetInput.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/percentage_table.dart';
import 'package:flutter_new_progress_tracker/shared/ui/screenTitle.dart';

import 'package:flutter_new_progress_tracker/shared/utils/validatorForm.dart';

class InserestCalculatorScreen extends StatefulWidget {
  @override
  InserestCalculatorScreenState createState() =>
      InserestCalculatorScreenState();

  const InserestCalculatorScreen({super.key});
}

class InserestCalculatorScreenState extends State<InserestCalculatorScreen> {
  final TextEditingController controller = TextEditingController();
  String? error;

  void validate(String value) {
    setState(() {
      error = ValidatorForm.validateNumber(
        value,
        required: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double? parseOneRM = double.tryParse(controller.text);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: Screentitle(
        title: 'Проценты от 1ПМ',
        viewBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Container(
                width: width * 0.85,
                height: height * 0.7,
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: InsersetInput(
                          controller: controller,
                          onChange: validate,
                          maxLength: 3,
                          placeholder: '1ПМ',
                          errorText: error,
                        ),
                      ),
                      PercentageTable(
                          oneRm: parseOneRM ?? 0,
                          percentageList: [95, 90, 85, 80, 75, 70, 65, 60, 50])
                    ],
                  ),
                ))),
      )),
    );
  }
}
