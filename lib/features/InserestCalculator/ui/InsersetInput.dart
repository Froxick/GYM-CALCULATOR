import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class InsersetInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final ValueChanged<String> onChange;
  final int maxLength;
  final String? errorText;

  const InsersetInput(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.maxLength,
      required this.placeholder,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      style: const TextStyle(
        color: AppColors.accentColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      onChanged: onChange,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ],
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 45,
        ),
        suffixText: 'кг',
        errorText: errorText,
        suffixStyle: const TextStyle(
          color: AppColors.accentColor,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.accentColor, width: 1)),
      ),
    );
  }
}
