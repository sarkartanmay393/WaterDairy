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
  final Map<String, dynamic> _otherStateObjects = {
    "tabIndex": 0,
  };

  DailyWaterIntake get dailyWaterIntake => _dailyWaterIntake;
  Map<String, dynamic> get otherStateObjects => _otherStateObjects;
  int get tabIndex => _otherStateObjects["tabIndex"];

  void addIntake(double intake) {
    double percentage =
        _dailyWaterIntake.intake + intake / _dailyWaterIntake.goal;
    if (percentage > 1.0) {
      percentage = 1.0;
    } else if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    _dailyWaterIntake = DailyWaterIntake(
      id: _dailyWaterIntake.id,
      goal: _dailyWaterIntake.goal,
      intake: _dailyWaterIntake.intake + intake,
      completed: _dailyWaterIntake.intake + intake >= _dailyWaterIntake.goal,
      intakePercentage: percentage,
    );
    notifyListeners();
  }

  void addDailyGoal(double goal) {
    double percentage = _dailyWaterIntake.intake / goal;
    if (percentage > 1.0) {
      percentage = 1.0;
    } else if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    _dailyWaterIntake = DailyWaterIntake(
      id: uuid.v4(),
      goal: goal,
      intake: _dailyWaterIntake.intake,
      completed: _dailyWaterIntake.intake >= goal,
      intakePercentage: percentage,
    );
    notifyListeners();
  }

  void setDailyWaterIntake(DailyWaterIntake dailyWaterIntake) {
    _dailyWaterIntake = DailyWaterIntake(
      id: dailyWaterIntake.id,
      goal: dailyWaterIntake.goal,
      intake: dailyWaterIntake.intake,
      completed: _dailyWaterIntake.intake >= _dailyWaterIntake.goal,
      intakePercentage: _dailyWaterIntake.intakePercentage,
    );
    notifyListeners();
  }

  void resetDailyWaterIntake() {
    _dailyWaterIntake = DailyWaterIntake(id: uuid.v4());
    notifyListeners();
  }

  void changeTabIndex(int index) {
    _otherStateObjects["tabIndex"] = index;
    notifyListeners();
  }
}
