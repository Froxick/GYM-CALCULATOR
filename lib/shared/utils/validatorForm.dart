class ValidatorForm {
  static String? validateNumber(String value,
      {bool required = true, int? max, int? min}) {
    if (required && value.isEmpty) return 'Обязательное поле';
    final number = double.tryParse(value);
    if (number == null) return 'Только цифры';
    if (min != null && number < min) return 'Минимум $min';
    if (max != null && number > max) return 'Максимум $max';

    return null;
  }
}
