import 'dart:math';

class OneRmCalculator {
  static double calculate({
    required double weight,
    required int reps,
    required int rir,
    required String type,
  }) {
    final totalReps = reps + rir;
    switch (type) {
      case 'Жим лежа':
        return weight * (36 / (37 - totalReps));
      case 'Присед':
        return weight * (1 + totalReps / 30);
      case 'Становая тяга':
        return weight * pow(totalReps, 0.10);
      default:
        return weight * (1 + totalReps / 30);
    }
  }
}
