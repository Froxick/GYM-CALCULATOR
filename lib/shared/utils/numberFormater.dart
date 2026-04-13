class NumberFormater {
  static String formatOneRM(double value) {
    double rounded = (value * 10).roundToDouble() / 10;

    if (rounded == rounded.roundToDouble()) {
      return rounded.round().toString();
    }

    return rounded.toString();
  }

  static String formatOneRMWithPrecision(double value, {int decimals = 1}) {
    double rounded =
        (value * (10 * decimals)).roundToDouble() / (10 * decimals);

    if (rounded == rounded.roundToDouble()) {
      return rounded.round().toString();
    }

    return rounded.toStringAsFixed(decimals);
  }

  static String formatWeight(double value) {
    return formatOneRM(value);
  }

  static double? parseOneRM(String value) {
    final cleaned = value.trim().replaceAll(',', '.');
    return double.tryParse(cleaned);
  }
}
