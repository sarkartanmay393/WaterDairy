import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class DailyWaterIntake {
  final String id;
  final double goal;
  final double intake;
  final bool completed;
  final double intakePercentage;

  const DailyWaterIntake({
    required this.id,
    this.intake = 0.0,
    this.goal = 0.0,
    this.completed = false,
    this.intakePercentage = 0.0,
  });
}

class WaterDairyDataFlow extends ChangeNotifier {
  DailyWaterIntake _dailyWaterIntake = DailyWaterIntake(id: uuid.v4());
  final List<DailyWaterIntake> _dailyWaterIntakeHistory = [];

  DailyWaterIntake get dailyWaterIntake => _dailyWaterIntake;

  void addIntake(double intake) {
    double currentIntake = _dailyWaterIntake.intake + intake;
    double percentage = currentIntake / _dailyWaterIntake.goal;
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = -0.01;
    }

    _dailyWaterIntake = DailyWaterIntake(
      id: _dailyWaterIntake.id,
      goal: _dailyWaterIntake.goal,
      intake: currentIntake,
      completed: currentIntake >= _dailyWaterIntake.goal,
      intakePercentage: percentage,
    );

    notifyListeners();
  }

  void setDailyGoal(double goal) {
    double percentage = _dailyWaterIntake.intake / goal;
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = -0.01;
    }

    _dailyWaterIntake = DailyWaterIntake(
      id: _dailyWaterIntake.id,
      goal: goal,
      intake: _dailyWaterIntake.intake,
      completed: _dailyWaterIntake.intake >= goal,
      intakePercentage: percentage,
    );

    notifyListeners();
  }

  void resetDailyWaterIntake() {
    _dailyWaterIntake = DailyWaterIntake(
      id: _dailyWaterIntake.id,
      goal: _dailyWaterIntake.goal,
      intake: 0.0,
      completed: false,
      intakePercentage: 0.0,
    );

    notifyListeners();
  }
}
