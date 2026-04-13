import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class WelcomeInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final int maxLength;
  final String? labelText;
  final IconData? prefixIcon;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const WelcomeInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.maxLength,
      this.labelText,
      this.prefixIcon,
      this.errorText,
      this.onChanged,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: AppColors.accentColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            errorText: errorText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.borderColor, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.accentColor)),
            filled: true,
            fillColor: AppColors.inputColor),
        maxLength: maxLength);
  }
}
