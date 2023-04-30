import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// A read-only description of a todo-item
@immutable
class DailyWaterIntake {
  const DailyWaterIntake({
    required this.id,
    required this.intake,
    this.goal = 1000.0,
    this.completed = false,
    this.intakePercentage = 0.0,
  });

  final String id;
  final double goal;
  final double intake;
  final bool completed;
  final double intakePercentage;

  @override
  String toString() {
    return 'Daily Intake(Goal: $goal, intake: $intake, completed: $completed)';
  }
}

class DailyWaterIntakeController extends StateNotifier<DailyWaterIntake> {
  DailyWaterIntakeController()
      : super(DailyWaterIntake(id: _uuid.v4(), intake: 0));

  void setInitialGoal(double goal) {
    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: goal,
      intake: 1000.0,
      completed: false,
    );
  }

  void addIntake(double intakeAmount) {
    double currentIntake = state.intake + intakeAmount;
    double currentIntakePercentage = (currentIntake / state.goal);
    if (!(currentIntakePercentage > 0.0 && currentIntakePercentage <= 1.0)) {
      currentIntakePercentage = 0.0;
    }

    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: state.goal,
      intake: currentIntake,
      completed: currentIntake >= state.goal ? true : state.completed,
      intakePercentage: currentIntakePercentage,
    );
  }

  void resetIntake() {
    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: state.goal,
      intake: 0.0,
      completed: false,
      intakePercentage: 0.0,
    );
  }
}