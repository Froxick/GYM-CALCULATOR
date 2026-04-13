import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isValid;
  final VoidCallback? onPress;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  const Button(
      {super.key,
      required this.text,
      required this.isValid,
      this.onPress,
      this.height,
      this.width,
      this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
          onPressed: isValid ? onPress : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.accentColor,
            disabledBackgroundColor: const Color.fromARGB(255, 61, 61, 61),
            side: borderColor != null
                ? BorderSide(
                    color: borderColor!,
                    width: 1,
                  )
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: isValid ? 2 : 0,
          ),
          child: Text(
            text,
            style: TextStyle(
                color: isValid ? AppColors.buttonTextColor : AppColors.subColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}
