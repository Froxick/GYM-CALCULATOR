import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/shared/constants/app_colors.dart';

class ExerciseSelector extends StatelessWidget {
  final List<String> listData;
  final String selectedValue;
  final void Function(String value) changeSelectValue;
  const ExerciseSelector(
      {super.key,
      required this.listData,
      required this.selectedValue,
      required this.changeSelectValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 5),
      decoration: BoxDecoration(
          color: AppColors.inputColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: const Color.fromARGB(255, 64, 65, 69), width: 1)),
      child: DropdownButton<String>(
          items: listData.map((item) {
            return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ));
          }).toList(),
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.accentColor,
          ),
          isExpanded: true,
          dropdownColor: AppColors.cardColor,
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16),
          value: selectedValue,
          onChanged: (value) {
            changeSelectValue(value!);
          }),
    );
  }
}
