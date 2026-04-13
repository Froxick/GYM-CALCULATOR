import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType type;
  final int maxLength;
  final String? label;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const FormInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.type,
      required this.maxLength,
      this.label,
      this.errorText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        TextField(
          controller: controller,
          maxLength: maxLength,
          onChanged: onChanged,
          keyboardType: type,
          inputFormatters: [
            if (type == TextInputType.numberWithOptions(decimal: true))
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            if (type == TextInputType.number)
              FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.grey),
              labelText: label,
              labelStyle: const TextStyle(
                color: AppColors.accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorText: errorText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: AppColors.borderColor, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.accentColor)),
              filled: true,
              fillColor: AppColors.inputColor),
        )
      ],
    );
  }
}
