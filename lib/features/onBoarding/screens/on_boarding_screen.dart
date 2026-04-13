import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/home/screens/home_screen.dart';
import 'package:flutter_new_progress_tracker/features/onBoarding/ui/welcome_input.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';
import 'package:flutter_new_progress_tracker/shared/ui/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _validateName(String value) {
    setState(() {
      if (value.trim().isEmpty) {
        _errorText = 'Пожалуйста введите имя';
      } else if (value.length < 2) {
        _errorText = 'Имя должно содержать минимум 2 символа';
      } else if (value.length > 50) {
        _errorText = 'Имя слишком длинное (максимум 14 символов)';
      } else if (!RegExp(r'^[a-zA-Zа-яА-Я\s]+$').hasMatch(value)) {
        _errorText = 'Имя может содержать только буквы';
      } else {
        _errorText = null;
      }
    });
  }

  void _hanldeSubmit(String value) {
    _saveName();
  }

  void _saveName() async {
    if (_errorText == null && controller.text.trim().isNotEmpty) {
      String name = controller.text.trim();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', name);

      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => HomeScreen(
                      name: name,
                    )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String name = controller.text.trim();
    final bool hasName = name.isNotEmpty;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final verticalSpacing = height * 0.03;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -90,
          right: -90,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentColor.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          bottom: -90,
          left: -90,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentColor.withOpacity(0.05),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_4,
                size: 100,
                color: AppColors.accentColor.withOpacity(0.7),
              ),
              Text(
                hasName ? '$name, добро пожаловать!' : 'Добро пожаловать',
                style: TextStyle(
                    fontSize: hasName ? 33 : 32,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (!hasName)
                Text(
                  'Пожалуйста представьтесь',
                  style: TextStyle(
                      color: AppColors.subColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              SizedBox(
                height: verticalSpacing,
              ),
              SizedBox(
                width: width * 0.8,
                child: WelcomeInput(
                  controller: controller,
                  placeholder: 'Введите имя',
                  labelText: 'Имя',
                  onChanged: _validateName,
                  errorText: _errorText,
                  maxLength: 12,
                  onSubmitted: _hanldeSubmit,
                ),
              ),
              SizedBox(
                height: verticalSpacing,
              ),
              Button(
                text: 'Продолжить',
                width: width * 0.8,
                isValid: hasName && _errorText == null,
                borderColor: const Color.fromARGB(255, 24, 24, 24),
                onPress: _saveName,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
